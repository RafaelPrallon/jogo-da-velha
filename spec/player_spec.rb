require "player"
RSpec.describe Player do
  describe "get_spot" do
    it "returns an error if an invalid spot is chosen" do
      board = ["0","1","2","3","4","5","6","7","8"]
      subject = Player.new("O")
      subject.get_spot(board).stub(gets: "9")
      subject.get_spot(board).stub(gets: "8")

    end
  end
end
