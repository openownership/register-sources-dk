# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/beliggenhedsadresse'

module RegisterSourcesDk
  class DeltagerpersonMetadata < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :nyesteBeliggenhedsadresse, Beliggenhedsadresse.optional
    attribute? :nyesteKontaktoplysninger, Types.Array(Types::String)
  end
end
