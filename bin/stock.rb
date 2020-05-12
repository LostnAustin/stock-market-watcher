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