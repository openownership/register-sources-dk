# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/periode'

module RegisterSourcesDk
  class Status < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :kreditoplysningkode, Types::Nominal::Integer.optional # integer
    attribute? :kreditoplysningtekst, Types::String.optional # text
    attribute? :periode, Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :statuskode, Types::Nominal::Integer.optional # integer
    attribute? :statustekst, Types::String.optional # text
  end
end
