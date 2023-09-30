# frozen_string_literal: true

require 'register_sources_dk/services/es_index_creator'

RSpec.describe RegisterSourcesDk::Services::EsIndexCreator do
  subject { described_class.new(client:, es_index: index) }

  let(:client) { double 'client', indices: double('indices') }
  let(:index) { double 'index' }

  describe '#create_company_record_index' do
    it 'calls client' do
      expect(client.indices).to receive(:create).with a_hash_including(
        index:
      )

      subject.create_index
    end
  end
end
