# frozen_string_literal: true

require "connpass_api_v2"
require "webmock/rspec"
require "rspec/its"
require "rspec/parameterized"

Dir["#{__dir__}/support/**/*.rb"].each {|f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end

  config.include FixtureUtil
end

def spec_dir
  Pathname(__dir__)
end
