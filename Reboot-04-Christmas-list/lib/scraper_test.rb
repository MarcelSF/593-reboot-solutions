require 'open-uri'
require 'nokogiri'

puts "What are you searching on Etsy?"
article = gets.chomp

# 1. We get the HTML page content thanks to open-uri
html_content = URI.open("https://www.etsy.com/search?q=#{article}").read
# 2. We build a Nokogiri document from this file
doc = Nokogiri::HTML(html_content)

# 3. We search for the correct elements containing the items' title in our HTML doc
doc.search('.v2-listing-card .v2-listing-card__info').first(4).each do |element|
  # 4. For each item found, we extract its title and print it
  name = element.search('.text-body').text.strip
  price = element.search('.currency-value').text.strip
  gift = {name: name, price: price}
  etsy_array << gift
end
