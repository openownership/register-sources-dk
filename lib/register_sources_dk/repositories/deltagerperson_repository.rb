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
            index: index,
            body: {
              query: {
                bool: {
                  must: [
                    {
                      match: {
                        "etag": {
                          query: etag
                        }
                      }
                    }
                  ]
                }
              }
            }
          )
        ).first&.record
      end

      def store(records)
        return true if records.empty?

        operations = records.map do |record|
          raise 'no etag' unless record.etag

          {
            index:  {
              _index: index,
              _id: record.etag,
              data: {
                Vrdeltagerperson: record.to_h,
                etag: record.etag
              }
            }
          }
        end

        result = client.bulk(body: operations)

        if result['errors']
          print "Error result: ", result, "\n\n"
          raise ElasticsearchError, errors: result['errors']
        end

        true
      end

      def get_by_bods_identifiers(identifiers)
        # Person Statement
        #[
        #  RegisterSourcesBods::Identifier.new(
        #    id: dk_record.enhedsNummer.to_s,
        #    schemeName: 'DK Centrale Virksomhedsregister',
        #  )
        #]

        # Child Entity Statement
        # https://github.com/openownership/register-transformer-dk/blob/master/lib/register_transformer_dk/bods_mapping/record_processor.rb
        # RegisterSourcesBods::Identifier.new(
        #  scheme: 'DK-CVR',
        #  schemeName: 'Danish Central Business Register',
        #  id: company_number # relation[:company].cvrNummer.to_s
        #)
        # dk_record.virksomhedSummariskRelation.each_with_object([]) do |item, acc|
        # item.virksomhed
        # relation[:company].cvrNummer.to_s

        company_ids = []
        person_ids = []
        identifiers.each do |identifier|
          case identifier.schemeName
          when 'DK Centrale Virksomhedsregister'
            person_ids << identifier.id
          when 'Danish Central Business Register'
            company_ids << identifier.id
          end
        end

        return [] if company_ids.empty? && person_ids.empty?

        process_results(
          client.search(
            index: index,
            body: {
              query: {
                bool: {
                  should: company_ids.map { |company_id|
                    {
                      bool: {
                        must: [
                          { match: { "company_number": { query: company_id } } },
                        ]
                      }
                    }
                  } + company_ids.map { |company_id|
                    {
                      bool: {
                        must: [
                          {
                            nested: {
                              path: "data.identification",
                              query: {
                                bool: {
                                  must: [
                                    { match: { "data.identification.registration_number": { query: company_id } } },
                                  ]
                                }
                              }
                            }
                          }
                        ]
                      }
                    }
                  } + links.map { |link|
                    {
                      bool: {
                        must: [
                          {
                            nested: {
                              path: "data.links",
                              query: {
                                bool: {
                                  must: [
                                    { match: { "data.links.self": { query: link } } },
                                  ]
                                }
                              }
                            }
                          }
                        ]
                      }
                    }
                  }
                }
              }
            }
          )
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
