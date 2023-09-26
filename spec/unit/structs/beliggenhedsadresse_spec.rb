# frozen_string_literal: true

require 'register_sources_dk/structs/beliggenhedsadresse'

RSpec.describe RegisterSourcesDk::Beliggenhedsadresse do
  let(:valid) do
    {
      landekode: 'DK',
      fritekst: nil,
      husnummerFra: 1,
      husnummerTil: nil,
      etage: nil,
      conavn: nil,
      postboks: nil,
      vejnavn: 'Example Vej',
      postnummer: 1234,
      postdistrikt: 'Example Town',
      periode: {
        gyldigFra: '2015-01-01',
        gyldigTil: nil
      }
    }
  end

  it 'allows valid' do
    beliggenhedsadresse = described_class[valid]

    expect(beliggenhedsadresse.landekode).to eq 'DK'
    expect(beliggenhedsadresse.fritekst).to be_nil
    expect(beliggenhedsadresse.husnummerFra).to eq 1
    expect(beliggenhedsadresse.husnummerTil).to be_nil
    expect(beliggenhedsadresse.etage).to be_nil
    expect(beliggenhedsadresse.conavn).to be_nil
    expect(beliggenhedsadresse.postboks).to be_nil
    expect(beliggenhedsadresse.vejnavn).to eq 'Example Vej'
    expect(beliggenhedsadresse.postnummer).to eq 1234
    expect(beliggenhedsadresse.postdistrikt).to eq 'Example Town'
    expect(beliggenhedsadresse.periode).to be_a RegisterSourcesDk::Periode
    expect(beliggenhedsadresse.periode.gyldigFra).to eq '2015-01-01'
    expect(beliggenhedsadresse.periode.gyldigTil).to be_nil
  end
end
