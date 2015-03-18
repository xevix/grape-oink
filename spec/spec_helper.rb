require 'grape-oink'
require 'json'

require 'rubygems'
require 'bundler'

Bundler.setup :default, :test

require 'rack/test'

RSpec.configure do |config|
  require 'rspec/expectations'
  config.include RSpec::Matchers
  config.mock_with :rspec
  config.include Rack::Test::Methods
end
