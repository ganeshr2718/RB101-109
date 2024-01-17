require 'pry'
def prompt(string)
  puts("==> #{string}")
end

prompt('Hey, This is a mortgage/Car Loan Calculator')
prompt('Please enter your loan amount')
loan_amount = ''
apr = ''
loan_dur_years = ''
loop do
  loan_amount = gets.chomp
  if loan_amount.empty?() || loan_amount.to_f < 0
    prompt("Enter a valid amount")
  else
    break
  end
end
prompt("Please enter your APR(Annual Percentage Rate) Eg:, enter \
 6.5 if its 6.5 %")
loop do
  apr = gets.chomp
  if apr.empty?() || apr.to_f < 0
    prompt("Enter a valid annual percentage rate")
  else
    break
  end
end
prompt('please enter your loan duration in years')
loop do
  loan_dur_years = gets.chomp
  if loan_dur_years.empty?() || loan_dur_years.to_f < 0
    prompt("Enter a valid loan duration")
  else
    break
  end
end
# Conversion to real value from percentage
apr = apr.to_f / 100
# Conversion to monthly percentage rate
apr_months = apr.to_f / 12
# Conversion of loan duration to months
loan_dur_months = loan_dur_years.to_f * 12
month_payments = \
  loan_amount.to_f * (apr_months / (1 - ((1 + apr_months)**(-loan_dur_months))))
prompt(format("The monthly payment for the loan is %.2f dollars", month_payments))
