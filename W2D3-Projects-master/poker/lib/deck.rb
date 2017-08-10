require 'card'


class Deck
  attr_reader :cards

  TYPES = %w(two three four five six seven eight nine ten jack queen king ace).map(&:to_sym)
  SUITS = %w(clubs diamonds hearts spades).map(&:to_sym)
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].freeze

  def self.create_cards
    deck = []
    SUITS.each do |suit|
      TYPES.each_index do |i|
        deck << Card.new(TYPES[i], suit, VALUES[i])
      end
    end

    deck
  end

  def initialize
    @cards = Deck.create_cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(player)
    player.receive_card(@cards.shift)
  end

  def collect_cards(player)
    card = player.give_card
    @cards << card
  end

end
