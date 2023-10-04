# frozen_string_literal: true

require_relative '../types'
require_relative 'attributter'
require_relative 'navne'

module RegisterSourcesDk
  class Organisationer < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :attributter,              Types.Array(Attributter)
    attribute? :enhedsNummerOrganisation, Types::Nominal::Integer.optional # "long"
    attribute? :hovedtype,                Types::String.optional           # "text"
    attribute? :medlemsData,              Types::Array do
      attribute? :attributter, Types.Array(Attributter)
    end
    attribute? :organisationsNavn, Types.Array(Navne)
  end
end
