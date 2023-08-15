require 'register_sources_dk/structs/spaltninger'

RSpec.describe RegisterSourcesDk::Spaltninger do
  let(:valid) do
    {}
  end

  it 'allows valid' do
    described_class[valid]
  end
end
