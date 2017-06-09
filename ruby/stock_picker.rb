# Stock Picker from the Odin Project curriculum: https://www.theodinproject.com/courses/ruby-programming/lessons/building-blocks

# Returns the lowest value of an array
def buy_date(x)
 buy = 0
 i = 1
 while i < x.length
  if x[i] > x[buy] 
   buy = i
  end
  i += 1
 end
 puts x[buy]
end

# Returns the highest value of an array
def sell_date(x)
 sell = 0
 i = 1
 while i < x.length
  if x[i] < x[sell] 
   sell = i
  end
  i += 1
 end
 puts x[sell]
end

# Takes in an array of stock prices for one week
# Returns the best day to buy and the best day to sell
def stock_picker(prices)
 buy = buy_date(prices)
 sell = sell_date(prices)
 puts [buy, sell]
end

sample = [30, 2, 3, 5, 6, 100, 15]
stock_picker(sample)
