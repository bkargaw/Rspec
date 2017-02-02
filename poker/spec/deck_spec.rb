require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe '#initialize' do
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

  describe '#get_top_card' do
    it 'returns the top card in the cards instance variable' do
      top_card = deck.cards.last
      expect(deck.get_top_card).to be(top_card)
    end

    it 'it removes the card that was given to the player' do
      deck.get_top_card
      expect(deck.cards.length).to be(51)
    end
    context 'when it deals all of the cards away' do
      before(:each) do
        52.times{deck.get_top_card}
      end
      it 're-populates cards in the deck' do
        expect(deck.cards.length).to eq(52)
      end

    end


  end

# get_top_card
# rest_cards
# get_new _set

end
