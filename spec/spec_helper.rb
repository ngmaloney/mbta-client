$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
require 'pry'
require 'vcr'

require 'mbta'

Dotenv.load

RSpec.configure do |config|
  config.mock_with :rspec
end

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/cassettes'
  c.filter_sensitive_data('<API_KEY>') { ENV["API_KEY"] }
end
