require_relative 'piece.rb'
require 'byebug'
class Board
  attr_reader :grid, :cursor_pos
  def initialize
    @null_piece = NullPiece.new(nil, nil)
    @grid = Array.new(8) { Array.new(8) { @null_piece }}
    @cursor_pos = [3,3]
    set_pieces
  end

  def move_piece(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      self[end_pos] = self[start_pos]
      self[end_pos].pos = end_pos
      self[start_pos] = @null_piece
    else
      raise StandardError "invalid move"
    end
  end

  def valid_move?(start_pos, end_pos)
    piece_exists = self[start_pos] != @null_piece
    empty_dest = self[end_pos] == @null_piece
    not_cannibals = self[start_pos].color != self[end_pos].color
    possible_move = self[start_pos].possible_moves.include?(end_pos)

    !blocked?(start_pos, end_pos) && possible_move && piece_exists && (empty_dest || not_cannibals)
  end

  def blocked? (start_pos, end_pos)
    if self[start_pos].is_a?(StepPiece)
      false
    else
      false
    end
  end

  def set_pieces
    @grid[0].each_with_index do |elem, idx|
      # @grid[1][idx] = Pawn.new(:black,[1,idx])
      # @grid[6][idx] = Pawn.new(:white,[1,idx])

      case idx
      when 0
        @grid[0][idx] = Rook.new(:black, [0,idx])
        @grid[7][idx] = Rook.new(:white, [7,idx])
      when 7
        @grid[0][idx] = Rook.new(:black, [0,idx])
        @grid[7][idx] = Rook.new(:white, [7,idx])
      when 1
        @grid[0][idx] = Knight.new(:black, [0,idx])
        @grid[7][idx] = Knight.new(:white, [7,idx])
      when 6
        @grid[0][idx] = Knight.new(:black, [0,idx])
        @grid[7][idx] = Knight.new(:white, [7,idx])
      when 2
        @grid[0][idx] = Bishop.new(:black, [0,idx])
        @grid[7][idx] = Bishop.new(:white, [7,idx])
      when 5
        @grid[0][idx] = Bishop.new(:black, [0,idx])
        @grid[7][idx] = Bishop.new(:white, [7,idx])
      end
      @grid[0][4] = Queen.new(:black, [0,4])
      @grid[7][3] = Queen.new(:white, [7,3])
      @grid[0][3] = King.new(:black, [0,3])
      @grid[7][4] = King.new(:white, [7,4])
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end
