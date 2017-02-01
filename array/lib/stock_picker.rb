
def stock_picker(stock_array)
  p stock_array
  possible_profits_days = []
  profits = []

  stock_array.each_with_index do |price , day|
    other_day = day + 1
    while other_day < stock_array.length
      if price < stock_array[other_day]
        possible_profits_days <<[day, other_day]
        profits << stock_array[other_day] - price
      end
      other_day += 1
    end
  end
  max_profit_day = profits.index(profits.max)
  max_profit_day ? possible_profits_days[max_profit_day] : []

end
