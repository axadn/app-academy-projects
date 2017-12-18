require_relative "player.rb"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
  @player1 = Player.new(name1, 1)
  @player2 = Player.new(name2, 2)
  @current_player = @player1
  place_stones
  end

  def place_stones
    @cups = Array.new(14) {[]}
      0.upto(5) do |idx|
        4.times{cups[idx] << :stone}
      end
      7.upto(12) do |idx|
        4.times{cups[idx] << :stone}
      end
  end

  def valid_move?(start_pos)
    unless (1..6).cover?(start_pos) || (7..12).cover?(start_pos)
      raise ArgumentError.new "Invalid starting cup"
    end
  end
  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  def make_move(start_pos, current_player_name)
    switch_players unless @current_player.name == current_player_name
    if @current_player.side == 1
      my_cup = 6
      other_cup = 13
    else
      my_cup = 13
      other_cup = 6
    end
    idx = start_pos
    hand = cups[idx]
    cups[idx] = []
    until hand.empty?
      idx +=1
      idx = 0 if idx == 14
      cups[idx] << hand.pop unless idx == other_cup
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if @current_player.side == :top
      my_cup = 6
      other_cup = 13
    else
      my_cup = 13
      other_cup = 6
    end
    if ending_cup_idx == my_cup
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    player1_cup = @cups[6]
    player2_cup = @cups[13]
    if player1_cup.length == player2_cup.length
      :draw
    elsif player1_cup.length > player2_cup.length
      @player1.name
    else
      @player2.name
    end
  end
end
