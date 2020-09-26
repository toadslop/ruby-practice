require './stack'

RSpec.describe Stack do
  let(:stack) { Stack.new }
  let(:data1) { 1 }
  let(:data2) { 2 }
  
  context "when initializing" do
    it "has no data" do
      expect(stack.data).to eq([])
    end

    it "has length of 0" do
      expect(stack.length).to eq(0)
    end
  end

  context "when appending" do
    it "places first datum in data at index 0" do
      stack.append(data1)
      expect(stack.data[0]).to eq(data1)
    end

    it "places second datum in data at index 1" do
      stack.append(data1)
      stack.append(data2)
      expect(stack.data[1]).to eq(data2)
    end

    it "should have length of 2 after appending 2 elements" do
      stack.append(data1)
      before_add = stack.length
      stack.append(data2)
      expect(stack.length).to eq(before_add + 1)
    end
  end

  context "when removing" do
    it "should reduce length by 1 when removing" do
      stack.append(data1)
      stack.append(data2)
      before_remove = stack.length
      stack.remove
      expect(stack.length).to eq(before_remove - 1)
    end

    it "should return the data removed" do
      stack.append(data1)
      stack.append(data2)
      data3 = stack.data[-1]
      expect(stack.remove).to eq(data3)
    end

    it "should remove the last element of data" do
      stack.append(data1)
      stack.append(data2)
      data = stack.data[-1]
      length = stack.length
      stack.remove
      expect(stack.data[-1]).not_to be(data)
    end
  end

  context "when checking if empty" do
    it "should return true if there's no data" do
      expect(stack.empty?).to be(true)
    end

    it "should return false if there is data" do
      stack.append(data1)
      expect(stack.empty?).to be(false)
    end
  end
end