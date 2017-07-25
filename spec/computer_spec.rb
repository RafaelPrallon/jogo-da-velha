require "game"
describe Computer do
  let :computer {Computer.new("O","Easy")}

  describe ".opponent_marker" do

    it "should return X if computer marker is 'O'" do
      expect(computer.create_opponent_marker).to     eq("X")
    end

  end

  describe ".eval_board" do

    it "A spot should be chosen at random if difficulty == 'Easy'" do
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      allow(computer).to    receive(:get_random_move).and_return(2)
      expect(computer).to   receive(:get_random_move)
      computer.eval_board(board, "Easy")
    end

    it "should call get_average_move if difficulty == 'Normal'" do
      computer = Computer.new("O","Normal")
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      allow(computer).to    receive(:get_average_move).and_return(2)
      expect(computer).to   receive(:get_average_move)
      computer.eval_board(board, "Normal")
    end
    it "should call get_best_move if difficulty == 'Hard'" do
      computer = Computer.new("O","Hard")
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      allow(computer).to    receive(:get_best_move).and_return(5)
      expect(computer).to   receive(:get_best_move)
      computer.eval_board(board, "Hard")
    end

  end

  describe ".get_best_move" do
    it "should return 4 if board[4] is available" do
      computer = Computer.new("O","Hard")
      board = ["0", "1", "2", "X", "4", "5", "O", "O", "X"]
      expect(computer.get_best_move(board)).to  eq(4)
    end

    it "should return the spot that makes the computer win" do
      computer = Computer.new("O","Hard")
      board = ["O", "1", "2", "X", "X", "5", "O", "O", "X"]
      expect(computer.get_best_move(board)).to  eq(5)
    end

    it "should return the spot that prevents the opponent victory" do
      computer = Computer.new("O","Hard")
      board = ["O", "O", "2", "X", "O", "5", "O", "X", "X"]
      expect(computer.get_best_move(board)).to  eq(2)
    end
  end


  describe ".get_average_move" do

    it "should return get_random_move if rand return a value smaller than 50" do
      computer = Computer.new("O", "Normal")
      board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      allow(Kernel).to    receive(:rand).and_return(15)
      allow(computer).to  receive(:get_random_move).and_return(5)
      computer.get_average_move(board)
    end

    it "should return get_best_move if rand return a value equal to 50" do
      computer = Computer.new("O", "Normal")
      board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      allow(Kernel).to    receive(:rand).and_return(50)
      allow(computer).to  receive(:get_best_move).and_return(5)
      computer.get_average_move(board)
    end

    it "should return get_best_move if rand return a value greater than 50" do
      computer = Computer.new("O", "Normal")
      board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      allow(Kernel).to    receive(:rand).and_return(55)
      allow(computer).to  receive(:get_best_move).and_return(5)
      computer.get_average_move(board)
    end

  end

  describe ".get_available_spaces" do
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

  describe ".draw_into_board" do
    it "should draw into the board if the spot is available" do
      board = ["0", "1", "2", "X", "X", "5", "O", "O", "X"]
      computer.draw_into_board(board, 5)
      expect(board).to    match_array(["0", "1", "2", "X", "X", "O", "O", "O", "X"])
    end
# the test case in which the spot is occupied isn't necessary since the computer
# class uses the get_available_spaces at the begining each get movement method
  end
end
