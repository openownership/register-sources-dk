require 'register_sources_dk/structs/virksomhedsstatus'

RSpec.describe RegisterSourcesDk::Virksomhedsstatus do
  let(:valid) do
    {
      "periode": {
        "gyldigFra": "2015-01-01",
        "gyldigTil": nil
      },
      "sidstOpdateret": "2015-01-02T00:00:00.000+02:00"
    }
  end

  it 'allows valid' do
    virksomhedsstatus = described_class[valid]

    expect(virksomhedsstatus.periode).to eq RegisterSourcesDk::Periode[{
      "gyldigFra": "2015-01-01",
      "gyldigTil": nil
    }]
    expect(virksomhedsstatus.sidstOpdateret).to eq "2015-01-02T00:00:00.000+02:00"
  end
end
