require 'register_sources_dk/types'

require 'register_sources_dk/structs/attributter'
require 'register_sources_dk/structs/navne'

module RegisterSourcesDk
  class Organisationer < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :attributter, Types.Array(Attributter)
    attribute? :enhedsNummerOrganisation, Types::Nominal::Integer.optional # "long"
    attribute? :hovedtype, Types::String.optional # "text"
    attribute? :medlemsData, Types::Array do
      attribute? :attributter, Types.Array(Attributter)
    end
    attribute? :organisationsNavn, Types.Array(Navne)
  end
end
