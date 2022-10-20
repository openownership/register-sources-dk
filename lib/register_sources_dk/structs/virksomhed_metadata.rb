
require 'register_sources_dk/types'

require 'register_sources_dk/structs/beskaeftigelse'
require 'register_sources_dk/structs/beliggenhedsadresse'
require 'register_sources_dk/structs/branche'
require 'register_sources_dk/structs/navne'
require 'register_sources_dk/structs/status'
require 'register_sources_dk/structs/virksomhedsform'

module RegisterSourcesDk
  class VirksomhedMetadata < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :antalPenheder, Types::Nominal::Integer.optional # integer
    attribute? :nyesteAarsbeskaeftigelse, Beskaeftigelse.optional
    attribute? :nyesteBeliggenhedsadresse, Beliggenhedsadresse.optional
    attribute? :nyesteBibranche1, Branche.optional
    attribute? :nyesteBibranche2, Branche.optional
    attribute? :nyesteBibranche3, Branche.optional
    attribute? :nyesteBinavne, Types.Array(Types::String)
    attribute? :nyesteErstMaanedsbeskaeftigelse, Beskaeftigelse.optional
    attribute? :nyesteHovedbranche, Branche.optional
    attribute? :nyesteKontaktoplysninger, Types.Array(Types::String)
    attribute? :nyesteKvartalsbeskaeftigelse, Beskaeftigelse.optional
    attribute? :nyesteMaanedsbeskaeftigelse, Beskaeftigelse.optional
    attribute? :nyesteNavn, Navne.optional
    attribute? :nyesteStatus, Status.optional
    attribute? :nyesteVirksomhedsform, Virksomhedsform.optional
    attribute? :sammensatStatus, Types::String.optional # "text"
    attribute? :stiftelsesDato, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :virkningsDato, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
