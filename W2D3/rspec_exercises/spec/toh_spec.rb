require 'toh'
require 'rspec'

describe TowersOfHanoi do
  subject(:toh) {TowersOfHanoi.new}
  describe "#initialize" do
    it "should initialize an array of 3 arrays" do
      expect(toh.towers).to be_a(Array)
      expect(toh.towers.length).to eq(3)
      expect(toh.towers).to eq([[],[],[]])
    end
  end

  describe "#populate" do
    it "should fill the first array in towers with 3 discs with the smaller discs on top" do
      toh.populate
      expect(toh.towers[0]).to eq([3,2,1])
    end
  end

  describe "#::game_over?" do
    let(:arr) {[[],[3,2,1], []]}
    it "should return true when towers 0 is empty and tower 1 or 2 is also empty" do
      expect(toh.game_over?(arr)).to be_truthy
    end
  end

  describe "#valid_move?" do
    context "when making a move to check if valid" do
      before(:each) do
        toh.populate
        toh.make_move(0,1) # towers should be [3,2] [1] []
      end

      it "takes a start and end index and check that the element being moved
      is smaller than the element at the destination" do
        expect(toh.valid_move?(1,0)).to be_truthy
      end

      it "returns true if destination is empty" do
        expect(toh.valid_move?(1,2)).to be_truthy
      end
    end
  end
end
