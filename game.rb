class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @difficulty = nil
    @result = "defeat"
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
  end

  def start_game(difficulty)
    # start by printing the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    puts "Choose a place in the board pressing a number between 0 and 8.:"
    # loop through until the game was won or tied
    until game_is_over(@board) || tie(@board)
      get_human_spot
      if !game_is_over(@board) && !tie(@board)
        eval_board(difficulty)
      elsif game_is_over(@board)
        result = "victory"
      elsif tie(@board)
        result = "tie"
      end
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    end
    display_results(result)
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if @board[spot] != "X" && @board[spot] != "O"
        @board[spot] = @hum
      elsif @board[spot] == "X" || @board[spot] == "O"
        puts "This spot is already occupied, please choose an spot that isn't occupied already"
      else
        spot = nil
        puts "Invalid play, to choose a place in the board press a number between 0 and 8."
      end
    end
  end

  def eval_board(difficulty)
    spot = nil
    if difficulty == "E"
      until spot
        spot = get_bad_move(@board, @com)
        if @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = @com
        else
          spot = nil
        end
      end
    else
      until spot
        if @board[4] == "4"
          spot = 4
          @board[spot] = @com
        else
          spot = get_best_move(@board, @com)
          if @board[spot] != "X" && @board[spot] != "O"
            @board[spot] = @com
          else
            spot = nil
          end
        end
      end
    end
  end
  def get_available_spaces(board)
    available_spaces = []
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    return available_spaces
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    best_move = nil
    available_spaces = get_available_spaces(board)
    available_spaces.each do |as|
      board[as.to_i] = @com
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def get_bad_move(board, next_player, depth = 0, best_score = {})
    bad_move = nil
    available_spaces = get_available_spaces(board)
    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end

  def game_is_over(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

  def display_results(result)
    if result == "victory"
      puts "You win\n"
    elsif result == "tie"
      puts "It's a draw\n"
    else
      puts "You lose\n"
    end
  end
end

game = Game.new

until (@difficulty == "E" || @difficulty == "H")
  puts "Please select difficulty:
                        E: Easy mode
                        H: Hard mode"
  @difficulty = gets.chomp.to_s.capitalize
  if (@difficulty != "E" && @difficulty !="H")
    puts "Invalid option"
  end
end
if @difficulty == "E"
  puts "Easy mode selected"
else
  puts "Hard mode selected"
end
game.start_game(@difficulty)
