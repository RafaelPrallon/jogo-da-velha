Rspec.describe Game do

  def before_game
    @board =
  end

  describe "#tie" do
    expect (Game.tie).to be_true
  end
end
