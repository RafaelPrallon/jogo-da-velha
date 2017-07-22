class Menu

  def self.select_game_mode
    # player enter a number between 1 and 3 to choose game mode
    mode = nil
    until (mode == 1 || mode == 2 || mode == 3)
      puts "Select game mode:
            1. Human x Human
            2. Human x PC
            3. PC X PC"
      mode = gets.chomp.to_i
      if (mode != 1 && mode != 2 && mode != 3)
        puts "Invalid option"
      end
    end
    return mode
  end

  def self.select_difficulty
    difficulty = nil
    until (difficulty == "E" || difficulty == "N" || difficulty == "H")
      puts "Please select difficulty:
                            E: Easy mode
                            N: Normal mode
                            H: Hard mode"
      difficulty = gets.chomp.to_s.capitalize
      if (difficulty != "E" && difficulty !="H" && difficulty != "N")
        puts "Invalid option"
      end
    end
    if difficulty == "E"
      puts "Easy mode selected"
    else
      puts "Hard mode selected"
    end
    select_difficulty = difficulty
  end

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

  def self.prompt(prompt_text)
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


end
