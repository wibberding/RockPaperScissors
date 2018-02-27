class Game

  def initialize
    @human_moves = []
    @computer_moves = []
    @human_wins = 0
    @computer_wins = 0
    @ties = 0
    @game_over = false
    @number_of_rounds = 0
    @rounds_to_play = 30
    @last_winner = " "
    @last_human_choice = "r"
    @last_computer_choice = "r"
  end

  #Main AI of the program
  def computer_ai_1
    choices =['r', 'p', 's']
    choices.sample
  end

  #Play whatever move the human played last time.
  def computer_ai_2
    choice = @human_moves[-1]
  end

  #Find the average of what the human played and play something that would beat that.
  def computer_ai_3
    rock = 0
    paper = 0
    scissors = 0
    most_played = "r"
    choice = "p"

    # Find which moves have been played the most.
    
    @human_moves.each do |move|
      if move == 'r'
        rock = rock + 1
      elsif move == 'p'
        paper = paper + 1
      elsif move == 's'
        scissors = scissors + 1
      end
    end

    if rock > paper && rock > scissors
      most_played = "r"
    elsif paper > rock && paper > scissors
      most_played = "p"
    elsif scissors > paper && scissors > rock 
      most_played = "s"
    else
      #choose random if they tie
      choices =['r', 'p', 's']
      most_played = choices.sample
    end

    #play the hand that beats the human move.
    if most_played == 'r'
      choice = 'p'
    elsif most_played == 'p'
      choice = 's'
    elsif most_played == 's'
      choice = 'r'
    end

    return choice
  end


  #Process move
  def process_move(human_choice)

    #Check if game is over
    if (@number_of_rounds + 1) >= @rounds_to_play
      @game_over = true
    end

    #Input computer choice
    @computer_choice = computer_ai_1

    #Compare choices and determine winner
    winner = who_wins(human_choice, @computer_choice)

    #Add wins to appropriate column
      if winner == "Human"
        @human_wins = @human_wins + 1
      elsif winner == "Computer"
        @computer_wins = @computer_wins + 1
      else
        @ties = @ties + 1
      end

    #Save human choice into array
    @human_moves << human_choice

    #Save computer choice into array
    @computer_moves << @computer_choice

    #Adds to round count
    @number_of_rounds = @number_of_rounds + 1

    #update choices and winner
    @last_winner = winner
    @last_human_choice = human_choice
    @last_computer_choice = @computer_choice
  end

  def who_wins(human_choice, computer_choice)

    if human_choice == computer_choice
      return "Tie"

    elsif human_choice == "r" && computer_choice == "s"
      return "Human"

    elsif human_choice == "r" && computer_choice == "p"
      return "Computer"

    elsif human_choice == "p" && computer_choice == "s"
      return "Computer"

    elsif human_choice == "p" && computer_choice == "r"
      return "Human"

    elsif human_choice == "s" && computer_choice == "r"
      return "Computer"

    elsif human_choice == "s" && computer_choice == "p"
      return "Human"
    end

  end

  #Accessor methods
  def computer_wins
    @computer_wins
  end

  def human_wins
    @human_wins
  end

  def ties
    @ties
  end

  def last_human_choice
    @last_human_choice
  end

  def last_computer_choice
    @last_computer_choice
  end

  def last_winner
    @last_winner
  end

  def number_of_rounds
    @number_of_rounds
  end

  def rounds_to_play
    @rounds_to_play
  end

  def game_over
    @game_over
  end
  
end
