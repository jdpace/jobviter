SpecRoot = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(SpecRoot)
$LOAD_PATH.unshift(File.join(SpecRoot, '..', 'lib'))

require 'jobviter'
require 'rspec'
require 'rspec/autorun'
require 'mocha'

RSpec.configure do |config|
  config.color_enabled = true
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
  config.alias_example_to :fit, :focused => true
  config.alias_example_to :they

  config.mock_with :mocha
end
