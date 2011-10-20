
# This is the implementation class for all the classes that involve a list
# of cards, including Deck, Hand and Pile

class CardList

  # Create an empty card list
  def initialize
    @cards = []
  end

  # Add the given card to the cardlist.
  def add card
    @cards.push card
  end

  # Remove the given card from the cardlist.
  def remove remove_card
    @cards.each_with_index do |card, i|
      if card.to_string == remove_card.to_string
        @cards.delete_at(i)
        return true
      end
    end
    false
  end

  # Make cardlist empty
  def empty!
    @cards = []
  end

  # Sort the cardlist
  def sort!
    @cards.sort!
  end

  # Provide array-style access to the cardlist
  def [] i
    @cards[i]
  end

  # Deal a hand of size no_of_cards from the cardlist.
  def deal_hand no_of_cards
    hand = Hand.new
    no_of_cards.times do
      hand.add pick_random
    end
    hand
  end

  # Remove a random card from the cardlist and return it.
  # Return false if cardlist empty.
  def pick_random
    if @cards.length == 0
      return false
    end
    index = rand(@cards.length)
    card = @cards[index]
    @cards.delete_at(index)
    card
  end

  # iterate over all cards in cardlist
  def each
    @cards.each{|card| yield card}
  end

  # Return a sorted cardlist
  def sort
    @cards.sort
  end

  # Return a string that represents the cardlist
  def to_string
    @cards.inject("") do |str, card|
      str += card.to_string + " "
    end
  end

  # Test if cardlist has given card.
  def has_card? test_card
    @cards.each do |card|
      if card.to_string==test_card.to_string
        return true
      end
    end
    false
  end

  # Return number of cards in cardlist
  def no_of_cards
    @cards.length
  end

end