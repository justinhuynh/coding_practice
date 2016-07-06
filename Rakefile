require "rake"
require "rspec/core/rake_task"
require "pry"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "generate tests from sandbox files"
task :build do
  require_relative "lib/runner"
end
