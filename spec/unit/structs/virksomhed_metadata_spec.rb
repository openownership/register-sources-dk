require 'register_sources_dk/structs/virksomhed_metadata'

RSpec.describe RegisterSourcesDk::VirksomhedMetadata do
  let(:valid) do
    {
      
    }
  end

  it 'allows valid' do
    virksomhed_metadata = described_class[valid]
  end
end
