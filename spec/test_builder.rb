require 'spec_helper'

class TestBuilder
  class << self
    def run(file)
      @filename = File.basename(file)
      @prefix = @filename.sub("_spec.rb","")
      @class_name = camelcase
      STDERR.puts(camelcase)
      binding.pry
    end

    def camelcase
      @prefix.split('_').collect(&:capitalize).join
    end

    def generate



  end
end
