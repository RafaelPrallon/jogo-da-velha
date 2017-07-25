require_relative "lib/game"
# until the continue variable becomes "N", the game will start over, giving the
# user the option to play the game again at the match's end
game_modes = ["pvp","traditional","auto"]
yes_or_no = ["yes", "no"]
# game initialization cycle
menu = Menu.new
game = Game.new
continue = "yes"
# until the player gives a 'no' at the continue text post match, the game cycle will repeat
# the game cycle consists of an new Game
until continue == "no"
  @player1, @player2 = game.set_up(menu, game_modes, yes_or_no)
  game.start_game(@player1, @player2)
  # ask the player if the player wants to play again
  continue = menu.select_option("Do you want to play it again?\n", yes_or_no)
end
