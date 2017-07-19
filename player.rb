class Player
  attr_accessor :marker
  def initialize (marker)
    @marker = marker
  end
  def get_spot(board)
    spot = nil
    until spot
      spot = gets.chomp
      # if the chosen spot is already occupied, it ask the player to
      # choose another spot
      if spot =~ /[0-8]/
        spot = spot.to_i
        if board[spot] != "X" && board[spot] != "O"
          board[spot] = @marker
        else
          spot = nil
          puts "This spot is already occupied, please choose an spot that isn't occupied already"
        end
      else
        spot = nil
        puts "Invalid play, to choose a place in the board press a number between 0 and 8."
      end
    end
  end
end
