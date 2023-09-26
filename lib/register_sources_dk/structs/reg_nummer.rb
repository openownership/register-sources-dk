# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/periode'

module RegisterSourcesDk
  class RegNummer < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :regnummer, Types::String.optional # text
    attribute? :periode, Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
