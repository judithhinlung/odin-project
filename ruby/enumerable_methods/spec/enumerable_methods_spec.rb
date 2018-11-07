require './lib/enumerable_methods'

describe '#Enumerable' do
  let (:arr) {[1, 2, 3, 4, 5, 7, 9]}
  describe 'my_each' do
 
    it "iterates through each element of the array" do
      expect(arr.my_each { |x| puts x }).to eql([1, 2, 3, 4, 5, 7, 9])
    end
  end

  describe '#my_select' do
    it "select elements from an array" do
      expect(arr.my_select { |x| x%2 == 0 }).to eql([2, 4])
    end
  end

  describe '#my_all?' do
    it "returns true if all elements in the array satisfy the requirement" do
      expect(arr.my_all? { |x| x < 10 }).to eql(true)
    end
  end

  describe '#my_any?' do
    it "Returns true if at least one element satisfies the requirement" do
      expect(arr.my_any? { |x| x < 12}).to eql(true)
    end
  end

  describe '#my_none?' do
    it "Returns true if nno element satisfies the requirement" do
      expect(arr.my_none? { |x| x*2 == 100 }).to eql(true)
    end
  end

  describe '#my_map' do
    it "performs a function on all elements" do
      expect(arr.my_map { |x| x * x }).to eql([1, 4, 9, 16, 25, 49, 81])
    end
  end
  describe '#my_count' do
    it "Returns the length of the array" do
      expect(arr.my_count { |x| x < 10 }).to eql(7)
    end
  end

  describe '#my_inject' do
    it "modifies all elements of an array and collects them into a result, map-reduce" do
      expect(arr.my_inject { |result, x| result + x }).to eql(31)
    end
  end
end
