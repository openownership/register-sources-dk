require 'json'
require 'register_sources_dk/config/elasticsearch'

module RegisterSourcesDk
  module Services
    class EsIndexCreator
      DEFAULT_MAPPINGS_PATH = File.absolute_path(File.join(File.expand_path(__FILE__), '../mappings/vrdeltagerperson.json'))

      def initialize(
        client: Config::ELASTICSEARCH_CLIENT,
        es_index: Config::DELTAGERPERSON_ES_INDEX,
        mappings_path: DEFAULT_MAPPINGS_PATH
      )
        @client = client
        @es_index = es_index
        @mappings_path = mappings_path
      end

      def create_index
        mappings = load_mappings

        client.indices.create index: es_index, body: { mappings: mappings }
      end

      private

      attr_reader :client, :es_index, :mappings_path

      def load_mappings
        JSON.parse(File.read(mappings_path))
      end
    end
  end
end
