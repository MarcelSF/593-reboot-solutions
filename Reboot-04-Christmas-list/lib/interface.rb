require_relative 'helpers.rb'
require 'pry-byebug'
require 'open-uri'
require 'nokogiri'
#1 greet the user
puts "\n"
puts "*" * 31
puts "*" + " " * 29 + "*"
puts "*  Welcome to Christmas List  *"
puts "*" + " " * 29 + "*"
puts "*" * 31
#2 Display the options to the user (good place to start the loop)
action = ''
gift_list = []
until action == 'quit'
  puts "Which action do you wish to perform?(list|add|delete|mark|idea|quit)"
  #3 Get the user input
  action = gets.chomp

  case action
  #4 Perform the correct action based on user input(list|add|delete|quit)
      # For now, just do a simple puts as the action
  when 'list'
    if gift_list.length == 0
      puts "Add something to the list first"
    else
      display_list(gift_list)
    end
  when 'add'
    puts "What is the name of the gift you wish to add?"
    gift_name = gets.chomp
    puts "What is the price of the gift?"
    gift_price = gets.chomp.to_i
    gift_hash = {name: gift_name, price: gift_price, bought: false}
    gift_list << gift_hash
  when 'delete'
    puts "Which gift do you wish to delete? Type a number"
    # list the gifts
    display_list(gift_list)
    # Get the user input
    gift_index = gets.chomp.to_i - 1
    # Remove the gift from the gift_list
    gift_list.delete_at(gift_index)
  when 'mark'
    puts "What do you wish to mark as bought? (please type the index)"
    display_list(gift_list)
    # get the index for the gift
    gift_index = gets.chomp.to_i - 1
    gift_list[gift_index][:bought] = true
    display_list(gift_list)
  when 'idea'
    puts "What are you looking for, dear customer?"
    idea = gets.chomp
    # Call the scrape helper method
    results = scrape_etsy(idea)
    # display the results
    display_list(results)
    #Ask the user to pick one of the Etsy ideas
    puts "Please choose which etsy gift you wish to add to your gift list (choose index)"
    index = gets.chomp.to_i - 1
    # Add the chosen etsy gift to the gift_list
    gift_list << results[index]
    display_list(gift_list)
  when 'quit'
    puts "Goodbye!"
  end
end


# How do you model your gift_list?
  # What characterizes a gift? What info do we need?
  # -name, -price, -bought or not?
  # Do you use a hash? An array?
   # The gift itself -> A hash {name: 'PS5', price: 500, bought: false}
   # The list -> Should be an array. With Gift hashes inside.
# List Action
  # Iterate over the gift_list array and display each gift.
# Add Action
  # Ask the user for gift name
  # Ask for gift price
  # Place the gift_name and gift_price in a hash with the correct keys
  # Place the gift hash inside the gift_list array
# Delete Action
  # Display the gift list
  # Ask the user for the index of the gift they wish to delete
  # Delete the gift from the gift_list array using delete_at

# Mark Action
  # Add MARK to the list of options
  # New when/elsif statement in your flow
  # display the gift list
  # ask the user which item they want to mark as bought (use index for ease of use)
  # Remodel the gift to have a new key:value pair -> bought: true, or bought: false
  # Update the correct gift hash with bought: true
  # display the updated gift list

# IDEA action
  # Add IDEA to the list of options
  # New when/elsif statement in your flow to handle IDEA
  # Ask the user for input (What are you looking for today?)
  # Interpolate the user input in the URL for Etsy("https://www.etsy.com/search?q=#{article}")
  # access the URL with URI.open and store the result
  # Parse the result with NOKOGIRI and store it in a variable
  # We search through the document for name and price of the gift.
  # place the information in an array of hashes (etsy_array?)
  # Display this array of gifts to the user and ask them which one they want to add to the gift list
  # Get user Index
  # Add the corresponding gift to the gift_list
