require 'register_sources_dk/structs/virksomhed'

RSpec.describe RegisterSourcesDk::Virksomhed do
  let(:valid) do
    {
      
    }
  end

  it 'allows valid' do
    vrvirksomhed = described_class[valid]
  end
end
