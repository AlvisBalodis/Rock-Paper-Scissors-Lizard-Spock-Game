class Player
  attr_accessor :choice

  def initialize
    @choice = choice
  end
  def move
    choice = gets.chomp.to_sym
  end

  def valid_choice?(choice)
    %i[rock paper scissors lizard spock].include?(choice)
  end
end
