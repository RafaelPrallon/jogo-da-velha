class Computer
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
  end

  def oponent_marker
    if @marker  == "X"
      @oponent_marker = "O"
    else
      @oponent_marker = "X"
    end
  end

  def eval_board
    spot = nil
    until spot
      if @board[4] == "4"
        spot = 4
        @board[spot] = @marker
      else
        spot = get_best_move(@board, @marker)
        if @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = @marker
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @marker
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @oponent_marker
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end
end
