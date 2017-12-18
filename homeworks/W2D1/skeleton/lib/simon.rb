require 'io/console'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(2)
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |col|
      print "#{col} "
    end
    puts
  end

  def require_sequence
    system "clear"
    $stdin.iflush
    puts "repeat the sequence"
    input = gets.chomp
    @game_over = true if input.split(" ") != seq
  end

  def add_random_color
    seq << COLORS[rand(COLORS.length)]
  end

  def round_success_message
    "Good"
  end

  def game_over_message
    "Game over"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
