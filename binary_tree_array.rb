class BinaryTree
    def initialize(head)
      @data = [head]
    end

    def set_left(data, index)
        target_index = (index * 2) + 1
        @data[index].nil? ? error(target_index) : @data[target_index] = data
    end

    def set_right(data, index)
        target_index = (index * 2) + 2
        @data[index].nil? ? error(target_index) : @data[target_index] = data
    end

    def error(target_index)
        puts "Can't set child at #{target_index}, no parent found"
    end

    def print_tree
        puts @data.map { |datum| datum.nil? ? "-" : datum }.join
    end
end

bt = BinaryTree.new('A')
bt.set_right('C', 0)
bt.print_tree
bt.set_left('D', 1)
bt.set_right('E', 1)
bt.set_right('F', 2)
bt.print_tree
bt.set_left('B', 0)
bt.set_left('D', 1)
bt.set_right('E', 1)
bt.set_left('F', 2)
bt.set_right('G', 2)
bt.print_tree