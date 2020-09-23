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
        @length -= 1
        @data.delete_at(0)
    end
end
