$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coding_practice'
require 'pry'
require 'test_builder'

TestBuilder.configure do |config|
  config.code_directory = "lib/exercises"
  config.test_directory = "spec/exercises"
end

TestBuilder.start!

# Dir[File.expand_path "lib/**/*.rb"].each{ |f| require_relative(f) }
