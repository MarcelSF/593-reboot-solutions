# A simple Hash

fruits_hash = {kiwi: 1, apple: 2, pineapple: 5}

# If we want the number of apples in the hash

puts fruits_hash[:apple] #just call the hash and between [] put the desired key.

# A more complex hash
# The key/value pair in hashes can hold practically anything you want.
# In this case, we have a hash that represents Rio de Janeiro.
# It has very distinct key/value pairs:

rio_hash = {
  name: 'Rio de Janeiro',
  population: 6700000,
  monuments: ['Sugar Loaf', 'Christ the Redeemer']
}

# What if we want to access the 'Christ the redeemer' monument?

puts rio_hash[:monuments][1]
 # Call the hash and pass the monuments key, this will give you an array in return.
 # Then, just call the correct index on the array. Other solutions are possible


# A hash of hashes

# Finally, you can even have a hash of hashes, something very common in APIs

hash_of_hashes = {
  brasil: {
    name: 'Rio de Janeiro',
    population: 6700000,
    monuments: ['Sugar Loaf', 'Christ the Redeemer']
  },
  germany: {
    name: 'Munich',
    population: 1400000,
    monuments: ['Mariensaule', 'Monument to King Ludwig I']
  }
}

# How would you access the 'Mariensaule' monument? Very easy if you know the keys
# Just call the keys in the correct order :D

puts hash_of_hashes[:germany][:monuments][0]
