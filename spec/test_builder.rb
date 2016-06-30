require 'code_file'
# call CodeWars API to import challenges?
# binding.eval(File.read("lib/exercises/test_exercise.rb"), "test_exercise.rb")
# load "lib/exercises/test_exercise.rb"

module TestBuilder
  class << self
    attr_accessor :code_directory, :test_directory

    def configure(&block)
      block.call self
    end

    def start!
      get_files
      @files.map! { |file| CodeFile.new(file) }
      binding.pry
    end

    def get_files
      @files = Dir[File.expand_path "#{code_directory}/**/*.rb"]
    end

    def run(filename_with_path)
      Class.new do
        def self.expect(args)
          args.each do |method_name, test_vals|
            test_vals.each do |k, v|
              puts new.send(method_name, *k) == v
            end
          end
        end
        eval(File.read(filename_with_path))
      end
    end

    def generate_test_for(code_file)
      %Q(



      )
    end
  end
end
