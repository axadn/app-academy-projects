require "rspec"
require "deck"

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it " initializes the deck with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "initializes with all unique cards" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  describe "#shuffle!" do
    it "shuffles cards array" do
      unshuffled = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq(unshuffled)
    end
  end

  describe "#draw" do
    it "draws one card from the deck" do
      expect(deck.draw).to be_a(Card)
    end

    it "raises an error if the deck is empty" do
      52.times {deck.draw}
      expect {deck.draw}.to raise_error("Deck is empty!")
    end


  end

end
