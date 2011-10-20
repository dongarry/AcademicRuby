require_relative 'card.rb'
require_relative 'card_list.rb'

class Deck

  # Create a normal 52-card playing deck.
  def initialize
    @card_list = CardList.new
    SUITS.each do |suit|
      KINDS.each do |kind|
        card = Card.new suit, kind
        @card_list.add card
      end
    end
  end

  # Add the given card to the deck.
  def add card
    @card_list.add card
  end

  # Remove the given card from the deck.
  def remove remove_card
    @card_list.remove remove_card
  end

  # Make deck empty
  def empty!
    @cards = []
  end

  # Sort the deck
  def sort!
    @card_list.sort!
  end

  # Provide array-style access to the deck
  def [] i
    @card_list[i]
  end

  # Deal a hand of size no_of_cards from the deck.
  def deal_hand no_of_cards
    @card_list.deal_hand no_of_cards
  end

  # Remove a random card from the deck and return it.
  # Return false if deck empty.
  def pick_random
    @card_list.pick_random
  end

  # iterate over all cards in deck
  def each
    @card_list.each
  end

  # Return a string that represents the deck
  def to_string
    @card_list.to_string
  end

  # Test if deck has given card.
  def has_card? test_card 
    @card_list.has_card? test_card
  end

  # Return number of cards in deck
  def no_of_cards
    @card_list.no_of_cards
  end
end

##################################################
# Script to exercise Deck
##################################################

=begin
my_deck = Deck.new
hands = []
4.times do |i|
  hands[i] = my_deck.deal_hand 5
end
=end
