require 'register_sources_dk/types'

module RegisterSourcesDk
  class Periode < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :gyldigFra, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :gyldigTil, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
