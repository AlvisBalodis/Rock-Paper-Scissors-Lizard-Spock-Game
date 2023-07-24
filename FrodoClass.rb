class Frodo
  attr_reader :choices

  def initialize(choices)
    @choices = choices
  end

  def move
    choices.sample
  end
end
