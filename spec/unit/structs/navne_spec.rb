require 'register_sources_dk/structs/navne'

RSpec.describe RegisterSourcesDk::Navne do
  let(:valid) do
    {
      "navn": "Danish Company 1",
      "periode": {
        "gyldigFra": "2015-01-01",
        "gyldigTil": "2015-01-02"
      },
      "sidstOpdateret": "2015-01-02T00:00:00.000+02:00"
    }
  end

  it 'allows valid' do
    navne = described_class[valid]

    expect(navne.navn).to eq "Danish Company 1"
    expect(navne.periode).to be_a RegisterSourcesDk::Periode
    expect(navne.periode.gyldigFra).to eq "2015-01-01"
    expect(navne.periode.gyldigTil).to eq "2015-01-02"
    expect(navne.sidstOpdateret).to eq "2015-01-02T00:00:00.000+02:00"
  end
end
