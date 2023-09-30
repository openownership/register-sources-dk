# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/organisationer'
require 'register_sources_dk/structs/virksomhed'

module RegisterSourcesDk
  class VirksomhedSummariskRelation < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :organisationer, Types.Array(Organisationer)
    attribute? :virksomhed, Virksomhed
  end
end
