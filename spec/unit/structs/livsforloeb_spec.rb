require 'register_sources_dk/structs/livsforloeb'

RSpec.describe RegisterSourcesDk::Livsforloeb do
  let(:valid) do
    {
      "periode": {
        "gyldigFra": "2015-01-01",
        "gyldigTil": nil
      },
      "sidstOpdateret": "2015-01-02T00:00:00.000+02:00"
    }
  end

  it 'allows valid' do
    livsforloeb = described_class[valid]

    expect(livsforloeb.periode).to eq RegisterSourcesDk::Periode[{
      "gyldigFra": "2015-01-01",
      "gyldigTil": nil
    }]
    expect(livsforloeb.sidstOpdateret).to eq "2015-01-02T00:00:00.000+02:00"
  end
end
