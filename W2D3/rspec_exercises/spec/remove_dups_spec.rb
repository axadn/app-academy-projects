require "rspec"
require "remove_dups"

describe Array do
  describe "#my_uniq" do
    subject(:test_array) {[0,1,2,3,3,1]}
    it "removes duplicates from an array of integers" do
      expect(test_array.my_uniq).to eq([0,1,2,3])
      expect(test_array).to be_a(Array)
    end
  end
end
