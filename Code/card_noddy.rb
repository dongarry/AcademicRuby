require_relative 'mod_observation.rb'

COLOURS = [:YELLOW, :BROWN, :GREY, :ORANGE, :WHITE, :BLUE, :BLACK, :GREEN, :SILVER, :PURPLE, :PINK, :GOLD]

# The class Card represents a card in a normal playing deck.
class NoddyCard
  include Comparable
  include ModObservation

  attr_accessor :colour

  def initialize colour
    @colour = colour
  end

  # Return a string that represents this card.
  def to_string
    "#{colour}"
  end

  def to_string_other
    #Had implemented this previously for some report - left it here
    "#{colour}"
  end


# Compare two cards (fixit: refactor)
  def <=> card
    if rank_of_colour > card.rank_of_colour
      return 1
    end
    if rank_of_colour < card.rank_of_colour
      return -1
    end

    if rank_of_colour == card.rank_of_colour
      notify_observers_fraud card.to_string
      #return 0 # should not happen in a Noddy card game!
    end
  end

  protected

  # Return numeric rank of kind using "Noddy poker" ordering.
  def rank_of_colour
    COLOURS.each_with_index do |colour, i|
      if colour == @colour
        return i
      end
    end
    raise "colour not found: #{@colour}"
  end


end