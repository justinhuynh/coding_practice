require 'spec_helper'
# require_relative "lib/exercises/test_exercise"

module TestBuilder
  class << self

    def run(file)
      @filename = File.basename(file)
      @prefix = @filename.sub("_spec.rb","")
      @class_name = camelcase
      # STDERR.puts(camelcase)
      Class.new do
        def self.expect(args)
          args.each do |method_name, test_vals|
            test_vals.each do |k, v|
              puts new.send(method_name, *k) == v
            end
          end
        end
        # binding.pry
        # binding.eval(File.read("lib/exercises/test_exercise.rb"), "test_exercise.rb")
        # load "lib/exercises/test_exercise.rb"
        eval(File.read("lib/exercises/test_exercise.rb"))
        # binding.pry
        # puts multiply(2,5)
      end
      # binding.pry
    end

    def camelcase
      @prefix.split('_').collect(&:capitalize).join
    end

    def generate
    end
  end
end


# NewSlate = Class.new do require_relative "lib/exercises/test_exercise"; puts multiply(2,5); end

# BlankSlate = Class.new do eval(File.read("lib/exercises/test_exercise.rb")) end
