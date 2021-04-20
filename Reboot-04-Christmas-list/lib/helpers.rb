def display_list(list)
  list.each_with_index do |gift, index|
    bought = gift[:bought] ? '[x]' : '[ ]'
    # {name: 'Iphone', price: 900}
    puts "#{index + 1} #{bought} -> #{gift[:name]} - price: #{gift[:price]}"
  end
end

def scrape_etsy(keyword)
  # Empty etsy_array where we place all of the etsy_gifts that will be shown to the user
  etsy_array = []
  # build the url
  url = "https://www.etsy.com/search?q=#{keyword}"
  # Access the URL and store the response in a variable
  html_content = URI.open(url).read
  # Parse the HTML content
  doc = Nokogiri::HTML(html_content)
  # Search through the parsed HTML
  doc.search('.v2-listing-card .v2-listing-card__info').first(4).each do |element|
    # Element is a Nokogiri Element -> Which means, we can search through it again.
    name = element.search('.text-body').text.strip
    price = element.search('.currency-value').text.strip.to_i
    etsy_gift = {name: name, price: price, bought: false}
    etsy_array << etsy_gift
    # Look for name
  end
  return etsy_array
end
