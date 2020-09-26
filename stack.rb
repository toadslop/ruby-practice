class Stack
    attr_reader :data, :length

    def initialize
        @data = []
        @length = 0
    end

    def append(datum)
        @data << datum
        @length += 1
    end

    def remove
        @length -= 1
        @data.delete_at(-1)
    end

    def empty?
        @data.size == 0
    end
end
