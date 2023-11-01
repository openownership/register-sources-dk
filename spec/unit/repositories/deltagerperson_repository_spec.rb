# frozen_string_literal: true

require 'json'
require 'register_sources_dk/repositories/deltagerperson_repository'
require 'register_sources_dk/structs/record'

BodsIdentifier = Struct.new(:id, :schemeName)

RSpec.describe RegisterSourcesDk::Repositories::DeltagerpersonRepository do
  subject { described_class.new(client:, index:) }

  let(:client) { double 'client' }
  let(:index) { double 'index' }

  let(:record_h) do
    JSON.parse(
      {
        Vrdeltagerperson: {
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
            },
            {
              virksomhed: {
                enhedstype: 'VIRKSOMHED',
                fejlRegistreret: false,
                cvrNummer: 89_101_112,
                navne: [
                  {
                    navn: 'Danish Company 2',
                    periode: {
                      gyldigFra: '2015-01-01',
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
                              sidstOpdateret: '2015-01-01T00:00:00.000+02:00'
                            }
                          ]
                        },
                        {
                          type: 'SÆRLIGE_EJERFORHOLD',
                          vaerdier: [
                            {
                              vaerdi: 'Har indirekte besiddelser'
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
        },
        etag: '1107789726218383806'
      }.to_json
    )
  end
  let(:record) { RegisterSourcesDk::Record[record_h].Vrdeltagerperson }

  describe '#get' do
    let(:expected_get_query) do
      {
        query: {
          bool: {
            must: [
              {
                match: {
                  etag: {
                    query: record.etag
                  }
                }
              }
            ]
          }
        }
      }
    end

    context 'when matching record exists' do
      it 'returns matching record' do
        expect(client).to receive(:search).with(
          index:,
          body: expected_get_query
        ).and_return({
                       'hits' => { 'hits' => [{ '_score' => 0.9, '_source' => record_h }] }
                     })

        expect(subject.get(record.etag)).to eq record
      end
    end

    context 'when matching record does not exist' do
      it 'returns nil' do
        expect(client).to receive(:search).with(
          index:,
          body: expected_get_query
        ).and_return({
                       'hits' => { 'hits' => [] }
                     })

        expect(subject.get(record.etag)).to be_nil
      end
    end
  end

  describe '#store' do
    context 'when successful' do
      it 'returns true' do
        expect(client).to receive(:bulk).with(
          body: [
            {
              index: {
                _index: index,
                _id: '1107789726218383806',
                data: { etag: '1107789726218383806', Vrdeltagerperson: record.to_h }
              }
            }
          ]
        ).and_return({})

        expect(subject.store([record])).to be true
      end
    end

    context 'when items to store are empty' do
      it 'returns true without calling client' do
        expect(client).not_to receive(:bulk)

        expect(subject.store([])).to be true
      end
    end

    context 'when response has errors' do
      it 'raises an ElasticsearchError error' do
        expect(client).to receive(:bulk).and_return('errors' => 'errors')

        expect { subject.store([record]) }.to raise_error(described_class::ElasticsearchError)
      end
    end
  end

  describe '#build_get_by_bods_identifiers' do
    it 'builds query for searching by bods identifiers' do
      identifiers = [
        BodsIdentifier.new(2, 'DK Centrale Virksomhedsregister'),
        BodsIdentifier.new(1_234_567, 'Danish Central Business Register')
      ]

      query = subject.build_get_by_bods_identifiers(identifiers)

      expect(query).to eq(
        {
          bool: {
            should: [
              {
                bool: {
                  must: [
                    {
                      match: {
                        'Vrdeltagerperson.enhedsNummer': {
                          query: 2
                        }
                      }
                    }
                  ]
                }
              },
              {
                bool: {
                  must: [
                    {
                      match: {
                        'Vrdeltagerperson.virksomhedSummariskRelation.virksomhed.cvrNummer': {
                          query: 1_234_567
                        }
                      }
                    }
                  ]
                }
              }
            ]
          }
        }
      )
    end
  end
end
