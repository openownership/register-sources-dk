# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/virksomhed'
require 'register_sources_dk/structs/deltagerperson'

module RegisterSourcesDk
  class Record < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :Vrvirksomhed, Virksomhed
    attribute? :Vrdeltagerperson, Deltagerperson
  end
end
