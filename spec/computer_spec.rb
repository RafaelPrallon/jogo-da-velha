require "game"
RSpec.describe Computer do
  describe "opponent_marker" do
    it "should return X if computer marker is 'O'" do
      computer = Computer.new("O")
      expect(computer.create_opponent_marker).to     eq("X")
    end

  end
  describe "eval_board" do
    it "A spot should be chosen at random if difficulty = 'E'" do
      computer = Computer.new("X")
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      computer.eval_board(board, "E")
      free_spots = computer.get_available_spaces(board).size
      expect(free_spots).to  eq(3)
    end

    it "spot should receive get_best_move if difficulty = 'H'" do
      computer = Computer.new("X")
      board = ["O", "1", "2", "X", "X", "5", "O", "O", "X"]
      computer.eval_board(board, "H")
      free_spots = computer.get_available_spaces(board)
      expect(free_spots).to      match_array(["1","2"])
    end

    it "chooses the spot that gives the victory to the opponent" do
      computer = Computer.new("X")
      board = ["O", "X", "X", "X", "O", "5", "O", "O", "8"]
      computer.eval_board(board, "H")
      free_spots = computer.get_available_spaces(board)
      expect(free_spots).to      match_array(["5"])
    end

  end
  describe "get_available_spaces" do
    it "should return an empty array it the board is full" do
      computer = Computer.new("X")
      board = ["O", "X", "X", "X", "X", "O", "O", "O", "X"]
      av_mv = computer.get_available_spaces(board)
      expect(av_mv).to      be_empty
    end
    it "should return every available space at the board" do
      computer = Computer.new("X")
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      expect(computer.get_available_spaces(board)).to      match_array(["0","1","2","5"])
    end
  end
end
