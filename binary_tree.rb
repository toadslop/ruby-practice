class TreeNode
    attr_accessor :data, :left, :right

    def initialize(data, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
    end
end

class BinaryTree
    attr_accessor :head

    def initialize(head = nil)
      @head = head
    end
end

# tree = BinaryTree.new
# p tree
# p tree.head

# node1 = TreeNode.new(1)
# tree.head = node1
# node2 = TreeNode.new(2)
# node3 = TreeNode.new(3)
# node1.left = node2
# node1.right = node3

# p tree
