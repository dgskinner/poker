require 'card.rb'
require 'rspec'

describe Card do

  describe '#initialize' do
    it 'creates new card with valid suit' do
      expect(Card.new(:clubs, :ace).suit).to eq(:clubs)
    end
    
    it 'creates new card with valid value' do
      expect(Card.new(:clubs, :ace).value).to eq(:ace)
    end

    it 'does not create card with invalid parameters.' do
      expect { Card.new(:red, :twelve).value }.to raise_error
    end
  end
  
  describe '::suits' do
    it 'keeps track of valid suits' do
      expect(Card.suits.sort).to eq([:clubs, :diamonds, :hearts, :spades].sort)
    end
  end
  
  describe '::values' do
    it 'keeps track of valid values' do
      expect(Card.values).to eq([:deuce, :three, :four, :five, :six, :seven,
                              :eight, :nine, :ten, :jack, :queen, :king, :ace])
    end
  end
  
end