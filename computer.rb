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

  def eval_board(board, difficulty)
    spot = nil
    until spot
      # depending on the difficulty, it choose to do either a bad move or the best move
      if difficulty == "E"
          spot = get_bad_move(board, marker)
          if board[spot] != "X" && board[spot] != "O"
            board[spot] = marker
          else
            spot = nil
          end
      else
          if board[4] == "4"
            spot = 4
            board[spot] = marker
          else
            spot = get_best_move(board, marker)
            if board[spot] != "X" && board[spot] != "O"
              board[spot] = marker
            else
              spot = nil
            end
          end
      end
    end
  end

  def get_available_spaces(board)
    available_spaces = []
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
  end

  def get_best_move(board, next_player)
    best_move = nil
    available_spaces = get_available_spaces(board)
    available_spaces.each do |as|
      board[as.to_i] = @marker
      if Game.game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @oponent_marker
        if Game.game_is_over(board)
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
  def get_bad_move(board, next_player)
    bad_move = nil
    available_spaces = get_available_spaces(board)
    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end
end
