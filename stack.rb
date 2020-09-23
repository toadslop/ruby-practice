class Stack
    attr_reader :data

    def initialize
        @data = []
    end

    def append(datum)
        @data << datum
    end

    def remove
        @data.delete_at(-1)
    end
end
