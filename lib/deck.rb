class Deck
  attr_reader :cards
  
  def initialize
    @cards = build_deck
    shuffle!
  end
  
  def number
    @number = @cards.length
  end
  
  def build_deck
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    
    cards
  end
  
  def deal(n)
    @cards.pop(n)
  end
  
  def shuffle!
    @cards.shuffle!
  end
  
end