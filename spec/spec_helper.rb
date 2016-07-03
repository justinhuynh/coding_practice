require 'pry'

binding.pry
def tests_for(*args, &block)
end

Dir[File.expand_path "lib/exercises/**/**"].each{ |f| require_relative(f) if File.file?(f) }
