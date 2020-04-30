# Loan calculator project for Launch School's Programming foundations
# m = p * (j / (1 - (1 + j)**(-n)))

def valid_number?(num)
  Integer(num)
rescue ArgumentError
  nil
end

def numeric?(num)
  !Float(num).nil?
rescue ArgumentError
  false
end

def float?(num)
  num == num.to_f.to_s
end

def integer?(num)
  num == num.to_i.to_s
end

def monthly_payment(loan_amount, monthly_interest, loan_duration_months)
  loan_amount *
    (monthly_interest / (1 - (1 + monthly_interest)**-loan_duration_months))
end

puts 'Welcome to the loan calculator!'

loop do
  loan_amount = nil
  loop do
    puts 'What is the loan amount (in dollars)?'
    loan_amount = gets.chomp.delete('$')
    break if numeric?(loan_amount)
    puts 'Not a valid number...'
  end
  loan_amount = loan_amount.to_i

  apr = nil
  loop do
    puts 'What is the Annual Percentage Rate (APR)?'
    puts 'Example: 4.25 for 4.25% or 2 for 2%'
    apr = gets.chomp.delete('%')
    break if numeric?(apr)
    puts 'Not a valid number...'
  end
  apr = apr.to_f / 100

  loan_duration_years = nil
  loop do
    puts 'What is the loan duration (in year)?'
    loan_duration_years = gets.chomp
    break if integer?(loan_duration_years)
    puts 'Not a valid number...'
  end
  loan_duration_years = loan_duration_years.to_i

  loan_duration_months = loan_duration_years * 12
  monthly_interest_rate = apr / 12

  payment = monthly_payment(loan_amount,
                            monthly_interest_rate,
                            loan_duration_months)

  puts "Your monthly payment will be $#{format('%02.2f', payment)}"

  puts 'Do you want to calculate another loan amount (Y/N)'
  answer = gets.chomp
  break unless answer.upcase.start_with? 'Y'
end

puts 'Thanks for using the loan calculator!'
