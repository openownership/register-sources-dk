# frozen_string_literal: true

require_relative '../types'
require_relative 'periode'

module RegisterSourcesDk
  class Status < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :kreditoplysningkode,  Types::Nominal::Integer.optional  # integer
    attribute? :kreditoplysningtekst, Types::String.optional            # text
    attribute? :periode,              Periode.optional
    attribute? :sidstOpdateret,       Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :statuskode,           Types::Nominal::Integer.optional  # integer
    attribute? :statustekst,          Types::String.optional            # text
  end
end
