class Node
    attr_accessor :data, :next_node

    def initialize(data, next_node = nil)
        @data = data
        @next_node = next_node
    end
end

class LinkedList
    attr_reader :head, :tail

    def initialize(head = nil)
        if head.class == Node
            @head = head
        elsif head.class == NilClass 
            @head = head
        else
            @head = Node.new(head)
        end
        @tail = @head
    end

    def insert(data)
        if @head
            new_node = Node.new(data)
            temp = @head
            while(temp.next_node)
                temp = temp.next_node
            end
            temp.next_node = new_node
        else
            @head = Node.new(data) 
        end
    end

    def print_values
        print_value = "#{@head.data}"
        temp = @head
        while temp.next_node 
            print_value += " #{temp.next_node.data}"
            temp = temp.next_node
        end
        puts print_value
    end
end