require 'json'

require 'register_sources_dk/structs/record'

RSpec.describe RegisterSourcesDk::Record do
  context 'when record data is virksomhed' do
    xit 'parses record data' do
      JSON.parse(File.read('./notes/virksomhed_response.json'))['hits']['hits'].map do |result|
        valid_data = result['_source']
        described_class[valid_data]

        # print("Result is: ", JSON.pretty_generate(result.to_h), "\n")
      end
    end
  end

  context 'when record data is deltagerperson' do
    xit 'parses record data' do
      JSON.parse(File.read('./notes/deltagerperson_response.json'))['hits']['hits'].map do |result|
        valid_data = result['_source']
        described_class[valid_data]

        # print("Result is: ", JSON.pretty_generate(result.to_h), "\n")
      end
    end
  end
end
