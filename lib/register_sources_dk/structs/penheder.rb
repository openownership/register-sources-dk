require 'register_sources_dk/types'

require 'register_sources_dk/structs/periode'

module RegisterSourcesDk
  class Penheder < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :pNummer, Types::Nominal::Integer.optional
    attribute? :periode, Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
