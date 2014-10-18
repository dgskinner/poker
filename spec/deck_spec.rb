require 'deck.rb'
require 'rspec'

describe Deck do
  describe 'initialize' do
    it 'should initialize a deck with 52 cards' do
      expect(Deck.new.number).to eq(52)
    end
  end
  
  describe 'dealing cards' do
    it 'deals five cards' do
      # deck = Deck.new
      subject.deal(5)
      # expect(subject.number).to eq(47)
      expect(subject.number).to eq(47)
    end
    
  end
end