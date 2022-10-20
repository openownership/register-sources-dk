require 'register_sources_dk/structs/kommune'

RSpec.describe RegisterSourcesDk::Kommune do
  let(:valid) do
    {
      "kommuneKode": 101,
      "kommuneNavn": "kommuneNavn",
      "periode": {
        "gyldigFra": "2009-06-01",
        "gyldigTil": nil
      },
      "sidstOpdateret": "2016-12-09T03:00:00.000+01:00"
    }
  end

  it 'allows valid' do
    kommune = described_class[valid]

    expect(kommune.kommuneKode).to eq 101
    expect(kommune.kommuneNavn).to eq 'kommuneNavn'
    expect(kommune.periode).to eq RegisterSourcesDk::Periode[{
      "gyldigFra": "2009-06-01",
      "gyldigTil": nil
    }]
    expect(kommune.sidstOpdateret).to eq "2016-12-09T03:00:00.000+01:00"
  end
end
