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

    def insert(data, side = 1)
        case side
        when 0
            temp = @head
            @head = Node.new(data)
            @head.next_node = temp
        when 1
            if @tail.nil?
                @head = Node.new(data)
                @tail = @head
            else
                new_node = Node.new(data)
                @tail.next_node = new_node
                @tail = new_node
            end
        else
            puts 'Error! Side must be 0 or 1.'
        end
    end

    def values
        values = "#{@head.data}"
        temp = @head
        while temp.next_node 
            print_value += " #{temp.next_node.data}"
            temp = temp.next_node
        end
        values
    end

    def to_a
        array = [@head.data]
        temp = @head
        while temp.next_node
            array << temp.next_node
            temp = temp.next_node
        end
        array
    end
end