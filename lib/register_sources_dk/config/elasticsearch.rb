require 'elasticsearch'

module RegisterSourcesDk
  module Config
    MissingEsCredsError = Class.new(StandardError)

    raise MissingEsCredsError unless ENV['ELASTICSEARCH_HOST']

    ELASTICSEARCH_CLIENT = Elasticsearch::Client.new(
      host: "#{ENV.fetch('ELASTICSEARCH_PROTOCOL', 'http')}://elastic:#{ENV['ELASTICSEARCH_PASSWORD']}@#{ENV['ELASTICSEARCH_HOST']}:#{ENV['ELASTICSEARCH_PORT']}",
      transport_options: { ssl: { verify: (ENV.fetch('ELASTICSEARCH_SSL_VERIFY', false) == 'true') } },
      log: false
    )

    DELTAGERPERSON_ES_INDEX = 'dk_deltagerperson_records'
  end
end
