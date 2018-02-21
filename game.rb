class Game

  def initialize
    @human_moves = []
    @computer_moves = []
    @human_wins = 0
    @computer_wins = 0
    @ties = 0
    @game_over = false
    @number_of_rounds = 50

    @last_winner = " "
    @last_human_choice = " "
    @last_computer_choice = " "
  end

  #Process move
  def process_move(human_choice)
    #Input computer choice
    @computer_choice = computer_choice

    #Compare choices and determine winner
    winner = who_wins(human_choice, @computer_choice)

    #Add wins to appropriate column
      if winner == "human"
        @human_wins = @human_wins + 1
      elsif winner == "computer"
        @computer_wins = @computer_wins + 1
      else
        @ties = @ties + 1
      end

    #Save human choice into array
    @human_moves << human_choice

    #Save computer choice into array
    @computer_moves << @computer_choice

    #update choices and winner
    @last_winner = winner
    @last_human_choice = human_choice
    @last_computer_choice = @computer_choice
  end

  #Main AI of the program
  def computer_choice
    choices =['rock','paper','scissors']
    choices.sample
  end

  def who_wins(human_choice, computer_choice)
    if human_choice == computer_choice
      return "tie"
    elsif human_choice == "rock" && computer_choice == "scissors"
      return "human"
    elsif human_choice == "rock" && computer_choice == "paper"
      return "computer"
    elsif human_choice == "paper" && computer_choice == "scissors"
      return "computer"
    elsif human_choice == "paper" && computer_choice == "rock"
      return "human"
    elsif human_choice == "scissors" && computer_choice == "rock"
      return "computer"
    elsif human_choice == "scissors" && computer_choice == "paper"
      return "human"
    end
  end

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

  
end
