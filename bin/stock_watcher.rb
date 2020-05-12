require 'nokogiri'
require 'open-uri'
require 'json'

page = Nokogiri::HTML(URI.open('https://www.tradingview.com/markets/stocks-usa/market-movers-large-cap'))
p page.class
table = page&.css('.tv-data-table');
p table.class
rows = table.search('tr');
p rows[1].search('td')[0].text