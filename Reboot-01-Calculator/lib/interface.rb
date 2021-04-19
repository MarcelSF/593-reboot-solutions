require_relative 'calculator.rb'

#1 - Greet the user!
puts "Welcome to the calculator!"
# - This is where the loop starts
# - create the condition
user_input = 'yes'
# - Establish the condition for the loop (user input)
# condition = 'yes'
# until condition == 'no'
while user_input == 'yes'
  #2 - Ask the user for the first number
  puts "Please type the first number"
  first = gets.chomp.to_i
  #3 - Ask the user for the second number
  puts "Please type the second number"
  second = gets.chomp.to_i
  #4 - Ask the user for the operator
  puts "What operation do you wish to perform? (+ | - | * | /)"
  operator = gets.chomp
  #5 - Make the calculation
  # Calculate method is defined in another file, hence the require_relative
  result = calculate(first,second,operator) # passing first, second and operator as arguments
  #6 - Display the result
  puts "The result is: #{result}"
  #7 - Ask the user if they wish to calculate again
  puts "Do you want to calculate again? (yes/no)"
  user_input = gets.chomp
end
