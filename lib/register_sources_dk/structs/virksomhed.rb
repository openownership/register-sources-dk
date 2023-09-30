# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/attributter'
require 'register_sources_dk/structs/beliggenhedsadresse'
require 'register_sources_dk/structs/beskaeftigelse'
require 'register_sources_dk/structs/branche'
require 'register_sources_dk/structs/deltager_relation'
require 'register_sources_dk/structs/fusioner'
require 'register_sources_dk/structs/livsforloeb'
require 'register_sources_dk/structs/navne'
require 'register_sources_dk/structs/penheder'
require 'register_sources_dk/structs/postadresse'
require 'register_sources_dk/structs/reg_nummer'
require 'register_sources_dk/structs/spaltninger'
require 'register_sources_dk/structs/status'
require 'register_sources_dk/structs/tele_nummer'
require 'register_sources_dk/structs/virksomhed_metadata'
require 'register_sources_dk/structs/virksomhedsform'
require 'register_sources_dk/structs/virksomhedsstatus'

module RegisterSourcesDk
  class Virksomhed < Dry::Struct
    transform_keys(&:to_sym)

    # fields
    attribute? :brancheAnsvarskode, Types::Nominal::Integer.optional # "integer"
    attribute? :cvrNummer, Types::Nominal::Integer.optional # "keyword"
    attribute? :dataAdgang, Types::Nominal::Integer.optional # integer
    attribute? :enhedsNummer, Types::Nominal::Integer.optional # long
    attribute? :enhedstype, Types::String.optional # text
    attribute? :fejlBeskrivelse, Types::String.optional # text
    attribute? :fejlRegistreret, Types::Params::Bool.optional # boolean
    attribute? :fejlVedIndlaesning, Types::Params::Bool.optional # boolean
    attribute? :fortroligBeriget, Types::Params::Bool.optional # boolean
    attribute? :harFremtidigAendring, Types::Params::Bool.optional # boolean
    attribute? :naermesteFremtidigeDato, Types::Nominal::Date.optional # date
    attribute? :reklamebeskyttet, Types::Params::Bool.optional # boolean
    attribute? :samtId, Types::Nominal::Integer.optional # integer
    attribute? :sidstIndlaest, Types::Nominal::DateTime.optional # date_optional_time
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # date_optional_time
    attribute? :stiftelsesDato, Types::Nominal::DateTime.optional # date_optional_time
    attribute? :virkningsAktoer, Types::String.optional # text
    attribute? :virkningsDato, Types::Nominal::DateTime.optional # date_optional_time

    # subobjects
    attribute? :aarsbeskaeftigelse, Types.Array(Beskaeftigelse)
    attribute? :attributter, Types.Array(Attributter)
    attribute? :beliggenhedsadresse, Types.Array(Beliggenhedsadresse)
    attribute? :bibranche1, Types.Array(Branche)
    attribute? :bibranche2, Types.Array(Branche)
    attribute? :bibranche3, Types.Array(Branche)
    attribute? :binavne, Types.Array(Navne)
    attribute? :deltagerRelation, Types.Array(DeltagerRelation)
    attribute? :elektroniskPost, Types.Array(TeleNummer)
    attribute? :erstMaanedsbeskaeftigelse, Types.Array(Beskaeftigelse)
    attribute? :fusioner, Types.Array(Fusioner)
    attribute? :hjemmeside, Types.Array(TeleNummer)
    attribute? :hovedbranche, Types.Array(Branche)
    attribute? :kvartalsbeskaeftigelse, Types.Array(Beskaeftigelse)
    attribute? :livsforloeb, Types.Array(Livsforloeb)
    attribute? :maanedsbeskaeftigelse, Types.Array(Beskaeftigelse)
    attribute? :navne, Types.Array(Navne)
    attribute? :obligatoriskEmail, Types.Array(TeleNummer)
    attribute? :penheder, Types.Array(Penheder)
    attribute? :postadresse, Types.Array(Postadresse)
    attribute? :regNummer, Types.Array(RegNummer)
    attribute? :sekundaertTelefaxNummer, Types.Array(TeleNummer)
    attribute? :sekundaertTelefonNummer, Types.Array(TeleNummer)
    attribute? :spaltninger, Types.Array(Spaltninger)
    attribute? :status, Types.Array(Status)
    attribute? :telefaxNummer, Types.Array(TeleNummer)
    attribute? :telefonNummer, Types.Array(TeleNummer)
    attribute? :virksomhedMetadata, VirksomhedMetadata
    attribute? :virksomhedsform, Types.Array(Virksomhedsform)
    attribute? :virksomhedsstatus, Types.Array(Virksomhedsstatus)
  end
end
