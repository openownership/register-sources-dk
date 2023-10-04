# frozen_string_literal: true

require_relative '../types'
require_relative 'beliggenhedsadresse'

module RegisterSourcesDk
  class DeltagerpersonMetadata < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :nyesteBeliggenhedsadresse, Beliggenhedsadresse.optional
    attribute? :nyesteKontaktoplysninger,  Types.Array(Types::String)
  end
end
