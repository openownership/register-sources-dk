# frozen_string_literal: true

require 'elasticsearch'
require 'register_sources_dk/repositories/deltagerperson_repository'
require 'register_sources_dk/services/es_index_creator'
require 'register_sources_dk/structs/record'

BodsIdentifier = Struct.new(:id, :schemeName)

RSpec.describe RegisterSourcesDk::Repositories::DeltagerpersonRepository do
  subject { described_class.new(client: es_client, index:) }

  let(:index) { SecureRandom.uuid }
  let(:es_client) { Elasticsearch::Client.new }

  let(:record) do
    RegisterSourcesDk::Record[
      JSON.parse(File.read('./spec/fixtures/dk_bo_api_response.json'))['hits']['hits'][0]['_source']
    ].Vrdeltagerperson
  end

  let(:record2) do
    RegisterSourcesDk::Record[
      JSON.parse(File.read('./spec/fixtures/dk_bo_api_response.json'))['hits']['hits'][1]['_source']
    ].Vrdeltagerperson
  end

  before do
    index_creator = RegisterSourcesDk::Services::EsIndexCreator.new(
      client: es_client,
      index:
    )
    index_creator.create_index
  end

  describe '#store' do
    it 'stores' do
      records = [record, record2]

      subject.store(records)

      sleep 1 # eventually consistent, give time

      expect(subject.get(record.etag)).to eq record

      # When records do not exist
      expect(subject.get('missing')).to be_nil

      # Check identifiers when 'DK Centrale Virksomhedsregister'
      identifiers = [
        BodsIdentifier.new(2, 'DK Centrale Virksomhedsregister')
      ]

      results = subject.get_by_bods_identifiers(identifiers)

      expect(results).to eq [record2]

      # Check identifiers when 'Danish Central Business Register'
      identifiers = [
        BodsIdentifier.new(1_234_567, 'Danish Central Business Register')
      ]

      results = subject.get_by_bods_identifiers(identifiers)

      expect(results).to eq [record]
    end
  end
end
