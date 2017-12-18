class TowersOfHanoi
  attr_reader :towers
  def initialize
    @towers = Array.new(3){[]}
  end

  def populate
    @towers[0] = [3,2,1]
  end

  def valid_move?(start_idx, end_idx)
    return false if towers[start_idx].empty?
    towers[end_idx].empty? || towers[start_idx].last < towers[end_idx].last
  end

  def make_move(start_idx, end_idx)
    if valid_move?(start_idx, end_idx)
      towers[end_idx]<< towers[start_idx].pop
    end
  end

  def game_over?(towers)
    towers[0].empty? && (towers[1].empty? || towers[2].empty?)
  end
end
