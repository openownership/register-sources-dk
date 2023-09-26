# frozen_string_literal: true

require 'register_sources_dk/types'

require 'register_sources_dk/structs/periode'

module RegisterSourcesDk
  class Navne < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :navn, Types::String.optional # "string"
    attribute? :navn_forslag, Types::String.optional # "text"
    attribute? :navn_sort, Types::String.optional # "icu_collation_keyword"
    attribute? :periode, Periode.optional
    attribute? :sidstOpdateret, Types::Nominal::DateTime.optional # "date_optional_time"
  end
end
