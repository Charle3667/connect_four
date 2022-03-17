require_relative "connect.rb"

game = GameBoard.new
game.play_a_game



# for move in (0..6)
#   p 'make move'
#   move = gets.chomp.to_i
#   if game.slot_available?(move)
#     if move % 2 == 0
#       game.make_move(move, 2)
#     else
#       game.make_move(move, 1)
#     end
#     game.show_board
#   else
#     p 'no slots available'
#   end
# end 
