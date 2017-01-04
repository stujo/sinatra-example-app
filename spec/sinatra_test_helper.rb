require 'rack/test'
require 'rspec'
require_relative('./spec_helper')

ENV['RACK_ENV'] = 'test'

require_relative('../app')

module RSpecMixin
  include Rack::Test::Methods
  def app() EmailDupesApp end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
