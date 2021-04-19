#1 - Greet the user
puts "Welcome to the amazing Horse Race!"

# array of horses -> An array of strings
horses = ['Dom', 'Jimmy', 'Stormy', 'Arabian', 'Secretariat', 'Burt']

# Our initial conditions when the user loads the program
balance = 100
user_input = 'yes'

#2 - Print the list of horses that are racing
# We use the indexes to allow the user to choose the horse
while balance >= 20 && user_input == 'yes'
  # - determine what are the conditions for the loop (balance and a yes/no answer)
  horses.each_with_index do |horse, index|
    puts "#{index + 1} -> #{horse}"
  end
  #3 - Ask the user to place a bet/ choose a horse
  puts "Pick your horse -> Pick a number"
  user_choice = gets.chomp.to_i - 1 # Change to integer because indexes are integers
  #4 - Randomly choose a winner
  winner_index = rand(0...horses.length) # ... because we want to exclude the upper bound
  #5 - Show the result
  puts "The winner is #{horses[winner_index]}"
  puts "You chose #{horses[user_choice]}"
  #6 - Tell the user if they won or lost
  if user_choice == winner_index
    puts "Congratulations, you won!"
    # 9 - If the user won -> Add 100 euros
    balance += 100
  else
    puts "Sorry, you lost!"
    # - If the user lost -> Subtract 20 euros
    balance -= 20
  end

  # Show the user their balance
  puts "Your current balance is #{balance}"
  # Check if they can keep playing
  if balance >= 20
    # 10 - Ask if the user wants to bet again.
    puts "Would you like to play again? (yes/no)"
    user_input = gets.chomp
  else
    # 11 - If the user balance is below 20, forcefully exit the program (exit the loop)
    puts "Sorry, you don't have enough money, come back another day."
  end
end
