# frozen_string_literal: true

require 'register_sources_dk/structs/deltagerperson'

RSpec.describe RegisterSourcesDk::Deltagerperson do
  let(:valid) do
    {
      navne: [
        {
          navn: 'Danish Person 1',
          periode: {
            gyldigFra: nil,
            gyldigTil: nil
          }
        }
      ],
      beliggenhedsadresse: [
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
      ],
      virksomhedSummariskRelation: [
        {
          virksomhed: {
            enhedstype: 'VIRKSOMHED',
            fejlRegistreret: false,
            sidstOpdateret: '2015-01-02T00:00:00.000+02:00',
            cvrNummer: 1_234_567,
            navne: [
              {
                navn: 'Danish Company 1',
                periode: {
                  gyldigFra: '2015-01-01',
                  gyldigTil: '2015-01-02'
                }
              },
              {
                navn: 'Renamed Danish Company 1',
                periode: {
                  gyldigFra: '2015-01-02',
                  gyldigTil: nil
                }
              }
            ]
          },
          organisationer: [
            {
              medlemsData: [
                {
                  attributter: [
                    {
                      type: 'EJERANDEL_PROCENT',
                      vaerdier: [
                        {
                          vaerdi: '0.5'
                        }
                      ]
                    },
                    {
                      type: 'EJERANDEL_STEMMERET_PROCENT',
                      vaerdier: [
                        {
                          vaerdi: '0.5'
                        }
                      ]
                    },
                    {
                      type: 'FUNKTION',
                      vaerdier: [
                        {
                          vaerdi: 'Reel ejer',
                          periode: {
                            gyldigFra: '2015-01-01',
                            gyldigTil: nil
                          },
                          sidstOpdateret: '2015-01-02T00:00:00.000+02:00'
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      fejlRegistreret: false,
      enhedsNummer: 1,
      enhedstype: 'PERSON',
      sidstOpdateret: '2015-01-02T00:00:00.000+01:00'
    }
  end

  it 'allows valid' do
    deltagerperson = described_class[valid]

    expect(deltagerperson.etag).to eq '1107789726218383806'
    expect(deltagerperson.navne).to eq [
      RegisterSourcesDk::Navne[{
        navn: 'Danish Person 1',
        periode: {
          gyldigFra: nil,
          gyldigTil: nil
        }
      }]
    ]
    expect(deltagerperson.beliggenhedsadresse).to eq [
      RegisterSourcesDk::Beliggenhedsadresse[{
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
      }]
    ]
    expect(deltagerperson.virksomhedSummariskRelation).to eq [
      RegisterSourcesDk::VirksomhedSummariskRelation[{
        virksomhed: {
          enhedstype: 'VIRKSOMHED',
          fejlRegistreret: false,
          sidstOpdateret: '2015-01-02T00:00:00.000+02:00',
          cvrNummer: 1_234_567,
          navne: [
            {
              navn: 'Danish Company 1',
              periode: {
                gyldigFra: '2015-01-01',
                gyldigTil: '2015-01-02'
              }
            },
            {
              navn: 'Renamed Danish Company 1',
              periode: {
                gyldigFra: '2015-01-02',
                gyldigTil: nil
              }
            }
          ]
        },
        organisationer: [
          {
            medlemsData: [
              {
                attributter: [
                  {
                    type: 'EJERANDEL_PROCENT',
                    vaerdier: [
                      {
                        vaerdi: '0.5'
                      }
                    ]
                  },
                  {
                    type: 'EJERANDEL_STEMMERET_PROCENT',
                    vaerdier: [
                      {
                        vaerdi: '0.5'
                      }
                    ]
                  },
                  {
                    type: 'FUNKTION',
                    vaerdier: [
                      {
                        vaerdi: 'Reel ejer',
                        periode: {
                          gyldigFra: '2015-01-01',
                          gyldigTil: nil
                        },
                        sidstOpdateret: '2015-01-02T00:00:00.000+02:00'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }]
    ]
    expect(deltagerperson.fejlRegistreret).to be false
    expect(deltagerperson.enhedsNummer).to eq 1
    expect(deltagerperson.enhedstype).to eq 'PERSON'
    expect(deltagerperson.sidstOpdateret).to eq '2015-01-02T00:00:00.000+01:00'
  end
end
