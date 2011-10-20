require_relative 'mod_observation.rb'

SUITS = [:CLUBS, :DIAMONDS, :HEARTS, :SPADES]
KINDS = [:TWO,:THREE, :FOUR, :FIVE, :SIX, :SEVEN, :EIGHT, :NINE, :TEN, :JACK, :QUEEN, :KING, :ACE]

# The class Card represents a card in a normal playing deck.
class Card
  include Comparable
  include ModObservation

  attr_accessor :suit, :kind
  
  def initialize suit, kind
    @suit = suit
    @kind  = kind
  end

  # Return a string that represents this card.
  def to_string
    "#{kind} of #{suit}"
  end

  def to_string_other
    "#{kind}"
  end

# Compare two cards (fixit: refactor)
  def <=> card
    if rank_of_kind > card.rank_of_kind
      return 1
    end
    if rank_of_kind < card.rank_of_kind
      return -1
    end
    if rank_of_suit > card.rank_of_suit
      return 1
    end
    if rank_of_suit < card.rank_of_suit
      return -1
    end
    if rank_of_suit == card.rank_of_suit
      notify_observers_fraud card.to_string
      #return 0 # should not happen in a single-pack card game!
    end
  end

  protected

  # Return numeric rank of kind using "poker" ordering.
  def rank_of_kind
    KINDS.each_with_index do |kind, i|
      if kind == @kind
        return i
      end
    end
    raise "kind not found: #{@kind}"
  end

  # Return numeric rank of suit using "poker" ordering.
  def rank_of_suit
    SUITS.each_with_index do |suit, i|
      if suit == @suit
        return i
      end
    end
    raise 'suit not found'
  end

end