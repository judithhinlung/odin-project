class LinkedList
  def initialize
    @head = nil
    @tail = @head
  end

  # Append adds a new node to the end of the list
  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
     end
        @tail = node
  end
# Prepend adds a node to the start of the list
  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end
  # Enumerates through each element in the list and passes it to the block

  def each(node=@head)
    until node.nil?
      result = yield(node)
      node = node.next_node
    end
    result
  end
  # Takes each element and its index as arguments, passes each element to the block
  def each_with_index(node=@head)
    i = 0
    until node.nil?
      result = yield(node, i)
      node = node.next_node
      i += 1
    end
    result
  end
  # size returns the total number of nodes in the list
  def size
    counter = 0
    each { |node| counter += 1 }
    return counter
  end

  # Returns the first element in the list
  def head
    return @head.value
  end
  # Returns the last element in a list
  def tail
    each { |node| return node.value if node.next_node.nil? }
  end

  # Returns the node at the given index
  def at(index)
    if index >= self.size
      puts "index  out of range."
    else
      each_with_index do |node, i|
        return node.value
      end
    end
  end

  # Removes the last element from the list
  def pop
    each_with_index do |node, index|
      if index == self.size - 2
        @tail = node
        @tail.next_node = nil
      end
    end
  end

  # Returns true if list contains element
  def contains?(element)
    self.each do |node| 
      return true if node.value == element
    end
    return false
  end

  # Returns the index of the node containing the data
  def find(data)
    self.each_with_index do |node, index|
      if node.value == data
        return index
      end
    end
    return "Data not found"
  end

  # To_s
  def to_s
    string = ""
    self.each_with_index do |node, index|
      if index == self.size - 1
        string += "#{node.value}"
      else 
        string += "#{node.value} -> "
      end
    end
  end

  # Inserts an element at a given index
  def node_at(index)
    if index >= self.size
      puts "index  out of range."
    else
      each_with_index do |node, i|
        return node if index == i 
      end
    end
  end

  def insert_at(value, index)
    if index == 0
      self.prepend(value)
    else
      previous = self.node_at(index - 1)
      current = self.node_at(index)
puts current.value
      new_node = Node.new(value)
puts new_node.value
      previous.next_node = new_node
      new_node.next_node = current
    end
  end
  # Removes an element at a given index
  def remove_at(index)
    if index == 0
      @head = @head.next_node
    elsif index == self.size - 1
      self.pop
    else
      previous = self.node_at(index - 1)
      current = self.node_at(index)
      previous.next_node = current.next_node
    end
  end
end

class Node
  attr_reader :value 
  attr_accessor :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end

end
