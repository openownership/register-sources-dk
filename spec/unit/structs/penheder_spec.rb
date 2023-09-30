# frozen_string_literal: true

require 'register_sources_dk/structs/penheder'

RSpec.describe RegisterSourcesDk::Penheder do
  let(:valid) do
    {
      pNummer: 'something',
      periode: {
        gyldigFra: '2015-01-01',
        gyldigTil: nil
      },
      sidstOpdateret: '2015-01-02T00:00:00.000+02:00'
    }
  end

  it 'allows valid' do
    penheder = described_class[valid]

    expect(penheder.pNummer).to eq 'something'
    expect(penheder.periode).to be_a RegisterSourcesDk::Periode
    expect(penheder.periode.gyldigFra).to eq '2015-01-01'
    expect(penheder.periode.gyldigTil).to be_nil
    expect(penheder.sidstOpdateret).to eq '2015-01-02T00:00:00.000+02:00'
  end
end
