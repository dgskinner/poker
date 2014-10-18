require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'player'

hand = Hand.new(Deck.new.deal(5))
hand.cards = [Card.new(:hearts, :five), Card.new(:hearts, :six), 
             Card.new(:clubs, :nine), Card.new(:hearts, :seven), Card.new(:hearts, :deuce)]
p hand
p hand.identify

