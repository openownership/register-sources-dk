# frozen_string_literal: true

require 'elasticsearch'

module RegisterSourcesDk
  module Config
    ELASTICSEARCH_CLIENT = Elasticsearch::Client.new

    DELTAGERPERSON_ES_INDEX = 'dk_deltagerperson_records'
  end
end
