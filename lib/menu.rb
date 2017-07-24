require_relative "invalid_option_error"
class Menu

=begin
  def self.confirm
    confirmation = nil
    puts "Is that how you want the game?(Y/N)\n "
    until confirmation
      confirmation = gets.chomp.capitalize
      unless (confirmation == "Y" || confirmation == "N")
        puts "Invalid option, please choose a valid option.(Y/N)"
        confirmation = nil
      end
    end
    return confirmation
  end

  def prompt(prompt_text)
  # generic yes or no prompt function, initially will be used for the
  # confirmation and the continue menu
    prompt = nil
    puts prompt_text
    until prompt
      prompt = gets.chomp.capitalize
      unless (prompt == "Y" || prompt == "N")
        puts "Invalid option, please choose a valid option.(Y/N)"
        prompt = nil
      end
    end
    return prompt
  end
=end
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
    difficulty = select_option("Please select difficulty\n", difficulties)
    return difficulty
  end

end
