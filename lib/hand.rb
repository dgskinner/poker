TIEBREAK_VALUE = {
  :deuce => 2,
  :three => 3,
  :four  => 4,
  :five  => 5,
  :six   => 6,
  :seven => 7,
  :eight => 8,
  :nine  => 9,
  :ten   => 10,
  :jack  => 11,
  :queen => 12,
  :king  => 13,
  :ace   => 14
}


class Hand
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end
  
  def values
    @cards.map{|card| card.value}
  end
  
  def num_values
    values.map{ |val| TIEBREAK_VALUE[val] }.sort
  end
  
  def suits
    @cards.map{ |card| card.suit }
  end
  
  def straight_flush
    if !straight || !flush
      return false
    end
    
    straight
  end
  
  def four_of_kind
    
    num_values.uniq.each do |value|
      #p values.count(value)
      return value if num_values.count(value) == 4
    end
    
    false
  end
  
  def full_house
    if num_values.uniq.length == 2
      num_values.uniq.each do |value|
        return value if num_values.count(value) == 3
      end
    end
    
    false
  end
  
  def flush
    if suits.uniq.length == 1
      return num_values 
    end
    
    false
  end
  
  def straight

    4.times do |i|
      return false unless num_values[i] + 1 == num_values[i + 1]
    end
    
    num_values.last
  end
  
  def three_of_kind
    if num_values.uniq.length == 3
      num_values.uniq.each do |value|
        return value if num_values.count(value) == 3
      end
    end
    
    false
  end
  
  def pair
    if num_values.uniq.length == 4
      paired = []
      unpaired = []
      num_values.each do |value|
        if num_values.count(value) == 2
          paired << value
        else
          unpaired << value
        end
      end
      return (paired + unpaired.reverse) 
    end
    
    false
  end
  
  def two_pair
    if num_values.uniq.length == 3 && !three_of_kind
      paired = []
      unpaired = []
      num_values.each do |value|
        if num_values.count(value) == 2
          paired << value
        else
          unpaired << value
        end
      end
      return (paired.reverse + unpaired) 
    end
    
    false
  end
  
  def high_card
    return num_values.reverse if num_values.uniq.length == 5
    false
  end
  
  def identify
    methods = [straight_flush, four_of_kind, full_house, flush, straight, 
                  three_of_kind, two_pair, pair, high_card]
    methods.each_with_index do |method, index|
      return index if method
    end  
  end
  
  def compare
    
  end
  
end

