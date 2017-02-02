require_relative 'card'

class Deck

  SUITS = [:c, :h, :s, :d]
  VALUES = ["A", "2", "3", "4", "5", "6", "7", "8", "9",
            "10", "J", "Q", "K"]

  attr_reader :cards

  def initialize
    @cards = populate
  end

  private
  def populate
    cards = []

    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

end



# populate
