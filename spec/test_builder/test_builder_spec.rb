require_relative "../../lib/runner.rb"
require_relative "../../lib/test_builder/test_builder.rb"

describe TestBuilder do
  TestBuilder.configure do |config|
    config.code_directory = "lib/sandbox/"
    config.output_directory = "lib/exercises/"
    config.test_directory = "spec/exercises/"
    config.template_directory = "lib/test_builder/templates/"
    config.framework = :rspec
  end

  it "accepts a block that assigns CONFIG class variables" do
    expect(TestBuilder.code_directory).to eq "lib/sandbox/"
    expect(TestBuilder.output_directory).to eq "lib/exercises/"
    expect(TestBuilder.test_directory).to eq "spec/exercises/"
    expect(TestBuilder.template_directory).to eq "lib/test_builder/templates/"
    expect(TestBuilder.framework).to eq :rspec
  end

  # look at thor tests
  # how to test file operations
end
