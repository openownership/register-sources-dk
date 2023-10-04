# frozen_string_literal: true

require_relative '../types'
require_relative 'periode'

module RegisterSourcesDk
  class Branche < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :branchekode,    Types::String.optional            # "string"
    attribute? :branchetekst,   Types::String.optional            # "string"
    attribute? :periode,        Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
