class Node
  attr_accessor :val, :root, :left, :right

  def initialize(val=nil)
    @val = val
    @parent = parent
    @left = left
    @right = right
  end


  # Insert a value into the binary tree
  def insert(x, node=self)
    if node.nil? 
      node = Node.new(x, self)
    elsif node.val.nil?
      node.val = x
    elsif x < node.val
      if node.left.nil?
        node.left = Node.new(x, node)
      else
        node.left.val = x
      end
    elsif x > node.val
      if node.right.nil?
        node.right = Node.new(x, node)
      else
        node.right.val = x
      end
    end
    return node
  end
  # Builds a balanced binary tree from an array of data
  def build_tree(data, node=self)
      data = data.sort
      build_bin_tree(data, 0, data.length - 1, node)
  end

  # Helper function
  def build_bin_tree(a, left, right, node)
    if left > right
      return nil
    end
    mid = (left + right) / 2
    if node.nil?
      node = Node.new(a[mid])
    elsif node.val.nil?
      node.val = a[mid]
    else
      insert(a[mid])
    end
    node.left = build_bin_tree(a, left, mid-1, node.left)
    node.right = build_bin_tree(a, mid+1, right, node.right)
    return node
  end

  # breadth First Search
  def bfs(value, node=self)
    if node.nil?
      return
    end
    queue = Queue.new[self]
    until queue.empty?
      current = queue.first
      if current.val == value
        return current
      end
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
      queue.shift
    end
  end

  # Depth First Search
  def dfs(value, node=self)
    return if node.nil?
    stack = [node]
    until stack.empty?
      current = stack.pop
      return current if current.val == value
      stack.push(current.right) unless current.right.nil?
      stack.push(current.left) unless current.left.nil?
    end
  end

  # Recursive DFS
  def dfs_rec(val, node=self)
    if node.nil?
      return
    end
    if node.val == val
      return node
    end
    dfs_rec(val, node.left)
    dfs_rec(val, node.right)
  end
end
