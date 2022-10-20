require 'register_sources_dk/structs/virksomhed_summarisk_relation'

RSpec.describe RegisterSourcesDk::VirksomhedSummariskRelation do
  let(:valid) do
    {
      
    }
  end

  it 'allows valid' do
    virksomhed_summarisk_relation = described_class[valid]
  end
end
