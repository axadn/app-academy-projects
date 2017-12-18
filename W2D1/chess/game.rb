require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'cursor.rb'
require_relative "player.rb"

class Game

  def initialize(player1, player2)
    @board = Board.new
    @display = Display.new(@board)
  end

  def play

  end

  def get_move
    begin
      start_pos, end_pos = get_input
      @board.move_piece(start_pos, end_pos)
    rescue
      puts "Enter a valid move"
      sleep(1.5)
      retry
    ensure
      clear_and_render
    end
  end

  def get_input
    clear_and_render
    start_pos = get_start_pos
    end_pos = get_end_pos
    [start_pos, end_pos]
  end

  def clear_and_render
    system("clear")
    @display.render
  end

  def get_start_pos
    until @display.cursor.selected
      @display.cursor.get_input
      clear_and_render
    end
    clear_and_render
    @display.cursor_pos
  end

  def get_end_pos
    while @display.cursor.selected
      @display.cursor.get_input
      clear_and_render
    end
    clear_and_render
    @display.cursor_pos
  end

  def parse_move(string)

  end

  def change_player

  end
end
