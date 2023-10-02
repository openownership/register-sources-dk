# frozen_string_literal: true

require_relative '../types'
require_relative 'attributter'
require_relative 'beliggenhedsadresse'
require_relative 'navne'
require_relative 'organisationer'
require_relative 'postadresse'

module RegisterSourcesDk
  class DeltagerRelation < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :delatger do
      attribute? :adresseHemmelig,           Types::Params::Bool.optional      # "boolean"
      attribute? :adresseHemmeligUndtagelse, Types::Params::Bool.optional      # "boolean"
      attribute? :adresseOpdateringOphoert,  Types::Params::Bool.optional      # "boolean"
      attribute? :beliggenhedsadresse,       Beliggenhedsadresse.optional
      attribute? :enhedsNummer,              Types::Nominal::Integer.optional  # "long"
      attribute? :enhedstype,                Types::String.optional            # "text"
      attribute? :forretningsnoegle,         Types::String.optional            # "keyword"
      attribute? :fortroligBeriget,          Types::Params::Bool.optional      # "boolean"
      attribute? :navne,                     Navne.optional
      attribute? :postadresse,               Postadresse.optional
      attribute? :sidstIndlaest,             Types::Nominal::DateTime.optional # "date_optional_time"
      attribute? :sidstOpdateret,            Types::Nominal::Date.optional     # "date"
    end

    attribute? :kontorsteder, Types::Array do
      attribute? :attributter, Types.Array(Attributter)
      attribute? :penhed do
        attribute? :beliggenhedsadresse, Types.Array(Beliggenhedsadresse)
        attribute? :enhedsNummer,        Types::Nominal::Integer.optional  # "long"
        attribute? :enhedstype,          Types::String.optional            # "text"
        attribute? :forretningsnoegle,   Types::Nominal::Integer.optional  # "keyword"
        attribute? :fortroligBeriget,    Types::Params::Bool.optional      # "boolean"
        attribute? :navne,               Types.Array(Navne)
        attribute? :sidstIndlaest,       Types::Nominal::DateTime.optional # "date_optional_time"
        attribute? :sidstOpdateret,      Types::Nominal::Date.optional     # "date"
      end
    end

    attribute? :organisationer, Types.Array(Organisationer)
  end
end
