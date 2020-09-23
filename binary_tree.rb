require_relative 'queue'

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
      df_trav_inorder { |temp| print "#{temp} " }
    end

    def pre_order(temp = @head)
      df_trav_preorder { |temp| print "#{temp} "}
    end

    def post_order(temp = @head)
      df_trav_postorder { |temp| print "#{temp} "}
    end

    def df_trav_inorder(start = @head, &block)
      return unless start

      df_trav_inorder(start.left, &block)
      yield(start.data)
      df_trav_inorder(start.right, &block)
    end

    def df_trav_preorder(start = @head, &block)
      return unless start

      yield(start.data)
      df_trav_preorder(start.left, &block)
      df_trav_preorder(start.right, &block)
    end

    def df_trav_postorder(start = @head, &block)
      return unless start

      df_trav_postorder(start.left, &block)
      df_trav_postorder(start.right, &block)
      yield(start.data)
    end

    def insert(data)
      queue = Queue.new
      queue.append(@head)

      while queue.length
        temp = queue.remove

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

      return @head if @head.data = data

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

#TODO write an each method and refactor find and insert
tree = BinaryTree.new

tree.head = TreeNode.new(1)
tree.head.left = TreeNode.new(2)
tree.head.left.left = TreeNode.new(4)
tree.head.left.right = TreeNode.new(5)
tree.head.right = TreeNode.new(3)
# tree.head.right.left = TreeNode.new(16)
# tree.head.right.right = TreeNode.new(9)
# tree.in_order
# puts ""
# tree.delete(13)
# tree.in_order
# puts ""
# tree.insert(100)
tree.in_order
tree.post_order