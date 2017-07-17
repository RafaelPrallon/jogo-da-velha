class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
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

  def start_game
    # start by printing the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    # loop through until the game was won or tied
    until game_is_over(@board) || tie(@board)

      if mode == 3
        puts "Computer 1's turn"
        @comp1.eval_board
      else
        puts "Player 1, choose a place in the board pressing a number between 0 and 8.:"
        @player1.get_spot
      end
       if !game_is_over(@board) && !tie(@board)
         if mode == 1
          puts "Player 2, choose a place in the board pressing a number between 0 and 8.:"
          @player2.get_spot
         elsif mode == 2
            puts "Computer 1's turn"
            @comp1.eval_board
          else
            puts "Computer 2's turn"
            @comp2.eval_board
         end
       end
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    end
    puts "Game over"
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
end

require_relative 'player'
require_relative 'computer'

game = Game.new
mode = game.select_game_mode
if mode == 1
  @player1 = Player.new("O")
  @player2 = Player.new("X")
  puts "Human x Human mode selected. Player 1: #{@player1.marker}
                             Player 2: #{@player2.marker}"
elsif mode == 2
  @player1 = Player.new("O")
  @comp1 = Computer.new("X")
  puts "Human x Computer mode selected. Player 1: #{@player1.marker}
                                   Computer: #{@comp1.marker}"
else
  @comp1 = Computer.new("O")
  @comp2 = Computer.new("X")
  puts "Computer x Computer mode selected. Computer 1: #{@comp1.marker}
                                   Computer 2: #{@comp2.marker}"
end

game.start_game
