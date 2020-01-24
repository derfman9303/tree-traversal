class Tree
  attr_accessor :payload, :children
  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

@stack = []
def depth(current_node, n)
  puts current_node.payload
  if current_node.payload == n
    return current_node
  elsif !current_node.children.empty?
    current_node.children.reverse.each do |child|
      @stack.push(child)
    end
  end
  if !@stack.empty?
    next_node = @stack.pop
    depth(next_node, n)
  else
    return "Node not found"
  end
end

@queue = []
def breadth(current_node, n)
  puts current_node.payload
  if current_node.payload == n
    return current_node
  elsif !current_node.children.empty?
    current_node.children.each do |child|
      @queue.push(child)
    end
  end
  if !@queue.empty?
    next_node = @queue.shift
    breadth(next_node, n)
  else
    return "Node not found"
  end
end

puts depth(trunk, 11)
puts "---"
puts breadth(trunk, 11)
