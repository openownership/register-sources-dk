# frozen_string_literal: true

require_relative '../types'
require_relative 'kommune'
require_relative 'periode'

module RegisterSourcesDk
  class Beliggenhedsadresse < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :adresseId,      Types::String.optional            # "text"
    attribute? :bogstavFra,     Types::String.optional            # "text"
    attribute? :bogstavTil,     Types::String.optional            # "text"
    attribute? :bynavn,         Types::String.optional            # "text"
    attribute? :conavn,         Types::String.optional            # "text"
    attribute? :etage,          Types::String.optional            # "text"
    attribute? :fritekst,       Types::String.optional            # "text"
    attribute? :husnummerFra,   Types::Nominal::Integer.optional  # "integer"
    attribute? :husnummerTil,   Types::Nominal::Integer.optional  # "integer"
    attribute? :kommune,        Kommune.optional
    attribute? :landekode,      Types::String.optional            # "text"
    attribute? :periode,        Periode.optional
    attribute? :postboks,       Types::String.optional            # "text"
    attribute? :postdistrikt,   Types::String.optional            # "text"
    attribute? :postnummer,     Types::Nominal::Integer.optional  # "integer"
    attribute? :sidedoer,       Types::String.optional            # "text"
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
    attribute? :sidstValideret, Types::Nominal::Date.optional     # "date"
    attribute? :vejkode,        Types::Nominal::Integer.optional  # "integer"
    attribute? :vejnavn,        Types::String.optional            # "text"
  end
end
