require 'elasticsearch'
require 'register_sources_dk/repositories/deltagerperson_repository'
require 'register_sources_dk/services/es_index_creator'
require 'register_sources_dk/structs/record'

RSpec.describe RegisterSourcesDk::Repositories::DeltagerpersonRepository do
  subject { described_class.new(client: es_client, index:) }

  let(:index) { SecureRandom.uuid }
  let(:es_client) do
    Elasticsearch::Client.new(
      host: "http://elastic:#{ENV.fetch('ELASTICSEARCH_PASSWORD', nil)}@#{ENV.fetch('ELASTICSEARCH_HOST', nil)}:#{ENV.fetch('ELASTICSEARCH_PORT', nil)}",
      transport_options: { ssl: { verify: false } },
      log: false,
    )
  end

  let(:record) do
    RegisterSourcesDk::Record[
      JSON.parse(File.read('./notes/deltagerperson_response.json'))['hits']['hits'][0]['_source']
    ].Vrdeltagerperson
  end

  before do
    index_creator = RegisterSourcesDk::Services::EsIndexCreator.new(
      es_index: index,
      client: es_client,
    )
    index_creator.create_index
  end

  describe '#store' do
    xit 'stores' do
      records = [record]

      subject.store(records)

      sleep 1 # eventually consistent, give time

      expect(subject.get(record.etag)).to eq record

      # When records do not exist
      expect(subject.get("missing")).to be_nil
    end
  end
end
