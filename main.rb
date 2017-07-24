require_relative "lib/game"
# until the continue variable becomes "N", the game will start over, giving the
# user the option to play the game again at the match's end
game_modes = ["pvp","traditional","auto"]
yes_or_no = ["yes", "no"]
# game initialization cycle
menu = Menu.new
continue = "yes"
until continue == "no"
  game = Game.new
  confirmation = "no"
  until confirmation =="yes"
    mode = menu.select_option("Select game mode:\n", game_modes)
    # based on the result of select_game_mode, @player1 and @player2 will be either
    # of the player class or the computer class
    # Player vs Player mode
    if mode == game_modes[0]
      @player1 = Player.new("O")
      @player2 = Player.new("X")
      puts "PvP mode selected. Player 1: #{@player1.marker}
                      Player 2: #{@player2.marker}\n\n"
    # Against computer mode
    elsif mode == game_modes[1]
      difficulty = menu.select_difficulty
      @player1 = Player.new("O")
      @player2 = Computer.new("X", difficulty)
      puts "traditional mode selected. Player 1: #{@player1.marker}
                       Computer: #{@player2.marker}\n\n"
    # Computer vs Computer mode
    else
      difficulty = menu.select_difficulty
      @player1 = Computer.new("O", difficulty)
      @player2 = Computer.new("X", difficulty)
      puts "auto mode selected. Computer 1: #{@player1.marker}
                                Computer 2: #{@player2.marker}\n\n"
    end
    # asks the player to confirm if the way displayed at the menu is the way
    # he wants to play
    confirmation = menu.select_option("Is that how you want the game?\n",yes_or_no)
  end
  game.start_game(@player1, @player2)
  # ask the player if the player wants to play again
  continue = menu.select_option("Do you want to play it again?\n", yes_or_no)
end
