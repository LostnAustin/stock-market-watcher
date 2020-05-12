require 'nokogiri'
require 'open-uri'
require_relative 'stock'


page = Nokogiri::HTML(URI.open('https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap'))

table = page&.css('.tv-data-table');
rows = table.search('tr');
stock_arr = []

rows.each do |row|
  stock_content = row.search('td').map { |td| td.text.strip }
  stock_content[0]&.gsub!("\n\t\t\t\t\t\t\t\t\t", " ")
  stock_arr << Stock.new(stock_content) if stock_content.length.positive?
end
