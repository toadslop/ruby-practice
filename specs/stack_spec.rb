require './stack'

RSpec.describe Stack do
  context "when initializing" do
    stack = Stack.new
    it "has no data" do
      expect(stack.data).to eq([])
    end

    it "has length of 0" do
      expect(stack.length).to eq(0)
    end
  end
end