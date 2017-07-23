require "game"
RSpec.describe Game do

  describe "tie" do
    it "returns true if the board is full" do
      board = ["X", "X", "O", "O", "X", "O", "X", "O", "X"]
      expect (tie(board)).to      be_true
    end
    it "returns false otherwise" do
      board = ["X", "X", "O", "O", "X", "O", "X", "O", "X"]
      expect (tie(board)).to      be_true
    end
  end
end
