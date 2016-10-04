require 'bundler/setup'

begin
  require 'pry'
rescue LoadError
end

require_relative 'support/adapters/active_record'
require_relative 'support/data'

RSpec.configure do |c|
  c.run_all_when_everything_filtered = true
end
