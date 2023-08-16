require 'register_sources_dk/types'

require 'register_sources_dk/structs/periode'

module RegisterSourcesDk
  class Branche < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :branchekode, Types::String.optional # "string"
    attribute? :branchetekst, Types::String.optional # "string"
    attribute? :periode, Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
