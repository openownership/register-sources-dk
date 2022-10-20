require 'xxhash'
require 'register_sources_dk/types'

require 'register_sources_dk/structs/attributter'
require 'register_sources_dk/structs/beliggenhedsadresse'
require 'register_sources_dk/structs/deltagerperson_metadata'
require 'register_sources_dk/structs/navne'
require 'register_sources_dk/structs/postadresse'
require 'register_sources_dk/structs/tele_nummer'
require 'register_sources_dk/structs/virksomhed_summarisk_relation'

module RegisterSourcesDk
  class Deltagerperson < Dry::Struct
    transform_keys(&:to_sym)

    # fields
    attribute? :adresseHemmelig, Types::Params::Bool.optional # boolean
    attribute? :adresseHemmeligUndtagelse, Types::Params::Bool.optional # boolean
    attribute? :adresseOpdateringOphoert, Types::Params::Bool.optional # boolean
    attribute? :dataAdgang, Types::Nominal::Integer.optional # integer
    attribute? :enhedsNummer, Types::Nominal::Integer.optional # long
    attribute? :enhedstype, Types::String.optional # text
    attribute? :fejlRegistreret, Types::Params::Bool.optional # boolean
    attribute? :fejlVedIndlaesning, Types::Params::Bool.optional # boolean
    attribute? :forretningsnoegle, Types::Nominal::Integer.optional # keyword
    attribute? :harFremtidigAendring, Types::Params::Bool.optional # boolean
    attribute? :naermesteFremtidigeDato, Types::Nominal::Date.optional # date
    attribute? :samtId, Types::Nominal::Integer.optional # integer
    attribute? :sidstIndlaest, Types::Nominal::DateTime.optional # date_optional_time
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # date_optional_time
    attribute? :stiftelsesDato, Types::Nominal::DateTime.optional # date_optional_time
    attribute? :statusKode, Types::Nominal::Integer.optional # integer
    attribute? :stilling, Types::String.optional # text
    attribute? :virkningsAktoer, Types::String.optional # text

    # subobjects
    attribute? :attributter, Types.Array(Attributter)
    attribute? :beliggenhedsadresse, Types.Array(Beliggenhedsadresse)
    attribute? :deltagerpersonMetadata, DeltagerpersonMetadata
    attribute? :elektroniskPost, Types.Array(TeleNummer)
    attribute? :navne, Types.Array(Navne)
    attribute? :postadresse, Types.Array(Postadresse)
    attribute? :telefonNummer, Types.Array(TeleNummer)
    attribute? :virksomhedSummariskRelation, Types.Array(VirksomhedSummariskRelation)

    def etag
      return if sidstOpdateret.blank? || enhedsNummer.blank?
  
      XXhash.xxh64("#{sidstOpdateret}_#{enhedsNummer}").to_s
    end
  end
end
