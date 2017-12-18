require 'byebug'

class Piece
  attr_accessor :color, :pos
  def initialize(color, pos)
    @color = color
    @pos = pos
  end



end

class NullPiece < Piece
  def to_s
    ' '
  end
end

class SlidePiece < Piece
  RELATIVE_CORDS = []
  def possible_moves
    new_moves = []
    self.class::RELATIVE_CORDS.each do |cord|
      debugger
      x,y = @pos.dup
      while (1...7).cover?(y) && (1...7).cover?(x)
        x += RELATIVE_CORDS[0]
        y += RELATIVE_CORDS[1]
        new_moves << [x,y]
      end
    end
    new_moves
  end

end

class StepPiece < Piece
  RELATIVE_CORDS = []
  def possible_moves
    x,y = @pos
    new_moves = []
    self.class::RELATIVE_CORDS.each do |cord|
      if (0..7).cover?(y+ cord[1]) && (0..7).cover?(x + cord[0])
        new_moves << [x+cord[0], y+cord[1]]
      end
    end
    new_moves
  end
end

class King < StepPiece
  RELATIVE_CORDS = [
    [-1,0],
    [-1,1],
    [0,1],
    [1,1],
    [1,0],
    [1,-1],
    [0,-1],
    [-1,-1]]
  def to_s
    @color == :white ? '♔' : '♚'
  end
end

class Queen < Piece
  def to_s
    @color == :white ? '♕' : '♛'
  end
end


class Bishop < Piece
  def to_s
    @color == :white ? '♗' : '♝'
  end
end

class Knight < StepPiece
  RELATIVE_CORDS = [
    [-1,-2],
    [1,-2],
    [2,-1],
    [2,1],
    [1,2],
    [-1,2],
    [-2,1],
    [-2,-1]
  ]
  def to_s
    @color == :white ? '♘' : '♞'
  end
end

class Rook < Piece
  RELATIVE_CORDS = [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1]
  ]
  def to_s
    @color == :white ? '♖' : '♜'
  end
end

class Pawn < Piece
  def to_s
    @color == :white ? '♙' : '♟'
  end
end
