class Node
  attr_accessor :value, :children, :parent, :left, :right
  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

  def get_children
    [@left, @right]
  end

  def get_sibling
    return nil unless @parent
    self == @parent.left ? @parent.right : @parent.left
  end

end

class BinaryTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def root
    @root
  end

  def set_root(node_value)
    @root = Node.new(node_value)
  end

  def build_tree(array)
    until array.empty?
      n = array.sample
      if @root
        set_leaf(@root, n)
      else
        @root = Node.new(n)
      end
      array.delete_at(array.index(n))
    end
  end

  def set_leaf(node, node_value)
    if node_value < node.value
      if node.left
        set_leaf(node.left, node_value)
      else
        n = Node.new(node_value)
        node.left = n
        n.parent = node
      end
    else
      if node.right
        set_leaf(node.right, node_value)
      else
        n = Node.new(node_value)
        node.right = n
        n.parent = node
      end
    end
  end

  def breadth_first_search(target_value)
    a = [@root]
    result = nil
    a.each do |node|
      if node.value == target_value
        result = node
        break
      end
      a << node.left if node.left
      a << node.right if node.right
    end
    result
  end

  def depth_first_search(target_value)
    stack = [@root]
    result = nil
    stack.each do |node|
      if target_value == node.value
        result = node
        break
      elsif node.left
        stack << node.left
      elsif node.right
        stack << node.right
      elsif node.get_sibling and node == node.parent.left
        stack << node.get_sibling
      else
        current_node = node.parent
        next_node = nil
        until next_node
          break if current_node.nil?
          if current_node == current_node.parent.left and current_node.get_sibling
            next_node = current_node.get_sibling
            stack << next_node
          else
            current_node = current_node.parent
          end
        end
      end
    end
    result
  end

  def dfs_rec(node_value, node = @root)
    if node.value == node_value
      return node
    else
      left_child = dfs_rec(node_value, node.left) if node.left
      return left_child unless left_child.nil?
      right_child = dfs_rec(node_value, node.right) if node.right
      return right_child unless right_child.nil?
      nil
    end
  end

end
