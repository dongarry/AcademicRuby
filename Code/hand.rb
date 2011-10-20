
require_relative 'card_list.rb'

# Represents a hand of cards in a card game.
class Hand
  # Create an empty hand.
	def initialize
    @card_list= CardList.new
  end

  # Add card to hand.
  def add card
    @card_list.add card
  end

  # Return card as string
  def to_string
    @card_list.to_string
  end

  # Remove a random card from the hand and return it.
  # Return false if deck empty.
  def pick_random
    @card_list.pick_random
  end

  # iterate over all cards in hand
  def each
    @card_list.each{|card| yield card}
  end

  # Return number of cards in hand
  def no_of_cards
    @card_list.no_of_cards
  end

end