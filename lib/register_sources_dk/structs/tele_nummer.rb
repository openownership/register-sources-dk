# frozen_string_literal: true

require_relative '../types'
require_relative 'periode'

module RegisterSourcesDk
  class TeleNummer < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :hemmelig,         Types::Params::Bool.optional      # boolean
    attribute? :kontaktoplysning, Types::String.optional            # text
    attribute? :periode,          Periode.optional
    attribute? :sidstOpdateret,   Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
