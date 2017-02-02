require 'card'

describe Card do
  describe '#initialize' do
    subject(:card) {Card.new(:h,"K")}
    it 'initializes a suit instance variable when given' do
      expect(card.suit).to eq(:h)

    end
    it 'initializes a value instance variable when given' do
      expect(card.value).to eq("K")
    end
  end

end
