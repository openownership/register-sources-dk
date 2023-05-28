require 'register_sources_dk/structs/fusioner'

RSpec.describe RegisterSourcesDk::Fusioner do
  let(:valid) do
    {}
  end

  it 'allows valid' do
    described_class[valid]
  end
end
