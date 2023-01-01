class Player
  attr_reader :name, :lives
  
  def initialize (name)
    @name = name
    @lives = 3
  end
  
  def lose_one_life
    @lives -= 1
  end
end