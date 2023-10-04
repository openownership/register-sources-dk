# frozen_string_literal: true

require_relative '../types'
require_relative 'attributter'
require_relative 'beliggenhedsadresse'
require_relative 'beskaeftigelse'
require_relative 'branche'
require_relative 'deltager_relation'
require_relative 'fusioner'
require_relative 'livsforloeb'
require_relative 'navne'
require_relative 'penheder'
require_relative 'postadresse'
require_relative 'reg_nummer'
require_relative 'spaltninger'
require_relative 'status'
require_relative 'tele_nummer'
require_relative 'virksomhed_metadata'
require_relative 'virksomhedsform'
require_relative 'virksomhedsstatus'

module RegisterSourcesDk
  class Virksomhed < Dry::Struct
    transform_keys(&:to_sym)

    # fields
    attribute? :brancheAnsvarskode,      Types::Nominal::Integer.optional  # "integer"
    attribute? :cvrNummer,               Types::Nominal::Integer.optional  # "keyword"
    attribute? :dataAdgang,              Types::Nominal::Integer.optional  # integer
    attribute? :enhedsNummer,            Types::Nominal::Integer.optional  # long
    attribute? :enhedstype,              Types::String.optional            # text
    attribute? :fejlBeskrivelse,         Types::String.optional            # text
    attribute? :fejlRegistreret,         Types::Params::Bool.optional      # boolean
    attribute? :fejlVedIndlaesning,      Types::Params::Bool.optional      # boolean
    attribute? :fortroligBeriget,        Types::Params::Bool.optional      # boolean
    attribute? :harFremtidigAendring,    Types::Params::Bool.optional      # boolean
    attribute? :naermesteFremtidigeDato, Types::Nominal::Date.optional     # date
    attribute? :reklamebeskyttet,        Types::Params::Bool.optional      # boolean
    attribute? :samtId,                  Types::Nominal::Integer.optional  # integer
    attribute? :sidstIndlaest,           Types::Nominal::DateTime.optional # date_optional_time
    attribute? :sidstOpdateret,          Types::Nominal::DateTime.optional # date_optional_time
    attribute? :stiftelsesDato,          Types::Nominal::DateTime.optional # date_optional_time
    attribute? :virkningsAktoer,         Types::String.optional            # text
    attribute? :virkningsDato,           Types::Nominal::DateTime.optional # date_optional_time

    # subobjects
    attribute? :aarsbeskaeftigelse,        Types.Array(Beskaeftigelse)
    attribute? :attributter,               Types.Array(Attributter)
    attribute? :beliggenhedsadresse,       Types.Array(Beliggenhedsadresse)
    attribute? :bibranche1,                Types.Array(Branche)
    attribute? :bibranche2,                Types.Array(Branche)
    attribute? :bibranche3,                Types.Array(Branche)
    attribute? :binavne,                   Types.Array(Navne)
    attribute? :deltagerRelation,          Types.Array(DeltagerRelation)
    attribute? :elektroniskPost,           Types.Array(TeleNummer)
    attribute? :erstMaanedsbeskaeftigelse, Types.Array(Beskaeftigelse)
    attribute? :fusioner,                  Types.Array(Fusioner)
    attribute? :hjemmeside,                Types.Array(TeleNummer)
    attribute? :hovedbranche,              Types.Array(Branche)
    attribute? :kvartalsbeskaeftigelse,    Types.Array(Beskaeftigelse)
    attribute? :livsforloeb,               Types.Array(Livsforloeb)
    attribute? :maanedsbeskaeftigelse,     Types.Array(Beskaeftigelse)
    attribute? :navne,                     Types.Array(Navne)
    attribute? :obligatoriskEmail,         Types.Array(TeleNummer)
    attribute? :penheder,                  Types.Array(Penheder)
    attribute? :postadresse,               Types.Array(Postadresse)
    attribute? :regNummer,                 Types.Array(RegNummer)
    attribute? :sekundaertTelefaxNummer,   Types.Array(TeleNummer)
    attribute? :sekundaertTelefonNummer,   Types.Array(TeleNummer)
    attribute? :spaltninger,               Types.Array(Spaltninger)
    attribute? :status,                    Types.Array(Status)
    attribute? :telefaxNummer,             Types.Array(TeleNummer)
    attribute? :telefonNummer,             Types.Array(TeleNummer)
    attribute? :virksomhedMetadata,        VirksomhedMetadata
    attribute? :virksomhedsform,           Types.Array(Virksomhedsform)
    attribute? :virksomhedsstatus,         Types.Array(Virksomhedsstatus)
  end
end
