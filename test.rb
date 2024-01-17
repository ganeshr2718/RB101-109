(1..10)                  .tap {|x| puts "original: #{x}" }
  .to_a                  .tap {|x| puts "array:    #{x}" }
  .select {|x| x.even? } .tap {|x| puts "evens:    #{x}" }
  .map {|x| x*x }        .tap {|x| puts "squares:  #{x}" }


# require "benchmark"

# execution_time = Benchmark.measure do
#   array = [1,2,3,4]

#   array.map { |x| puts x}

#  # x.each {|x| puts x}

# end

# puts execution_time
