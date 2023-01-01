require './player'
require './question'

class Game 
  attr_reader :current_turn

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end

  def start
    puts "Welcome to the TwO-O-Player Math Game!"

    @current_turn = @player1

    while (@current_turn.lives > 0)
      start_round
    end

    end_game
  end

  def start_round
    puts "---- NEW TURN -----"

    question = Question.new

    puts "#{@current_turn.name}: #{question.math_question}"

    player_answer = gets.chomp.to_i
  
    if question.validate_answer(player_answer)
      puts "#{@current_turn.name}: YES! You are correct."
    else 
      puts "#{@current_turn.name} Seriously? No!"
      @current_turn.lose_one_life
    end

    current_lives

    switch_player
  end

  def current_lives
    puts "P1: #{@player1.lives}/3  vs P2: #{@player2.lives}/3"
  end

  def switch_player
    if (@current_turn == @player1)
      @current_turn = @player2
    else
      @current_turn = @player1
    end
  end

  def end_game
    if (@current_turn.lives == 0)
      puts "#{@current_turn.name} wins with score of #{@current_turn.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
  end
end