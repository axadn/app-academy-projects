load "piece.rb"
load "board.rb"
load 'cursor.rb'
load "game.rb"


game = Game.new(Player.new, Player.new);
game.take_turn
board.move_piece([0,3],[0,6]);
d.render
