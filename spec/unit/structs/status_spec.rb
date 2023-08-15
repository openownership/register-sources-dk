require 'register_sources_dk/structs/status'

RSpec.describe RegisterSourcesDk::Status do
  let(:valid) do
    {

      periode: {
        gyldigFra: "2015-01-01",
        gyldigTil: nil,
      },
      sidstOpdateret: "2015-01-02T00:00:00.000+02:00",
    }
  end

  it 'allows valid' do
    described_class[valid]
  end
end
