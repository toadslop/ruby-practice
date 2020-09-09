class Node
    def initialize(data, next_node = nil)
        @data = data
        @next_node = next_node
    end

    def data
        @data
    end

    def next_node
        @next_node
    end

    def next_node=(next_node)
        @next_node = next_node
    end
end

class Linked_list
    def initialize(head = nil)
        if head.class == Node
            @head = head
        elsif head == nil
            @head = head
        else
            @head = Node.new(head)
        end
    end

    def head
        @head
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
        print "#{@head.data} "
        temp = @head
        while temp.next_node 
            print "#{temp.next_node.data} "
            temp = temp.next_node
        end
    end
end