# Loan calculator project for Launch School's Programming foundations
# m = p * (j / (1 - (1 + j)**(-n)))

def monthly_payment(loan_amount, monthly_interest, loan_duration_months)
  loan_amount *
    (monthly_interest / (1 - (1 + monthly_interest)**-loan_duration_months))
end

puts 'What is the loan amount (in dollars)?'
loan_amount = gets.chomp.to_i

puts 'What is the Annual Percentage Rate (APR)?'
apr = gets.chomp.to_f / 100

puts 'What is the loan duration (in year)?'
loan_duration_years = gets.chomp.to_i

loan_duration_months = loan_duration_years * 12
monthly_interest_rate = apr / 12

payment = monthly_payment(loan_amount,
                          monthly_interest_rate,
                          loan_duration_months)

puts "Your monthly payment will be $#{payment.round(2)}"
