require 'register_sources_dk/structs/reg_nummer'

RSpec.describe RegisterSourcesDk::RegNummer do
  let(:valid) do
    {
      regnummer: "something",
      periode: {
        gyldigFra: "2015-01-01",
        gyldigTil: nil,
      },
      sidstOpdateret: "2015-01-02T00:00:00.000+02:00",
    }
  end

  it 'allows valid' do
    reg_nummer = described_class[valid]

    expect(reg_nummer.regnummer).to eq "something"
    expect(reg_nummer.periode).to be_a RegisterSourcesDk::Periode
    expect(reg_nummer.periode.gyldigFra).to eq "2015-01-01"
    expect(reg_nummer.periode.gyldigTil).to be_nil
    expect(reg_nummer.sidstOpdateret).to eq "2015-01-02T00:00:00.000+02:00"
  end
end
