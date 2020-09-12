class Queue
    attr_reader :data
    def initialize(data = [])
      @data = data
    end

    def append(new_datum)
        @data << new_datum
    end

    def remove
        front = @data[0]
        @data = @data.drop(1)
        front
    end
end
