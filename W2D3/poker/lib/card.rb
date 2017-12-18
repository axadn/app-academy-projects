class Card
  SUITS = { spade: 4, heart: 3, club: 2, diamond: 1}
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def ==(other_card)
    self.value == other_card.value && self.suit == other_card.suit
  end

  def to_s
    value_string =
    case @value
    when 14
      "A"
    when 13
      "K"
    when 12
      "Q"
    when 11
      "J"
    else
      @value.to_s
    end

    "#{value_string} of #{@suit.to_s.capitalize}s"
  end
end
