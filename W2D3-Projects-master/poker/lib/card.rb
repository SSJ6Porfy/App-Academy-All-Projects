class Card
  attr_reader :type, :suit, :value

  def initialize(type, suit, value)
    @type = type
    @suit = suit
    @value = value
  end
end
