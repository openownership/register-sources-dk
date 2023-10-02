# frozen_string_literal: true

require_relative '../types'
require_relative 'organisationer'
require_relative 'virksomhed'

module RegisterSourcesDk
  class VirksomhedSummariskRelation < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :organisationer, Types.Array(Organisationer)
    attribute? :virksomhed,     Virksomhed
  end
end
