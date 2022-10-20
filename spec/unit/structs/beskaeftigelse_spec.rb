require 'register_sources_dk/structs/beskaeftigelse'

RSpec.describe RegisterSourcesDk::Beskaeftigelse do
  let(:valid) do
    {
      "aar": 2012,
      "antalInklusivEjere": nil,
      "antalAarsvaerk": 0,
      "antalAnsatte": 0,
      "sidstOpdateret": "2012-04-12T08:00:01.000+01:00",
      "intervalKodeAntalInklusivEjere": nil,
      "intervalKodeAntalAarsvaerk": "ANTAL_0_0",
      "intervalKodeAntalAnsatte": "ANTAL_0_0"
    }
  end

  it 'allows valid' do
    beskaeftigelse = described_class[valid]

    expect(beskaeftigelse.aar).to eq 2012
    expect(beskaeftigelse.antalInklusivEjere).to be_nil
    expect(beskaeftigelse.antalAarsvaerk).to eq 0
    expect(beskaeftigelse.antalAnsatte).to eq 0
    expect(beskaeftigelse.sidstOpdateret).to eq "2012-04-12T08:00:01.000+01:00"
    expect(beskaeftigelse.intervalKodeAntalInklusivEjere).to be_nil
    expect(beskaeftigelse.intervalKodeAntalAarsvaerk).to eq "ANTAL_0_0"
    expect(beskaeftigelse.intervalKodeAntalAnsatte).to eq "ANTAL_0_0"
  end
end
