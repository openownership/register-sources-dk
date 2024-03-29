# frozen_string_literal: true

module RegisterSourcesDk
  UNITTEST = 1
end

require 'register_sources_dk'
require 'webmock/rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
  Kernel.srand config.seed

  WebMock.disable_net_connect!(
    allow_localhost: true,
    allow: [
      'chromedriver.storage.googleapis.com',
      'elasticsearch'
    ]
  )
end
