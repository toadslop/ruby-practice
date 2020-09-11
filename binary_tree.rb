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

    def find(data)
      queue = []
      queue.append(@head)

      while queue.length
        temp = queue[0]
        queue = queue.drop(1)

        if temp.left.data == data
          return temp.left
        else
          queue.append(temp.left)
        end

        if temp.right.data == data
          return temp.right
        else
          queue.append(temp.right)
        end
      end
      return false
    end

    def delete(data)
      deep_right = @head
      delete_node = self.find(data)

      while deep_right.right
        deep_right = deep_right.right
      end

      delete_node.data = deep_right.data
      deep_right.data = nil
    end
end

# tree = BinaryTree.new

# tree.head = TreeNode.new(13)
# tree.head.left = TreeNode.new(12)
# tree.head.left.left = TreeNode.new(4)
# tree.head.left.right = TreeNode.new(19)
# tree.head.right = TreeNode.new(10)
# tree.head.right.left = TreeNode.new(16)
# tree.head.right.right = TreeNode.new(9)
# tree.in_order
# tree.delete(12)
# tree.in_order