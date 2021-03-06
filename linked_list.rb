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
        values = ""
        self.each do |node|
            values += "#{node.data}"
            values += " " unless node.next_node.nil?
        end
        values
    end

    def to_a
        array = []
        self.each do |node|
            array << node.data
        end
        array
    end

    def find(data)
        current_node = @head
        self.each do |node|
            if node.data == data
                return node
            end
        end
        false
    end

    def delete(data)
        prev_node = nil
        self.each do |current_node|
            if current_node.data == data
                unless prev_node.nil?
                    prev_node.next_node = current_node.next_node
                else
                    @head = current_node.next_node
                end
                return true
            end
            prev_node = current_node
        end
        false
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

p ll.find(4)
p ll.to_a
p ll.values
ll.delete(1)
p ll.values