def green(a, b)
  a * b
end

def plus_one(a)
  a + 1
end

tests_for green:
  {
    [2,5] => 10,
    [300,4] => 1200
  }

tests_for plus_one:
  {
    [5] => 6,
    [3205] => 3206
  }
