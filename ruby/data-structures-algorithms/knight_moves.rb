# Nodes
class Node
  attr_accessor :x, :y, :next_node, :moves

  def initialize(x, y, next_node=nil, distance=0, moves=[])
    @x = x
    @y = y
    @next_node = next_node
    @moves = moves
  end
end

# Build tree with all possible moves from current square as children
def get_moves(start)
  x = start.x
  y = start.y
  moves = []
  moves << Node.new(x+2, y+1)
  moves << Node.new(x+2, y-1)
  moves << Node.new(x+1, y+2)
  moves << Node.new(x+1, y-2)
  moves << Node.new(x-1, y+2)
  moves << Node.new(x-1, y-2)
  moves << Node.new(x-2, y+1)
  moves << Node.new(x-2, y-1)
  moves = moves.reject do |node|
    node.x < 0 || node.x > 8
  end
  moves = moves.reject do |node|
    node.y < 0 || node.y > 8
  end
  moves.each { |move| move.next_node = start }
end

# Find shortest path from starting to ending square
def build_path(start, end_pos)
  node = Node.new(start[0], start[1])
  target = Node.new(end_pos[0], end_pos[1])
  visited_nodes = []
  next_moves = [node]
  until next_moves.empty? do
    node = next_moves.shift
    puts "Current node: #{node.x}, #{node.y}"
    if node.x == target.x && node.y == target.y 
      return node
    end
    visited_nodes.push(node)
    node.moves = get_moves(node)
    node.moves.reject do |square|
      visited_nodes.include?(square)
    end
    node.moves.each do |move| 
      next_moves.push(move)
    end
  end
  return node
end

# Reconstruct path through the next_node links
def find_path(start, target)
  node = build_path(start, target)
  path = [node]
  until node.next_node.nil? do
    node = node.next_node
    path.push(node)
  end
  path = path.reverse
  puts "You made it in #{path.length} moves.  Here is your path: "
  path.each do |node|
    puts "[#{node.x}], [#{node.y}]"
  end
end

# Tests
start = [1, 1]
end_pos = [4, 3]
path = find_path(start, end_pos)
