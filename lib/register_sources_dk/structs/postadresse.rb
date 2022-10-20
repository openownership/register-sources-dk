require 'register_sources_dk/types'

require 'register_sources_dk/structs/kommune'
require 'register_sources_dk/structs/periode'

module RegisterSourcesDk
  class Postadresse < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :bogstavFra, Types::String.optional # "text"
    attribute? :bynavn, Types::String.optional # "text"
    attribute? :conavn, Types::String.optional # "text"
    attribute? :etage, Types::String.optional # "text"
    attribute? :fritekst, Types::String.optional # "text"
    attribute? :husnummerFra, Types::Nominal::Integer.optional # "integer"
    attribute? :husnummerTil, Types::Nominal::Integer.optional # "integer"
    attribute? :kommune, Kommune.optional # "integer" - TODO: check this
    attribute? :landekode, Types::String.optional # "text"
    attribute? :periode, Periode.optional
    attribute? :postboks, Types::String.optional # "text"
    attribute? :postdistrikt, Types::String.optional # "text"
    attribute? :postnummer, Types::Nominal::Integer.optional # "integer"
    attribute? :sidedoer, Types::String.optional # "text"
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :vejkode, Types::Nominal::Integer.optional # "integer"
    attribute? :vejnavn, Types::String.optional # "text"
  end
end
