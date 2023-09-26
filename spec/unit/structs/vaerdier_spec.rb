# frozen_string_literal: true

require 'register_sources_dk/structs/vaerdier'

RSpec.describe RegisterSourcesDk::Vaerdier do
  let(:valid) do
    {
      vaerdi: 'IKKE_OMFATTET',
      periode: {
        gyldigFra: '2015-01-01',
        gyldigTil: nil
      },
      sidstOpdateret: '2015-01-02T00:00:00.000+02:00'
    }
  end

  it 'allows valid' do
    vaerdier = described_class[valid]

    expect(vaerdier.vaerdi).to eq 'IKKE_OMFATTET'
    expect(vaerdier.periode).to eq RegisterSourcesDk::Periode[{
      gyldigFra: '2015-01-01',
      gyldigTil: nil
    }]
    expect(vaerdier.sidstOpdateret).to eq '2015-01-02T00:00:00.000+02:00'
  end
end
