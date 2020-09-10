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
        if head.class == Node || head.class == NilClass
            @head = head
        else
            @head = Node.new(head)
        end
        @tail = @head
    end

    def prepend(data)
        temp = @head
        @head = Node.new(data)
        @head.next_node = temp
        @tail = @head if @tail.nil?
    end

    def append(data)
        if @tail.nil?
            @head = Node.new(data)
            @tail = @head
        else
            new_node = Node.new(data)
            @tail.next_node = new_node
            @tail = new_node
        end
    end

    def insert_after(prev_data, new_data)
        current_node = @head
        found = false
        while current_node.next_node
            if current_node.data == prev_data
                new_node = Node.new(new_data)
                new_node.next_node = current_node.next_node
                current_node.next_node = new_node
                found = true
                break
            end
            current_node = current_node.next_node
        end

        if not found
            puts 'Error! Datum not found in list.'
        end
    end

    def values
        values = "#{@head.data}"
        temp = @head
        while temp.next_node 
            values += " #{temp.next_node.data}"
            temp = temp.next_node
        end
        values
    end

    def to_a
        array = [@head.data]
        temp = @head
        while temp.next_node
            array << temp.next_node.data
            temp = temp.next_node
        end
        array
    end

    def find(data)
        current_node = @head
        found = false
        while current_node.next_node
            if current_node.data == data
                found = true
                current_node
                break
            end
        end
        false
    end

    def delete(data)
        current_node = @head
        prev_node = nil
        until current_node.data == data
            current_node = current_node.next_node
        end
    end

    def each
        current_node = @head
        until current_node.nil?
            yield(current_node)
            current_node = current_node.next_node
        end
    end
end

ll = LinkedList.new
ll.append(1)
ll.append(2)
ll.append(3)
puts ll.values
ll.each { |node| puts node.data }