require "player"
RSpec.describe Player do
  let :player {Player.new("X")}
  describe "#get_input" do
    it "gets input" do
      allow(STDIN).to   receive(:gets).and_return "9\n"
      expect(STDIN).to  receive(:gets)
      expect(player.get_input).to   eq("9")
    end
  end
  describe "#validate_input" do
    it "should raise InvalidOptionError if not integer" do
      allow(player).to  receive(:get_input).and_return "c"
      expect{player.validate_input}.to raise_error(InvalidOptionError)
    end
    it "should raise InvalidOptionError if bigger than 8" do
      allow(player).to  receive(:get_input).and_return "9"
      expect{player.validate_input}.to raise_error(InvalidOptionError)
    end
    it "should raise InvalidOptionError if smaller than 0" do
      allow(player).to  receive(:get_input).and_return "-1"
      expect{player.validate_input}.to raise_error(InvalidOptionError)
    end
    it "should return the input" do
      allow(player).to  receive(:get_input).and_return "1"
      expect(player.validate_input).to eq("1")
    end
  end
  describe "#draw_into_board" do
    it "should draw into the board" do
      board = ["0","1","2","3","4","5","6","7","8"]
      player.draw_into_board(board, 5)
      expect(board).to  match_array(["0","1","2","3","4","X","6","7","8"])
    end
    it "should raise InvalidOptionError if the spot is taken" do
      board = ["0","1","2","3","4","X","6","7","8"]
      expect{player.draw_into_board(board, 5)}.to raise_error(InvalidOptionError)
    end
  end
  describe "#get_play" do
    it "should get the complete player play" do
      board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      allow(player).to  receive(:get_input).and_return("2")
      player.get_play(board)
      expect(board).to  match_array(["0","1","X","3","4","5","6","7","8"])
    end
  end
end
