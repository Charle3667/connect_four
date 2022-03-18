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
    puts 'Welcome to connect four!'
    show_board
    turn_counter = 0
    for turn in (0..35)
      turn_counter += 1
      if win_check
        puts "Thanks for playing!"
        break
      end
      turn_counter % 2 == 0 ? player_two_move : player_one_move
    end 
  end

  def check_x_axis
    win = false
    winner = nil
    for array in @board
      last_slot = nil
      in_a_row = 0
      for slot in array
        if slot == 'x' || slot == 'o'
          if slot == last_slot
            in_a_row += 1
          else
            last_slot = slot
            in_a_row = 1
          end
        else
          last_slot = slot
          in_a_row = 0
        end
        if in_a_row == 4 
          win = true
          winner = last_slot
          break
        end
      end
    end
    if win == true 
      winner == 'x' ? (puts 'Player one wins!') : (puts 'Player two wins!')
      return true
    else
      return false
    end
  end

  def check_y_axis
    win = false
    winner = nil
    for column in (0..5)
      last_slot = nil
      in_a_row = 0
      for array in (0..5)
        if @board[array][column] == 'x' || @board[array][column] == 'o'
          if @board[array][column] == last_slot
            in_a_row += 1
          else
            last_slot = @board[array][column]
            in_a_row = 1
          end
        else
          last_slot = @board[array][column]
          in_a_row = 0
        end
        if in_a_row == 4 
          win = true
          winner = last_slot
          break
        end
      end
    end
    if win == true 
      winner == 'x' ? (puts 'Player one wins!') : (puts 'Player two wins!')
      return true
    else
      return false
    end
  end

  def check_diag(array, column, player)
    @board[array][column] == player ? true  : false
  end

  def check_all_diags
    range = (3..5).to_a
    range_two = (0..5).to_a
    win = false
    for array in range.reverse
      for column in range_two
        if @board[array][column] == 'x' || @board[array][column] == 'o'
          checks = 1
          y = array
          x = column
          while checks < 5
            if checks == 4
              if @board[array][column] == 'x'
                puts 'Player one wins!'
              else
                puts 'Player two wins!'
              end
              win = true
              break
            end
            checks += 1
            y -= 1
            x += 1
            unless check_diag(y, x, @board[array][column])
              break
            end
          end
          checks = 1
          y = array
          x = column
          while checks < 5
            if checks == 4
              if @board[array][column] == 'x'
                puts 'Player one wins!'
              else
                puts 'Player two wins!'
              end
              win = true
              break
            end
            checks += 1
            y -= 1
            x -= 1
            unless check_diag(y, x, @board[array][column])
              break
            end
          end
          if win == true
            break
          end
        end
        if win == true
          break
        end
        if win == true
          break
        end
      end
    end
    win == true ? true : false
  end


  def win_check
    if check_x_axis || check_y_axis || check_all_diags
      return true
    else
      return false
    end
  end
end
