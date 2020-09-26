require './stack'

RSpec.describe Stack do
  context "when initializing" do
    it "has no data" do
      stack = Stack.new
      expect(stack.data).to eq([])
    end
  end
end