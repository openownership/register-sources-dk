# frozen_string_literal: true

require_relative '../types'
require_relative 'periode'

module RegisterSourcesDk
  class Virksomhedsstatus < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :periode,        Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :status,         Types::String.optional            # text
  end
end
