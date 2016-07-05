require 'pry'

Dir[File.expand_path "lib/exercises/**/*.rb"].each{ |f| require_relative(f) if File.file?(f) }
