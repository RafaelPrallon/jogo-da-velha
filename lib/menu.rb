require_relative "invalid_option_error"
class Menu

  def get_input
    return STDIN.gets.chomp
  end

  def validate_input(options)
    choice = self.get_input
    unless options.include? choice
      raise InvalidOptionError
    end
    return choice
  end

  def select_option(menu_text, options)
    # will create a custom menu text based on the menu_test variable and
    # the amount of options sent through the options array variable
    options.each do |option|
      menu_text << "#{option} \n"
    end
    puts menu_text
    begin
      choice = self.validate_input(options)
    rescue InvalidOptionError
      puts "Please enter a valid option."
      puts menu_text
      choice = self.validate_input(options)
    end
    return choice
  end

  def select_difficulty
    difficulties = ["Easy", "Normal", "Hard"]
    difficulty = select_option("\nPlease select difficulty\n", difficulties)
    return difficulty
  end

end
