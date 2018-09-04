  module Enumerable
    def my_each
      i = 0
      while i < self.size do
        yield(self[i])
        i += 1
      end
      self
    end

    def my_each_with_index
      i = 0
      while i < self.size do
        yield(self[i], i)
        i += 1
      end
      self
    end

    def my_select
      new_arr = []
      self.my_each do
        |item| new_arr << item if yield(item)
      end
      new_arr
    end
    def my_all?
      self.my_each do
         |item| return false unless yield(item) 
      end
        return true
    end

    def my_any?	
      self.my_each do
        |item| return true if yield(item)
      end
      return false
    end

    def my_none?
      self.my_each do 
        |item| return false  if yield(item)
      end
      return true
    end

    def my_count
      count = 0
      self.my_each do 
        |item| count += 1 if yield(item)
      end
      count
    end

    def my_map
      new_arr = []
      self.each do
        |item| new_arr << yield(item)
      end
      new_arr
    end

    def my_inject(result = nil, &block)
      accumulator = 0 if accumulator == nil
      result = self[accumulator]
      i = accumulator + 1
      while i < self.size  do
        result = block.call(result, self[i])
        i += 1
      end
      result
    end
end

def multiply_els(x)
  puts x.my_inject { |result, x| result * x }
end
