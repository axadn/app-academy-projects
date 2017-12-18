require_relative "Tile.rb"

class Board
  attr_accessor :grid

  def initialize(grid = nil)
    @grid = grid || default_grid
    @grid.each_with_index do |row, idx|
      row.each_with_index do |col, jdx|
        @grid[idx][jdx] = Tile.new(self, [idx, jdx])
      end
    end
  end

  def render

  end
  def []=(pos,val)
    x,y = pos
    @grid[x][y] = val
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def default_grid
    Array.new(5){Array.new(5) {nil}}
  end

end
