require 'register_sources_dk/config/elasticsearch'

require 'register_sources_dk/structs/deltagerperson'

module RegisterSourcesDk
  module Repositories
    class DeltagerpersonRepository
      UnknownRecordKindError = Class.new(StandardError)
      ElasticsearchError = Class.new(StandardError)

      SearchResult = Struct.new(:record, :score)

      def initialize(client: Config::ELASTICSEARCH_CLIENT, index: Config::DELTAGERPERSON_ES_INDEX)
        @client = client
        @index = index
      end

      def get(etag)
        process_results(
          client.search(
            index:,
            body: {
              query: {
                bool: {
                  must: [
                    {
                      match: {
                        etag: {
                          query: etag,
                        },
                      },
                    },
                  ],
                },
              },
            },
          ),
        ).first&.record
      end

      def store(records)
        return true if records.empty?

        operations = records.map do |record|
          raise 'no etag' unless record.etag

          {
            index: {
              _index: index,
              _id: record.etag,
              data: {
                Vrdeltagerperson: record.to_h,
                etag: record.etag,
              },
            },
          }
        end

        result = client.bulk(body: operations)

        if result['errors']
          print "Error result: ", result, "\n\n"
          raise ElasticsearchError, errors: result['errors']
        end

        true
      end

      def get_by_bods_identifiers(identifiers, per_page: nil)
        enheds_nummers = [] # enhedsNummer
        cvrs = [] # virksomhedSummariskRelation.virksomhed.cvrNummer
        identifiers.each do |identifier|
          case identifier.schemeName
          when 'Danish Central Business Register'
            cvrs << identifier.id
          when 'DK Centrale Virksomhedsregister'
            enheds_nummers << identifier.id
          end
        end

        return [] if cvrs.empty? && enheds_nummers.empty?

        process_results(
          client.search(
            index:,
            body: {
              query: {
                bool: {
                  should: enheds_nummers.map { |id|
                    {
                      bool: {
                        must: [
                          { match: { 'Vrdeltagerperson.enhedsNummer': { query: id.to_i } } },
                        ],
                      },
                    }
                  } + cvrs.map do |id|
                    {
                      bool: {
                        must: [
                          { match: { 'Vrdeltagerperson.virksomhedSummariskRelation.virksomhed.cvrNummer': { query: id.to_i } } },
                        ],
                      },
                    }
                  end,
                },
              },
              size: per_page || 10_000,
            },
          ),
        ).map(&:record)
      end

      private

      attr_reader :client, :index

      def process_results(results)
        hits = results.dig('hits', 'hits') || []
        hits = hits.sort { |hit| hit['_score'] }.reverse

        mapped = hits.map do |hit|
          SearchResult.new(map_es_record(hit['_source']), hit['_score'])
        end

        mapped.sort_by(&:score).reverse
      end

      def map_es_record(record)
        Deltagerperson[record['Vrdeltagerperson']]
      end
    end
  end
end
