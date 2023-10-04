# frozen_string_literal: true

require_relative '../types'
require_relative 'periode'

module RegisterSourcesDk
  class Virksomhedsform < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :ansvarligDataleverandoer, Types::String.optional            # text
    attribute? :kortBeskrivelse,          Types::String.optional            # text
    attribute? :langBeskrivelse,          Types::String.optional            # text
    attribute? :periode,                  Periode.optional
    attribute? :sidstOpdateret,           Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :virksomhedsformkode,      Types::Nominal::Integer.optional  # integer
  end
end
