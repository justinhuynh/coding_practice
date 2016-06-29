# have a rake generator
# write a method
# write specify inputs and outputs as hashes
# module TestData
#   def expect(args)
#     binding.pry
#   end
# end

# class TestExercise
  # extend TestData
puts self
  def multiply(a, b)
    a * b
  end

  def add_it_up(a, b)
    a + b
  end

  puts "hello"

  expect(
    multiply: {
      [2,5] => 10,
      [300,4] => 1200
    },
    add_it_up: {
      [2,5] => 7,
      [3202,4] => 306
    }
  )
# end

# how to load a file in the context of a class and execute

# figure out file
# create a class
# add method to class
