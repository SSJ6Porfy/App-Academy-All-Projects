require 'rspec'
require 'deck'




describe Deck do

  subject(:deck) { Deck.new }
  let(:player) { double("player") }

  describe "#initialize" do
    it "initializes a deck of 52 cards" do
      expect(deck.cards.size).to eq(52)
    end

    it "creates four suits" do
      suits = [:spades, :clubs, :hearts, :diamonds].sort
      expect(deck.cards.map(&:suit).uniq.sort).to eq(suits)
    end

    it "creates 13 cards of each type in each suit" do
      expect(deck.cards.select { |card| card.type == :jack }.size).to eq(4)
      expect(deck.cards.select { |card| card.type == :two }.size).to eq(4)
      expect(deck.cards.select { |card| card.type == :ace }.size).to eq(4)
    end
  end

  describe "#shuffle" do
    it "calls Array#shuffle! method on the deck of cards" do
      expect(deck.cards).to receive(:shuffle!)
      deck.shuffle
    end
  end

  describe "#deal" do

    it "deals 1 card to one player" do
      expect(player).to_receive(:receive_cards)
      deck.deal(player)
      expect(deck.cards.size).to eq(51)
    end
  end

  describe "#collect_cards" do
    it "collects the cards from the player" do
      deck.deal(player)
      deck.deal(player)
      deck.deal(player)
      expect(deck.cards.size).to eq(49)
      deck.collect_cards(player)
      expect(deck.cards.size).to eq(52)
    end
  end

end
