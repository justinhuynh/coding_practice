module TestBuilder
  class << self
    attr_accessor :code_directory, :test_directory

    def configure(&block)
      block.call self
    end

    def start!
      get_files
      # @files.map! { |file| CodeFile.new(file) }
      @files.each { |file| run(file) }
      binding.pry
    end

    def get_files
      @files = Dir[File.expand_path "#{code_directory}/**/*.rb"]
    end

    def run(filename_with_path)
      methods_loaded = {}
      Class.new do
        self.define_singleton_method :expect do |args|
          methods_loaded[args.keys.first] = args.values.first
        end
        eval(File.read(filename_with_path))
        binding.pry
      end
      methods_loaded
      generate_test_for(filename_with_path, methods_loaded)
    end

    def test_file_name(filename_with_path)
      base_name = File.basename(filename_with_path.sub(/.rb$/, "_spec.rb"))
      "spec/exercises/" + base_name
    end

    # def create_file(filename_with_path)
    #   File.write(test_file_name, test_code)
    # end


    def generate_test_for(filename_with_path, methods_loaded)
      template = get_template
      @methods = methods_loaded
      test_code = ERB.new(template, nil, '>').result(binding)
      test_file = test_file_name(filename_with_path)
      File.write(test_file, test_code)
    end

    def get_template
      File.read("lib/coding_practice/templates/test.erb")
    end
  end
end
