require 'serpscan'
require 'rspec'
require 'webmock'
require 'vcr'

# Load shared examples
Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.ignore_localhost = false
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :once }
end

RSpec.configure do |config|
  config.before(:all) do
    Serpscan.api_key = '123'
  end

  config.before(:each) do
    stub_const 'Serpscan::API::BASE_URL', 'http://localhost:5055/api/v2'
  end
end
