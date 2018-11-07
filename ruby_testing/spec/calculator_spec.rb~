require './lib/calculator'  #=> add this

RSpec.describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end
  describe "#sub" do
    it "returns the difference of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.sub(50, 20, 3)).to eql(27)
    end
  end

  describe "#mul" do
    it "returns the product of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.mul(50, 2, 3)).to eql(300)
    end
  end

  describe "#div" do    it "returns the quotient of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.div(30, 6, 1)).to eql(5)
    end
  end
end
