
require_relative 'hand.rb'

# Represents a card game player.
class Player
  attr_reader :name

  # Create a player with the given name.
  def initialize name
    @name = name
    @my_hand = Hand.new
    @last_card_played = nil # last card played by the player
  end

  # Give the player a hand to play.
  def set_hand hand
    @my_hand = hand
  end

  # Player is going to give his feelings on the game!
  def says (opinion)
    puts "#{name} says #{opinion}"
  end

  def get_last_card_played
     @last_card_played
  end

   def set_last_card_played card
     @last_card_played=card
  end

  # Return a random card from the hand.
  def play
    @last_card_played = @my_hand.pick_random
    set_last_card_played @last_card_played
  end

  # Return a string that represents this player and their hand.
  def to_string
    @name + ": " + @my_hand.to_string
  end

end
