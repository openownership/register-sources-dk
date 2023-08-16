require 'register_sources_dk/structs/deltager_relation'

RSpec.describe RegisterSourcesDk::DeltagerRelation do
  let(:valid) do
    {}
  end

  it 'allows valid' do
    described_class[valid]
  end
end
