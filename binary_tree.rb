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

    def in_order(temp = @head)
      unless temp
        return
      end

      in_order(temp.left)
      puts temp.data.to_s + " "
      in_order(temp.right)

    end

    def insert(data)
      queue = []
      queue.append(@head)

      while queue.length
        temp = queue[0]
        queue = queue.drop(1)

        unless temp.left
          temp.left = TreeNode.new(data)
          break
        else
          queue.append(temp.left)
        end

        unless temp.right
          temp.right = TreeNode.new(data)
          break
        else
          queue.append(temp.right)
        end
      end
    end
end

tree = BinaryTree.new

tree.head = TreeNode.new(10)
tree.head.left = TreeNode.new(11)
tree.head.left.left = TreeNode.new(7)
tree.head.right = TreeNode.new(9)
tree.head.right.left = TreeNode.new(15)
tree.head.right.right = TreeNode.new(8)
tree.in_order
tree.insert(12)
puts ""
tree.in_order