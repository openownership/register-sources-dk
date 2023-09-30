# frozen_string_literal: true

require 'register_sources_dk/structs/periode'

RSpec.describe RegisterSourcesDk::Periode do
  let(:valid) do
    {
      gyldigFra: '2015-01-01',
      gyldigTil: nil
    }
  end

  it 'allows valid' do
    periode = described_class[valid]

    expect(periode.gyldigFra).to eq '2015-01-01'
    expect(periode.gyldigTil).to be_nil
  end
end
