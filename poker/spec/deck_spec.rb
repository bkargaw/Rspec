require 'deck'

describe Deck do

  describe '#initialize' do
    subject(:deck) { Deck.new }

    it 'initializes an array of fifty two cards' do
      expect(deck.cards.length).to eq(52)
    end

    it 'ensures cards are unique' do
      expect(deck.cards.uniq.length).to eq(52)
    end

    it 'produces thirteen cards for each suit' do
      hearts = deck.cards.select { |card| card.suit == :h }
      expect(hearts.length).to be(13)

      spades = deck.cards.select { |card| card.suit == :s }
      expect(spades.length).to be(13)

      diamonds = deck.cards.select { |card| card.suit == :d }
      expect(diamonds.length).to be(13)

      clubs = deck.cards.select { |card| card.suit == :c }
      expect(clubs.length).to be(13)
    end
  end

# shuffle
# get_top_card
# rest_card

end
