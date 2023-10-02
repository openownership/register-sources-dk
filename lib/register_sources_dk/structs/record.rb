# frozen_string_literal: true

require_relative '../types'
require_relative 'deltagerperson'
require_relative 'virksomhed'

module RegisterSourcesDk
  class Record < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :Vrvirksomhed,     Virksomhed
    attribute? :Vrdeltagerperson, Deltagerperson
  end
end
