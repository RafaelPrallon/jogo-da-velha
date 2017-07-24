require "game"
RSpec.describe Game do
  let :game {Game.new}

  describe "set_board" do
    it "should return the default board if no argument is given" do
      expect(game.set_board).to   match_array(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    end
  end

  describe "#set_turn" do
    it "should return 2 if last_turn = 1" do
      expect(game.set_turn(1)).to eq(2)
    end
    it "should return 1 otherwise" do
      expect(game.set_turn(2)).to eq(1)
    end
  end

  describe "#tie" do
    it "returns true if the board is full" do
      board = ["X", "X", "O", "O", "X", "O", "X", "O", "X"]
      expect(Game.tie(board)).to      be true
    end
    it "returns false otherwise" do
      board = ["X", "X", "O", "O", "X", "O", "X", "O", "X"]
      expect(Game.tie(board)).to      be true
    end
  end

  describe "#game_is_over" do
    it "returns true if a whole line in the board of marked with the same symbol" do
      board = ["X","X","X","3","4","5","6","7","8"]
      expect(Game.game_is_over(board)).to   be true
    end
    it "return false otherwise" do
      board = ["X","X","O","O","O","X","X","O","O"]
      expect(Game.game_is_over(board)).to   be false
    end
  end

  describe "start_game" do
    it "starts the game given the right number of players" do
      player1 = Computer.new("O","Hard")
      player2 = Computer.new("X","Hard")
      #allow(:game).to   receive(:start_game).and_return(3)
      game.start_game(player1,player2)
    end
    it "raises ArgumentError if there's only 1 player" do
      player1 = Computer.new("O","Hard")
      expect{game.start_game(player1)}.to   raise_error(ArgumentError)
    end
  end

  describe "display_results" do
    it "should print that the player 1 won if last_turn = 1" do
      expect { game.display_results(1) }.to output("Player 1 wins\n").to_stdout
    end
    it "should print that the player 2 won if last_turn = 2" do
      expect { game.display_results(2) }.to output("Player 2 wins\n").to_stdout
    end
    it "should print that it's a draw if last_turn = 3" do
      expect { game.display_results(3) }.to output("It's a draw\n").to_stdout
    end
  end
end
