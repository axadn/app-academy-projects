require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'

class Display
  attr_accessor :cursor
  def initialize(board)
    @grid = board.grid
    @cursor = Cursor.new([0,0], board)
  end

  def cursor_pos
    @cursor.cursor_pos
  end

  def render
    puts("-" + "----" * @grid.length)
    @grid.each_with_index do |row, idx|
      print("|")
      row.each_with_index do |piece, jdx|
        cell_content = " #{piece.to_s} "
        if @cursor.cursor_pos == [idx,jdx]
          print cell_content.colorize(:background => @cursor.get_color) + "|"
        else
          print cell_content + "|"
        end
      end
      puts
      print("-" + "----" * @grid.length)
      puts
    end
    nil
  end

end
