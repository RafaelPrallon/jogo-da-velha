require_relative "game"
# until the continue variable becomes "N", the game will start over, giving the
# user the option to play the game again at the match's end
continue = "Y"
until continue == "N"
  game = Game.new
  confirmation = "N"
  until confirmation =="Y"
    mode = Menu.select_game_mode
    # based on the result of select_game_mode, @player1 and @player2 will be either
    # of the player class or the computer class
    if mode == 1
      @player1 = Player.new("O")
      @player2 = Player.new("X")
      puts "Human x Human mode selected. Player 1: #{@player1.marker}
                             Player 2: #{@player2.marker}\n\n"
    elsif mode == 2
      difficulty = Menu.select_difficulty
      @player1 = Player.new("O")
      @player2 = Computer.new("X")
      puts "Human x Computer mode selected. Player 1: #{@player1.marker}
                                Computer: #{@player2.marker}\n\n"
    else
      difficulty = Menu.select_difficulty
      @player1 = Computer.new("O")
      @player2 = Computer.new("X")
      puts "Computer x Computer mode selected. Computer 1: #{@player1.marker}
                                   Computer 2: #{@player2.marker}\n\n"
    end
    # asks the player to confirm if the way displayed at the menu is the way
    # he wants to play
    confirmation = Menu.prompt("Is that how you want the game?(Y/N)\n")
  end
  game.start_game(mode, difficulty, @player1, @player2)
  # ask the player if the player wants to play again
  continue = Menu.prompt("Do you want to play it again?(Y/N)")
end
