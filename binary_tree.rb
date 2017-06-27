class Node
  attr_accessor :value, :children, :parent, :left, :right
  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

  def left
    return @left.value if @left
    nil
  end

  def right
    return @right.value if @right
    nil
  end

  def get_children
    [@left, @right]
  end

  def get_parent
    return @parent.value if @parent
    nil
  end


  def set_leaf(node_value)
    if node_value < @value
      if @left
        @left.set_leaf(node_value)
      else
        n = Node.new(node_value)
        @left = n
        n.parent = self
      end
    else
      if @right
        @right.set_leaf(node_value)
      else
        n = Node.new(node_value)
        @right = n
        n.parent = self
    end
  end

end

def build_tree(array)
end
