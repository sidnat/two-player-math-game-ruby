class Question
  attr_reader :sum

  def initialize
    @first = rand(25)
    @second = rand(25)
    @sum = @first + @second
  end

  def math_question
    puts "What does #{@first} plus #{@second} equal?"
  end

  def validate_answer(player_response)
    player_response == @sum
  end
end

