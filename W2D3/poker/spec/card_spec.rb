require 'rspec'
require 'card'

describe "Card" do
  subject(:card) {Card.new(7, :spade)}
  describe "#intialize" do
    it "inits with a value" do
      expect(card.value).to eq(7)
    end

    it "inits with a suit" do
      expect(card.suit).to eq(:spade)
    end
  end
  describe "#==" do
    it "compares the cards value and suit to check for equality" do
      expect(Card.new(3, :spade)).to eq(Card.new(3, :spade))
    end
  end

  describe "#to_s" do
    it "converts value and suits to string for player to see" do
      expect(card.to_s).to eq("7 of Spades")
    end

    it "converts vals higher than 10 to proper name" do
      expect(Card.new(13, :diamond).to_s).to eq("K of Diamonds")
    end
  end
end
