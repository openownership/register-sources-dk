require 'register_sources_dk/structs/attributter'

RSpec.describe RegisterSourcesDk::Attributter do
  let(:valid_attributter) do
    {
      type: "FUNKTION",
      vaerdier: [
        {
          vaerdi: "Reel ejer",
          periode: {
            gyldigFra: "2015-01-01",
            gyldigTil: nil,
          },
          sidstOpdateret: "2015-01-02T00:00:00.000+02:00",
        },
      ],
    }
  end

  it 'allows valid' do
    attributter = described_class[valid_attributter]

    expect(attributter.type).to eq 'FUNKTION'

    expect(attributter.vaerdier.length).to eq 1
    vaerdier1 = attributter.vaerdier[0]
    expect(vaerdier1).to be_a RegisterSourcesDk::Vaerdier
    expect(vaerdier1.vaerdi).to eq 'Reel ejer'
    expect(vaerdier1.periode).to be_a RegisterSourcesDk::Periode
    expect(vaerdier1.periode.gyldigFra).to eq '2015-01-01'
    expect(vaerdier1.periode.gyldigTil).to be_nil
    expect(vaerdier1.sidstOpdateret).to eq '2015-01-02T00:00:00.000+02:00'
  end
end
