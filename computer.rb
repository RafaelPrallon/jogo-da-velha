class Computer
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
    oponent_marker
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
        draw_into_board(board, spot, marker)
      elsif difficulty =="N"
        spot = get_average_move(board, marker)
        draw_into_board(board, spot, marker)
      else
          if board[4] == "4"
            spot = 4
            board[spot] = marker
          else
            spot = get_best_move(board, marker)
            puts "PC chooses #{spot}"
            draw_into_board(board, spot, marker)
          end
      end
    end
  end
  def draw_into_board(board, spot, marker)
    if board[spot] != "X" && board[spot] != "O"
        board[spot] = marker
        else
        spot = nil
    end
  end

  def get_available_spaces(board)
    available_spaces = []
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    return available_spaces
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
    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end

  def get_bad_move(board, next_player)
    bad_move = nil
    available_spaces = get_available_spaces(board)
    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end
  def get_average_move(board, next_player)
    n = rand(0..100)
    if n < 50
      return get_bad_move(board, @marker)
    else
      return get_best_move(board, @marker)
    end
  end
end
