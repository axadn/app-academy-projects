class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  def add_cards(cards)
    @cards.concat(cards)
  end

  def assign_hand_value
    same_suit = @cards.all?{|card| card.suit == @cards.first.suit}
    return 1 if same_suit && in_order?

    counts = Hash.new(0)
    @cards.each {|card| counts[card.value] += 1}
    return 2 if counts.values.include?(4)

    return 3 if counts.values.sort == [2,3]

    return 4 if same_suit

    return 5 if in_order?

    return 6 if counts.values.include?(3)

    return 7 if counts.values.count(2) == 2

    return 8 if counts.values.include?(2)

    9
  end

  def in_order?
    values = @cards.map{|card| card.value}
    ordered = ((values.max - values.min) == 4)
    ordered && (values.uniq == values)
  end
end
