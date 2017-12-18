require "rspec"
require "my_transpose"

describe Array do
  describe "#my_transpose" do
    subject(:arr){[
      [0,3,6],
      [1,4,7],
      [2,5,8]
      ]}
    it "transposes the array between col and row representations" do
      expect(arr.my_transpose).to eq(arr.transpose)
    end
  end
end
