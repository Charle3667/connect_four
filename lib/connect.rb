class GameBoard
  attr_accessor :board

  def initialize
    @base = "\u2610"
    @board = Array.new(6) { Array.new(6, @base) }
  end

  def show_board
    for array in @board
      purty_array = make_purty(array)
      print (purty_array + "\n")
    end
  end

  def make_purty(array)
    return array.to_s.gsub('"', '').gsub(',', '').gsub('[', '').gsub(']', '')
  end

  def make_move(int, player)
    safe_int = int - 1
    range = (0..5).to_a
    for slot in range.reverse
      if @board[slot][safe_int] == @base
        player == 1 ? @board[slot][safe_int] = 'x' : @board[slot][safe_int] = 'o'
        break
      end
    end
  end

  def slot_available?(int)
    safe_int = int - 1
    range = (0..5).to_a
    for slot in range.reverse
      return true if @board[slot][safe_int] == @base 
    end
    return false
  end

  def player_one_move
    available = false
    until available do
      print "Make your move player one! :"
      move = gets.chomp.to_i
      if slot_available?(move) && move.class == Integer && move != 0 && move < 7
        available = true
        make_move(move, 1)
        show_board
      else
        p 'Move must be a number between 1 and 6 and must be made in an available column'
      end
    end
  end

  def player_two_move
    available = false
    until available do
      print "Make your move player two! :"
      move = gets.chomp.to_i
      if slot_available?(move) && move.class == Integer && move != 0 && move < 7
        available = true
        make_move(move, 2)
        show_board
      else
        p 'Move must be a number between 1 and 6 and must be made in an available column'
      end
    end
  end

  def play_a_game
    end_game = false
    for turn in (0..1)
      if end_game == true
        print "Thanks for playing!"
        break
      end
      player_one_move
      player_two_move
    end 
  end
end
