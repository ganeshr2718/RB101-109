# frozen_string_literal: true

# Calculator program in ruby

def add(num1, num2)
  Kernel.puts "The sum of the two numbers is #{num1 + num2}"
end

def sub(num1, num2)
  Kernel.puts "The difference of the two numbers is #{num1 - num2}"
end

def mul(num1, num2)
  Kernel.puts "The product of the two numbers is #{num1 * num2}"
end

def div(num1, num2)
  result = num1 / num2
  Kernel.puts "The division quotient of the two numbers is #{result}"
rescue ZeroDivisionError => e
  Kernel.puts "Error is #{e}"
end

loop do
  Kernel.puts "Enter what you would like to do or type end to close the program
        1. add
        2. sub
        3. mul
        4. div "
  response = Kernel.gets.chomp
  return if response == 'end'

  Kernel.puts 'Enter any two numbers'
  num1 = Kernel.gets.chomp.to_i
  num2 = Kernel.gets.chomp.to_i

  if response == 'add'
    add(num1, num2)
  elsif response == 'sub'
    sub(num1, num2)
  elsif response == 'mul'
    mul(num1, num2)
  elsif response == 'div'
    div(num1, num2)
  else
    Kernel.puts ' type an appropriate response'
  end
end
