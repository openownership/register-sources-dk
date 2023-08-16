require 'register_sources_dk/types'

module RegisterSourcesDk
  class Beskaeftigelse < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :aar, Types::Nominal::Integer.optional # "integer"
    attribute? :antalAarsvaerk, Types::Nominal::Integer.optional # "integer"
    attribute? :antalAnsatte, Types::Nominal::Integer.optional # "integer"
    attribute? :antalInklusivEjere, Types::Nominal::Integer.optional # "integer"
    attribute? :intervalKodeAntalAarsvaerk, Types::String.optional # "keyword"
    attribute? :intervalKodeAntalAnsatte, Types::String.optional # "keyword"
    attribute? :intervalKodeAntalInklusivEjere, Types::String.optional # "keyword"
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
