require 'register_sources_dk/types'

require 'register_sources_dk/structs/attributter'
require 'register_sources_dk/structs/navne'
require 'register_sources_dk/structs/vaerdier'

module RegisterSourcesDk
  class Spaltninger < Dry::Struct
    transform_keys(&:to_sym)

    attribute? :enhedsNummerOrganisation, Types::Nominal::Integer.optional # long
    attribute? :indgaaende, Attributter.optional
    attribute? :organisationsNavn, Navne.optional
    attribute? :udgaaende, Attributter.optional
  end
end
