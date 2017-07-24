require_relative "invalid_option_error"
class Player
  attr_accessor :marker

  def initialize (marker)
    @marker = marker
  end

  def get_input
    return STDIN.gets.chomp
  end

  def is_number? string
    true if Integer(string) rescue false
  end

  def is_positive? string
    true if string.to_i >= 0 rescue false
  end

  def is_too_big? string
    true if string.to_i > 8 rescue false
  end

  def validate_input
    spot = self.get_input
    unless (self.is_number?(spot) && self.is_positive?(spot) && !self.is_too_big?(spot))
      raise InvalidOptionError
    else
      return spot
    end
  end

  def draw_into_board(board, spot)
    unless board[spot] == "X" || board[spot] == "O"
      board[spot] = @marker
    else
      raise InvalidOptionError
    end
  end

  def get_play(board)
    spot = nil
    begin
      spot = validate_input.to_i
      draw_into_board(board, spot)
    rescue InvalidOptionError
      puts "Please choose a place that isn't taken"
      spot = validate_input.to_i
      draw_into_board(board, spot)
    end
  end
end
