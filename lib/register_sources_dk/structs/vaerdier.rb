# frozen_string_literal: true

require_relative '../types'
require_relative 'periode'

module RegisterSourcesDk
  class Vaerdier < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :periode,        Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :vaerdi,         Types::String.optional            # text
    attribute? :vaerdi_keyword, Types::String.optional            # text
  end
end
