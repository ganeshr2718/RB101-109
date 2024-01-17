require 'pry'
require 'yaml'

def lang_selection
  lang = gets.chomp
  if lang == 'er'
    texts = YAML.load_file('calci_mess_en.yml')
  else
    texts = YAML.load_file('calci_mess_fr.yml')
  end
return texts
end

def valid_number?(a)
  status = true
  temp = a.chars
  if temp[0] !~ /[0-9]/ then status = false end
  a.each_char{|c| if c !~ /[0-9,.]/ then status = false end}
  if a.count(".") > 1 then status = false end
  return status
end

def get_number()
  num = gets.chomp()
  return num
end

def int_or_float (num1,num2)
  type_num1 = (/\./ === num1)
  type_num2 = (/\./ === num2)
  if type_num1 || type_num2
    return 'float'
  else
    return 'int'
  end
end

def prompt(string)
  puts "===>" + string
end

def add(num1, num2, type)
  if type == 'int'
    ans = num1.to_i + num2.to_i
  else
    ans = num1.to_f + num2.to_f
  end
  prompt("The sum of the two numbers is #{ans}")
end

def diff(num1,num2,type)
  if type == 'int'
    ans = num1.to_i - num2.to_i
  else
    ans = num1.to_f - num2.to_f
  end
  prompt("The difference of the two numbers is #{ans}")
end

def mul(num1,num2,type)
  if type == 'int'
    ans = num1.to_i * num2.to_i
  else
    ans = num1.to_f * num2.to_f
  end
  prompt("The product of the two numbers is #{ans}")
end

def div(num1,num2,type)
  if type == 'int'
    begin
    ans = num1.to_f / num2.to_i
    rescue
      puts 'divide by zero is not possible'
      return
    end
  else
    begin
    ans = num1.to_f / num2.to_f
    rescue
      puts 'divide by zero is not possible'
      return
    end
  end
  prompt("The quotient of the two numbers is #{ans}")
end

operand_msg = <<-MSG
  Choose one of the following options.(Type the keyword on the left side)
      add - To add two numbers
      sub - To find the difference of two numbers
      mul - To find the product of two numbers
      div - To find the quotient of the two numbers
      end - To end the current session of the calculator
  MSG

#puts texts['welcome_message']
num1 = ''
num2 = ''

prompt('select language of choice : type en for English and fr for French')
texts= lang_selection()
prompt(texts["welcome_message"])

loop do
  prompt(operand_msg)
  operator = gets.chomp
  return if operator == "end"
  until ['add', 'sub' ,'mul' ,'div'].include?(operator)
    prompt('Please enter a valid input from the options provided below.')
    prompt(operand_msg)
    operator = gets.chomp
  end
  prompt('Enter the two numbers')
  num1 = get_number()
  while valid_number?(num1) == false
    prompt(texts['number_format'])
    num1 = get_number()
  end
  num2 = get_number()
  while valid_number?(num2) == false
    prompt(texts['number_format'])
    num2 = get_number()
  end
  type = int_or_float(num1, num2)
  case operator
  when 'add'
    add(num1, num2, type)
  when 'sub'
    diff(num1, num2, type)
  when 'mul'
    mul(num1, num2, type)
  when 'div'
    div(num1, num2, type)
  end
end
