require 'elasticsearch'

module RegisterSourcesDk
  module Config
    ELASTICSEARCH_CLIENT = Elasticsearch::Client.new

    DELTAGERPERSON_ES_INDEX = 'dk_deltagerperson_records'.freeze
  end
end
