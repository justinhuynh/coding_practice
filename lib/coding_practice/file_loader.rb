TestBuilder.configure do |config|
  config.code_directory = "lib/sandbox/"
  config.test_directory = "spec/exercises/"
  config.template_directory = "lib/coding_practice/templates/"
  config.framework = :rspec
end

binding.pry
TestBuilder.start!

# build Rake tasks
# event listener for last saved file in directory?
# work out structure of sandbox folder, make archive (no tests) and parsing files to load
# see if the value of the hash can be something else
