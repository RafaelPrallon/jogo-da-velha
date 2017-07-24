class Computer
  attr_accessor :marker
  def initialize(marker, difficulty)
    @marker = marker
    @opponent_marker = create_opponent_marker
    @difficulty = difficulty
  end

  def create_opponent_marker
    if @marker  == "X"
      return "O"
    else
      return "X"
    end
  end
  def get_play(board)
    spot = eval_board(board, @difficulty)
    draw_into_board(board,spot,@marker)
  end
  def eval_board(board, difficulty)
    spot = nil
    until spot
      # depending on the selected difficulty and the total number of difficulties
      # it choose to do either a random move or the best move possible
      if difficulty == "Easy"
        spot = get_random_move(board)
      elsif difficulty =="Normal"
        spot = get_average_move(board)
      else
        spot = get_best_move(board)
      end
    end
    puts "PC chooses #{spot}"
    return spot
  end

  def draw_into_board(board, spot, marker)
    # it will draw in the board at the position spot if available
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

  def get_best_move(board)
    best_move = nil
    available_spaces = get_available_spaces(board)
    if available_spaces.include? "4"
      best_move = 4
    else
      available_spaces.each do |as|
        board[as.to_i] = @marker
        if Game.game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          # if the opponent is about to win, it will choose the spot the will give
          # the opponent the victory
          board[as.to_i] = @opponent_marker
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
  end

  def get_random_move(board)
    available_spaces = get_available_spaces(board)
    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end
  def get_average_move(board)
    n = rand(0..100)
    if n < 50
      return get_random_move(board, @marker)
    else
      return get_best_move(board, @marker)
    end
  end
end
