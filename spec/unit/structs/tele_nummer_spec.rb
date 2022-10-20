require 'register_sources_dk/structs/tele_nummer'

RSpec.describe RegisterSourcesDk::TeleNummer do
  let(:valid) do
    {
      "kontaktoplysning": "16725434",
      "hemmelig": false,
      "periode": {
        "gyldigFra": "2018-02-05",
        "gyldigTil": "2018-02-08"
      },
      "sidstOpdateret": "2018-02-08T11:05:24.000+01:00"
    }
  end

  it 'allows valid' do
    tele_nummer = described_class[valid]

    expect(tele_nummer.kontaktoplysning).to eq '16725434'
    expect(tele_nummer.hemmelig).to eq false
    expect(tele_nummer.periode).to eq RegisterSourcesDk::Periode[{
      "gyldigFra": "2018-02-05",
      "gyldigTil": "2018-02-08"
    }]
    expect(tele_nummer.sidstOpdateret).to eq "2018-02-08T11:05:24.000+01:00"
  end
end
