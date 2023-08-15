require 'register_sources_dk/structs/virksomhed_summarisk_relation'

RSpec.describe RegisterSourcesDk::VirksomhedSummariskRelation do
  let(:valid) do
    {}
  end

  it 'allows valid' do
    described_class[valid]
  end
end
