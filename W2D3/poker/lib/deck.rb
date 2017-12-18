class Deck

  attr_reader :cards

  def initialize
    @cards = []
    fill
  end

  def fill
    (2..14).each do |val|
      Card::SUITS.each_key {|suit| @cards << Card.new(val, suit)}
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw
    raise "Deck is empty!" if @cards.empty?
    @cards.pop
  end

end
