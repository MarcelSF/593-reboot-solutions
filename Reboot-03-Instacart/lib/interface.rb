# Store
  # Model as a hash of hashes

store = {kiwi: {price: 2, stock: 100}, # p store[:kiwi][:price]
apple: {price: 1, stock: 5},
banana: {price:  0.5, stock: 20},
strawberry: {price: 2.5, stock: 500}}

# initialize the cart as an empty array
cart = []
# initialize the user input as empty string. It just needs to be there for the condition to start
input = ''
# 1 - Greet the user
puts "Welcome to our fruit shop!"
puts "In our store today we have:"
# 2 - Display what's in store
until input == :quit
  store.each do |fruit, info|
    puts "#{fruit} - Price $#{info[:price]} / Stock: #{info[:stock]}"
  end
  # 3 - Ask what the user wants to buy or ask if they want to checkout
  puts "What do you wish to purchase? Type quit to checkout"
  input = gets.chomp.to_sym
  if store.key?(input)
  # 4 - If they buy something, add that item to the shopping cart
      # Ask them the quantity.
    puts "Please choose the quantity. Type a number"
    quantity = gets.chomp.to_i
    if quantity > store[input][:stock]
      puts "Sorry, we only have #{store[input][:stock]} in stock"
    else
      # If there is enough in stock, add to the cart as a hash!
      cart << {name: input, quantity: quantity}
      # Don't forget to subtract from the stock as well :)
      store[input][:stock] -= quantity
    end
  elsif input == :quit
  # 5 - If they type 'quit', proceed to checkout
    puts "Thank you, proceed to checkout"
  else
    puts "Sorry, we don't have #{input} today"
  end
end
# 6 - Calculate the total amount owed. Remember to use the keys to acces the Store hash.
# ["kiwi", "apple"]
sum = 0
cart.each do |fruit_hash|
  # Multiply the prices by the quantity chosen by the user
  name = fruit_hash[:name]
  quantity = fruit_hash[:quantity]
  # we simply find the price by using name as the correct key in the Store hash.
  sum += store[name][:price] * quantity
end
# 7 - Display the bill to the user
puts "You must pay #{sum} euros"






