require 'csv'

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

def load_csv # Use the load_csv method as you load up your program
  filepath = 'lib/gifts.csv'
  p filepath
  # read from the CSV, create gifts hashes and store them in an array
  gifts = []

  CSV.foreach(filepath, { headers: :first_row }) do |row|
    gift = {name: row['name'], price: row['price'].to_i, bought: row['bought'] == 'true'}
    gifts << gift
  end
  return gifts
end


def save_to_csv(gift_list) # Use the save_to_csv method whenever there is a change in your gift_list!
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath = 'lib/gifts.csv'

  CSV.open(filepath, 'wb', csv_options) do |csv|
    csv << ['name', 'price', 'bought']

    gift_list.each do |gift|
      csv << [ gift[:name], gift[:price], gift[:bought] ]
    end
  end

end
