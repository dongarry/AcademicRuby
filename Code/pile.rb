
# A Pile represents the pile of cards on the table during a card game

require_relative 'card_list.rb'
require_relative 'observer1.rb'
require_relative 'observer2.rb'
require 'observer'


class Pile
  include Observable

  attr_reader :last_winner

  # Create an empty hand.
	def initialize
    @card_list = CardList.new
    #my_ob = Ob_one.new(self)
    my_ob2 = Ob_low_winners.new(self)
    @last_winner = String.new
  end

  # Add card to pile.
  def add card
    @card_list.add card
  end

  # Empty the pile.
  def empty!
    @card_list.empty!
  end

  # Sort the pile.
  def sort!
    @card_list.sort
  end

  def list
    @card_list
  end

  # Return pile as string
  def to_string
    @card_list.to_string
  end

  # iterate over all cards in pile
  def each
    @card_list.each{|card| yield card}
  end

  # Return number of cards in pile
  def no_of_cards
    @card_list.no_of_cards
  end

  # Return the best card in the pile
  def calculate_winner players

    sorted_cards = @card_list.sort  # sort cards in 'poker' order
    players.each_with_index {|player, i|
      if sorted_cards[-1] == player.get_last_card_played
          @last_winner=player.name
      end
    }
    # Switched off this observation for the moment
     #changed
     #notify_observers(sorted_cards[-1].to_string)

    if sorted_cards[-1].to_string_other.include?("FIVE") then
      changed
      notify_observers(@last_winner,sorted_cards[-1].to_string)
    end

    sorted_cards[-1]                # return best card
  end

  # Return true iff top two cards of same suit
  def snap?
    if @cards.length < 2
      false
    # check for snap!
    elsif @cards[-1].suit == @cards[-2].suit
      true
    else
      false
    end
  end
end