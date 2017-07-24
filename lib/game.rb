class Game
  require_relative 'player'
  require_relative 'computer'
  require_relative 'menu'

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @difficulty = nil
    @result = "defeat"
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

  def start_game(player1, player2)
    # at the beggining of each turn, it will print the board
    print_board(@board)
    # loop through until the game was won or tied
    until Game.game_is_over(@board) || Game.tie(@board)
      # given the game mode, it will alternate between player's and pc's turn
      puts "Player 1, choose a place in the board pressing a number between 0 and 8.:"
      player1.get_play(@board)
      print_board(@board)
      # if the game does not end at the first player's turn,
      # it becomes the second payer's turn.
      if !(Game.game_is_over(@board)) && !(Game.tie(@board))
        puts "Player 2, choose a place in the board pressing a number between 0 and 8.:"
        player2.get_play(@board)
        print_board(@board)
      # at the game's end, it will determine  the game's result before displaying it
      elsif Game.game_is_over(@board)
        result = "victory"
      elsif Game.tie(@board)
        result = "tie"
        # last_turn = 3
      end
=begin
      if set_turn(last_turn) == 1
        puts "Player 1, choose a place in the board pressing a number between 0 and 8.:"
        player1.get_play(@board)
        last_turn = 1
      else
        puts "Player 2, choose a place in the board pressing a number between 0 and 8.:"
        player2.get_play(@board)
        last_turn = 2
      end
      Board.print_board
=end
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
=begin
    if last_turn == 1
      puts "Player 1 wins\n"
    elsif last_turn == 2
      puts "Player 2 wins\n"
    else
      puts "It's a draw\n"
=end
  end
end
