# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'dbcop'

require 'dotenv/load'
require 'byebug'

require 'combustion'
Combustion.initialize! :all,
  database_reset: true, database_migrate: true, load_schema: false

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
