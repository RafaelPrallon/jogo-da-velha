class Game
  require_relative 'player'
  require_relative 'computer'
  require_relative 'menu'

  def initialize
    @board = set_board
    result = "defeat"
  end

  def set_board
    board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    return board
  end

  def set_turn(last_turn)
    if last_turn == 1
      return 2
    else return 1
    end
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

  def self.tie(board)
    # if all spots on the board is occupied, it calls a draw
    board.all? { |s| s == "X" || s == "O" }
  end

  def print_board(board)
    puts "\n #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n\n\n"
  end

  def set_up(menu, game_modes, yes_or_no)
    confirmation = "no"
    until confirmation =="yes"
      mode = menu.select_option("Select game mode:\n", game_modes)
      # based on the result of select_game_mode, @player1 and @player2 will be either
      # of the player class or the computer class
      # Player vs Player mode
      if mode == game_modes[0]
        player1 = Player.new("O")
        player2 = Player.new("X")
        puts "PvP mode selected. Player 1: #{player1.marker}
                   Player 2: #{player2.marker}\n\n"
      # Against computer mode
      elsif mode == game_modes[1]
        difficulty = menu.select_difficulty
        player1 = Player.new("O")
        player2 = Computer.new("X", difficulty)
        puts "traditional mode selected. Player 1: #{player1.marker}
                           Computer: #{player2.marker}\n\n"
        puts "Computer's difficulty is set at #{difficulty}\n"
      # Computer vs Computer mode
      else
        difficulty = menu.select_difficulty
        player1 = Computer.new("O", difficulty)
        player2 = Computer.new("X", difficulty)
        puts "auto mode selected. Computer 1: #{player1.marker}
                    Computer 2: #{player2.marker}\n\n"
        puts "Computer's difficulty is set at #{difficulty}\n"
      end
      # asks the player to confirm if the way displayed at the menu is the way
      # he wants to play
      confirmation = menu.select_option("Is that how you want the game?\n",yes_or_no)
    end
    return player1, player2
  end

  def start_game(player1, player2)
    last_turn = 2
    # at the beggining of each turn, it will print the board
    print_board(@board)
    # loop through until the game was won or tied
    until Game.game_is_over(@board) || Game.tie(@board)
      if set_turn(last_turn) == 1
        puts "Player 1, choose a place in the board pressing a number between 0 and 8.:"
        player1.get_play(@board)
        last_turn = 1
      else
        puts "Player 2, choose a place in the board pressing a number between 0 and 8.:"
        player2.get_play(@board)
        last_turn = 2
      end
      print_board(@board)
    end
    if Game.tie(@board)
      last_turn = 3
    end
    display_results(last_turn)
  end

  def display_results(last_turn)
    # it will say who won the match based on who played last before the game ended
    # or it will say the game ended in a draw
    if last_turn == 1
      puts "Player 1 wins\n"
    elsif last_turn == 2
      puts "Player 2 wins\n"
    else
      puts "It's a draw\n"
    end
  end
end
