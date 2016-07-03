require "pry"
require "ERB"

require_relative "test_builder/test_builder"

Dir["test_builder/templates/**"].each{ |f| require_relative(f) }

TestBuilder.configure do |config|
  config.code_directory = "lib/exercises/"
  config.test_directory = "spec/exercises/"
  config.template_directory = "lib/test_builder/templates/"
  config.framework = :rspec
end

TestBuilder.start!

# build Rake tasks
# event listener for last saved file in directory?
# work out structure of sandbox folder, make archive (no tests) and parsing files to load
# see if the value of the hash can be something else
