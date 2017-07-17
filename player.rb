class Player
  def initialize (*args)
    marker = args[0]
  end
  def get_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if @board[spot] != "X" && @board[spot] != "O"
        @board[spot] = marker
      else if @board[spot] == "X" || @board[spot] == "O"
        puts "This spot is already occupied, please choose an spot that isn't occupied already"
      else
        spot = nil
        puts "Invalid play, to choose a place in the board press a number between 0 and 8."
      end
    end
  end
end
end
