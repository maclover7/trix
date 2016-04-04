$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'trix'
require 'action_controller'
require 'action_view'
require 'rspec/rails'
require 'rspec/active_model/mocks'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }
