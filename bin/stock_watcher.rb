require 'nokogiri'
require 'open-uri'
require 'json'

page = Nokogiri::HTML(URI.open('https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap'))

table = page&.css('.tv-data-table');

rows = table.search('tr');

class Stock
  attr_reader :name, :last, :change_percentage, :change_value, :rating, :vol, :market_cap

  def initialize(stock_data)
    @name = stock_data[0]
    @last = stock_data[1]
    @change_percentage = stock_data[2]
    @change_value = stock_data[3]
    @rating = stock_data[4]
    @vol = stock_data[5]
    @market_cap = stock_data[6]
  end
end

stock_arr = []

rows.each do |row|
  row_content = row.search('td').map { |td| td.text.strip }
  row_content[0]&.gsub!("\n\t\t\t\t\t\t\t\t\t", " ")
  stock_arr << Stock.new(row_content) if row_content.length.positive?
end

p stock_arr[0].name