class Calculator
  def add(*numbers)
    numbers.inject(0) { |result, item| result + item }
  end

  def sub(*numbers)
    result = numbers[0]
    i = 1
    while i < numbers.length do
      result -= numbers[i]
      i += 1
    end
    result
  end

  def mul(*numbers)
    numbers.inject(1) { |result, item| result * item }
  end

  def div(*numbers)
    result = numbers[0]
    i = 1
    while i < numbers.length do
      result /= numbers[i]
      i += 1
    end
    result
  end
end
