require './source/base.rb'
require './source/reader.rb'
require_relative 'models/soft_good'
require_relative 'models/brand'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
