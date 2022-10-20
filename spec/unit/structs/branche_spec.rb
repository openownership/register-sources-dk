require 'register_sources_dk/structs/branche'

RSpec.describe RegisterSourcesDk::Branche do
  let(:valid) do
    {
      "branchekode": "672186",
      "branchetekst": "branchetekst",
      "periode": {
        "gyldigFra": "2017-05-05",
        "gyldigTil": "2017-08-28"
      },
      "sidstOpdateret": "2017-11-28T16:05:24.000+01:00"
    }
  end

  it 'allows valid' do
    branche = described_class[valid]

    expect(branche.branchekode).to eq "672186"
    expect(branche.branchetekst).to eq "branchetekst"
    expect(branche.periode).to be_a RegisterSourcesDk::Periode
    expect(branche.periode.gyldigFra).to eq "2017-05-05"
    expect(branche.periode.gyldigTil).to eq "2017-08-28"
    expect(branche.sidstOpdateret).to eq "2017-11-28T16:05:24.000+01:00"
  end
end
