class Game
  require_relative 'player'
  require_relative 'computer'

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @difficulty = nil
    @result = "defeat"
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
  end

  def self.game_is_over(b)
    # checks if a line at the board is drawn with only one symbol
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def self.tie(b)
    # if all spots on the board is occupied, it calls a draw
    b.all? { |s| s == "X" || s == "O" }
  end

  def select_game_mode
    # player enter a number between 1 and 3 to choose game mode
    mode = nil
    until (mode == 1 || mode == 2 || mode == 3)
      puts "Select game mode:
            1. Human x Human
            2. Human x PC
            3. PC X PC"
      mode = gets.chomp.to_i
      if (mode != 1 && mode != 2 && mode != 3)
        puts "Invalid option"
      end
    end
    select_game_mode = mode
  end

  def select_difficulty
    difficulty = nil
    until (difficulty == "E" || difficulty == "H")
      puts "Please select difficulty:
                            E: Easy mode
                            H: Hard mode"
      difficulty = gets.chomp.to_s.capitalize
      if (difficulty != "E" && difficulty !="H")
        puts "Invalid option"
      end
    end
    if difficulty == "E"
      puts "Easy mode selected"
    else
      puts "Hard mode selected"
    end
    select_difficulty = difficulty
  end

  def print_board(board)
    puts "\n #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n\n\n"
  end

  def start_game(mode, difficulty, player1, player2)
     # at the beggining of each turn, it will print the board
    print_board(@board)
    # loop through until the game was won or tied
    until Game.game_is_over(@board) || Game.tie(@board)
      # given the game mode, it will alternate between player's and pc's turn
      if mode == 3
        puts "Computer 1's turn"
        player1.eval_board(@board, difficulty)
      else
        puts "Player 1, choose a place in the board pressing a number between 0 and 8.:"
        player1.get_spot(@board)
      end
      print_board(@board)
      # if the game does not end at the first player's turn,
      # it becomes the second player's turn.
      if !Game.game_is_over(@board) && !Game.tie(@board)
        if mode == 1
          puts "Player 2, choose a place in the board pressing a number between 0 and 8.:"
          player2.get_spot(@board)
        elsif mode == 2
          puts "Computer 1's turn"
          player2.eval_board(@board, difficulty)
        else
          puts "Computer 2's turn"
          player2.eval_board(@board, difficulty)
        end
        print_board(@board)
      # at the game's end, it will determine  the game's result before displaying it
      elsif Game.game_is_over(@board)
        result = "victory"
      elsif Game.tie(@board)
        result = "tie"
      end
    end
    display_results(result)
  end

  def display_results(result)
    if result == "victory"
      puts "Player 1 wins\n"
    elsif result == "tie"
      puts "It's a draw\n"
    else
      puts "Player 2 wins\n"
    end
  end
end

# until the continue variable becomes "N", the game will start over, giving the
# user the option to play the game again at the match's end
continue = "Y"
until continue == "N"
  game = Game.new
  confirmation = "N"
  until confirmation =="Y"
    mode = game.select_game_mode
    # based on the result of select_game_mode, @player1 and @player2 will be either
    # of the player class or the computer class
    if mode == 1
      @player1 = Player.new("O")
      @player2 = Player.new("X")
      puts "Human x Human mode selected. Player 1: #{@player1.marker}
                                 Player 2: #{@player2.marker}\n\n"
    elsif mode == 2
      difficulty = game.select_difficulty
      @player1 = Player.new("O")
      @player2 = Computer.new("X")
      puts "Human x Computer mode selected. Player 1: #{@player1.marker}
                                       Computer: #{@player2.marker}\n\n"
    else
      difficulty = game.select_difficulty
      @player1 = Computer.new("O")
      @player2 = Computer.new("X")
      puts "Computer x Computer mode selected. Computer 1: #{@player1.marker}
                                       Computer 2: #{@player2.marker}\n\n"
    end
    puts "Is that how you want the game?(Y/N)\n "
    confirmation = gets.chomp.capitalize
    until (confirmation == "Y" || confirmation == "N")
      puts "Invalid option, please choose a valid option.(Y/N)"
      confirmation = gets.chomp.capitalize
    end
  end
  game.start_game(mode, difficulty, @player1, @player2)
  puts "Do you want to play it again?(Y/N)"
  continue = gets.chomp.capitalize
  until (continue == "Y" || continue == "N")
    puts "Invalid option, please choose a valid option.(Y/N)"
    continue = gets.chomp.capitalize
  end
end
