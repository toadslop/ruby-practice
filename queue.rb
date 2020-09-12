class Queue
    attr_reader :data, :length
    def initialize(data = [])
      @data = data
      @length = 0
    end

    def append(new_datum)
        @data << new_datum
        @length += 1
    end

    def remove
        front = @data[0]
        @data = @data.drop(1)
        @length -= 1
        front
    end
end
