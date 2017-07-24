require "game"
RSpec.describe Computer do
  let :computer {Computer.new("O","Easy")}
  describe "opponent_marker" do
    it "should return X if computer marker is 'O'" do
      expect(computer.create_opponent_marker).to     eq("X")
    end

  end
  describe "get_play" do

    it "A spot should be chosen at random if difficulty == 'Easy'" do
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      allow(computer).to    receive(:get_random_move).and_return(2)
      expect(computer).to   receive(:get_random_move)
      computer.get_play(board)
    end

    it "should call get_average_move if difficulty == 'Normal'"

    it "should call get_best_move if difficulty == 'Hard'"

  end
  describe "get_available_spaces" do
    it "should return an empty array it the board is full" do
      board = ["O", "X", "X", "X", "X", "O", "O", "O", "X"]
      av_mv = computer.get_available_spaces(board)
      expect(av_mv).to      be_empty
    end
    it "should return every available space at the board" do
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      expect(computer.get_available_spaces(board)).to      match_array(["0","1","2","5"])
    end
  end
end
