
# A Pile represents the pile of cards on the table during a card game

require_relative 'card_list.rb'
require_relative 'observer1.rb'
require_relative 'observer2.rb'
require_relative 'observer3.rb'
require 'observer'


class NoddyPile
  include Observable

   attr_reader :last_winner

  # Create an empty hand.
	def initialize
    @card_list = CardList.new
    #my_ob = Ob_one.new(self)
    #my_ob2 = Ob_low_winners.new(self)
    my_ob3 = Ob_change_winners.new(self)
    @last_winner = String.new
  end

  # Add card to pile.
  def add card
    # Unlucky for some !
    # Sometimes Moody Players won't play.
    if rand(40)==13
        puts "Moody player didn't play!"
    else
       @card_list.add card
    end
  end

  def remove card
      @card_list.remove card
  end

  # Empty the pile.
  def empty!
    @card_list.empty!
  end

  # Sort the pile.
  def sort!
    @card_list.sort
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
    found=0
    winning_card_index=-1

    while found==0
      players.each_with_index do |player, i|
        # if we have the same winner twice in a row, we return the next best card (i.e. let someone else win)
        if sorted_cards[winning_card_index] == player.get_last_card_played
          if player.name==@last_winner

            changed
            notify_observers player.name,player.get_last_card_played.to_string

            winning_card_index=-2
            break
          else
            @last_winner=player.name
            found=1
            break
          end
        end
      end
    end

    # Switched off this observation for the moment
     #changed
     #notify_observers(sorted_cards[-1].to_string)

    #if sorted_cards[@winning_card_index].to_string_other.include?("WHITE") then
    #  changed
    #  notify_observers(@last_winner,sorted_cards[@winning_card_index].to_string)
    #end

    #sorted_cards[@winning_card_index]                # return best card
    sorted_cards[winning_card_index]

  end


end