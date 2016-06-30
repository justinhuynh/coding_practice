def multiply(a, b)
  a * b
end

def add_it_up(a, b)
  a + b
end

expect multiply:
  {
    [2,5] => 10,
    [300,4] => 1200
  }

expect add_it_up:
  {
    [2,5] => 7,
    [3202,4] => 306
  }
