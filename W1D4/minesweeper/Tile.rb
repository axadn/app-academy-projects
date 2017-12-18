class Tile
  attr_accessor :bombed, :flagged, :revealed

  def initialize(board,pos)
    @board = board
    @pos=pos
  end

  def reveal
  end

  def neighbours
    x = @pos[0]
    y = @pos[1]
    around = []
    (x - 1).upto(x + 1) do |x|
       (y - 1).upto(y + 1) do |y|
         pos = [x,y]
         around << @board[pos]
       end
    end
    around.delete(self)
    around
  end


   def inspect
     @pos.inspect
   end

  def neighbor_bomb_count
  end

end
