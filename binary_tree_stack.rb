require_relative 'queue'
require_relative 'stack'

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

    # print functions
    def in_order(temp = @head)
      df_trav_inorder { |temp| print "#{temp} " }
    end

    def pre_order(temp = @head)
      df_trav_preorder { |temp| print "#{temp} "}
    end

    def post_order(temp = @head)
      df_trav_postorder { |temp| print "#{temp} "}
    end

    # Traversals with recursion
    def df_trav_inorder(start = @head, &block)
      stack = Stack.new
      current_node = start
      stack.append(current_node)

      until current_node.nil? && stack.empty?
        current_node = current_node.left unless current_node.nil?
        stack.append(current_node) unless current_node.nil?
        if current_node.nil? && !stack.empty?
          removed = stack.remove
          yield(removed.data)
          current_node = removed.right
          stack.append(current_node) unless current_node.nil?
        end
      end
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

    # adding and deleting nodes
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

    def delete(data)
      deep_right = @head
      delete_node = self.find(data)

      while deep_right.right
        deep_right = deep_right.right
      end

      delete_node.data = deep_right.data
      deep_right.data = nil
    end

    # querying
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
# tree.post_order