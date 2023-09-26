# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/vaerdier'

module RegisterSourcesDk
  class Attributter < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :sekvensnr, Types::Nominal::Integer.optional # "integer"
    attribute? :type, Types::String.optional # "text"
    attribute? :vaerdier, Types.Array(Vaerdier)
    attribute? :vaerditype, Types::String.optional # "text"
  end
end
