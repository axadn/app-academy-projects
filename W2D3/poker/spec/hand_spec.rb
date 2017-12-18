require 'hand'
require 'rspec'

describe Hand do
  subject(:hand){Hand.new}
  describe "#intialize" do
    it "creates a hand with an empty cards array" do
      expect(hand.cards).to be_empty
    end
  end

   describe "#<=>" do
     it "determines winner between hands of different ranks" do
       expect

     end
   end

  describe "assign_hand_value" do

    it "detects straight flush" do
      hand.add_cards([ Card.new(8, :spade), Card.new(9, :spade), Card.new(10, :spade),
            Card.new(11, :spade), Card.new(12, :spade)])
      expect(hand.assign_hand_value).to eq(1)
    end

    it "detects 4 of a kind" do
      hand.add_cards([ Card.new(8, :spade), Card.new(8, :spade), Card.new(10, :spade),
            Card.new(8, :spade), Card.new(8, :spade)])
      expect(hand.assign_hand_value).to eq(2)
    end

    it "detects full house" do
      hand.add_cards([ Card.new(8, :spade), Card.new(8, :spade), Card.new(10, :spade),
            Card.new(10, :spade), Card.new(8, :spade)])
      expect(hand.assign_hand_value).to eq(3)
    end

    it "detects flush" do
      hand.add_cards([ Card.new(2, :spade), Card.new(6, :spade), Card.new(12, :spade),
            Card.new(10, :spade), Card.new(8, :spade)])
      expect(hand.assign_hand_value).to eq(4)
    end

    it "detects straight" do
      hand.add_cards([ Card.new(2, :diamond), Card.new(3, :spade), Card.new(5, :spade),
            Card.new(4, :spade), Card.new(6, :heart)])
      expect(hand.assign_hand_value).to eq(5)
    end

    it "detects 3 of a kind" do
      hand.add_cards([ Card.new(5, :diamond), Card.new(5, :spade), Card.new(5, :spade),
            Card.new(4, :spade), Card.new(6, :heart)])
      expect(hand.assign_hand_value).to eq(6)
    end

    it "detects 2 pairs" do
      hand.add_cards([ Card.new(5, :diamond), Card.new(5, :spade), Card.new(10, :spade),
            Card.new(4, :spade), Card.new(10, :heart)])
      expect(hand.assign_hand_value).to eq(7)
    end

    it "detects a pairs" do
      hand.add_cards([ Card.new(5, :diamond), Card.new(4, :spade), Card.new(10, :spade),
            Card.new(9, :spade), Card.new(10, :heart)])
      expect(hand.assign_hand_value).to eq(8)
    end

    it "detects that a hand is not special" do
      hand.add_cards([ Card.new(5, :diamond), Card.new(4, :spade), Card.new(10, :spade),
            Card.new(9, :spade), Card.new(2, :heart)])
      expect(hand.assign_hand_value).to eq(9)
    end

  end
end
