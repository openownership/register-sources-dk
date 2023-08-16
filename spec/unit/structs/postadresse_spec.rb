require 'register_sources_dk/structs/postadresse'

RSpec.describe RegisterSourcesDk::Postadresse do
  let(:valid) do
    {
      landekode: "DK",
      fritekst: nil,
      husnummerFra: 1,
      husnummerTil: nil,
      etage: nil,
      conavn: nil,
      postboks: nil,
      vejnavn: "Example Vej",
      postnummer: 1234,
      postdistrikt: "Example Town",
      periode: {
        gyldigFra: "2015-01-01",
        gyldigTil: nil,
      },
    }
  end

  it 'allows valid' do
    postadresse = described_class[valid]

    expect(postadresse.landekode).to eq "DK"
    expect(postadresse.fritekst).to be_nil
    expect(postadresse.husnummerFra).to eq 1
    expect(postadresse.husnummerTil).to be_nil
    expect(postadresse.etage).to be_nil
    expect(postadresse.conavn).to be_nil
    expect(postadresse.postboks).to be_nil
    expect(postadresse.vejnavn).to eq "Example Vej"
    expect(postadresse.postnummer).to eq 1234
    expect(postadresse.postdistrikt).to eq "Example Town"

    expect(postadresse.periode).to be_a RegisterSourcesDk::Periode
    expect(postadresse.periode.gyldigFra).to eq "2015-01-01"
    expect(postadresse.periode.gyldigTil).to be_nil
  end
end
