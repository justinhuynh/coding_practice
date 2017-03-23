class TestBuilder
  CONFIG = [
    :code_directory,
    :output_directory,
    :test_directory,
    :template_directory,
    :framework
  ]

  CONFIG.each do |attribute|
    define_method attribute do
      self.class.send attribute
    end
  end

  class << self
    CONFIG.each { |attribute| attr_accessor attribute }

    def configure(&block)
      block.call self
    end

    def start!
      get_files.each do |file|
        test_builder = new(file)
        test_builder.instance_eval(File.read(file))
        test_builder.generate_output_code
        test_builder.generate_test
      end
    end

    def get_files
      Dir["#{code_directory}**/*.rb"]
    end
  end

  attr_reader :file
  attr_accessor :methods_loaded

  def initialize(file)
    @file = file
    @methods_loaded = {}
  end

  def tests_for(args, &block)
    @methods_loaded[args.keys.first] = args.values.first
  end

  def test_file_name
    test_directory + test_base_name
  end

  def output_file_name
    output_directory + base_name
  end

  def test_base_name
    base_name.sub(/.rb$/, "_spec.rb")
  end

  def base_name
    File.basename(file)
  end

  def generate_test
    File.write(test_file_name, test_code)
    puts "#{test_file_name} created"
  end

  def generate_output_code
    File.write(output_file_name, output_code)
    puts "#{output_file_name} created"
  end

  def sandbox_code
    File.read(file)
  end

  def output_code
    sandbox_code[0...tests_start_char]
  end

  def tests_start_char
    sandbox_code.index("tests_for")
  end

  def test_code
    @methods = methods_loaded
    ERB.new(template, nil, '>').result(binding)
  end

  def template
    File.read("#{template_directory}#{framework}.erb")
  end
end
