# frozen_string_literal: true

require_relative '../types'
require_relative 'attributter'
require_relative 'navne'
require_relative 'vaerdier'

module RegisterSourcesDk
  # NOTE: duplicate
  class Fusioner < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :enhedsNummerOrganisation, Types::Nominal::Integer.optional # long
    attribute? :indgaaende,               Attributter.optional
    attribute? :organisationsNavn,        Navne.optional
    attribute? :udgaaende,                Attributter.optional
  end
end
