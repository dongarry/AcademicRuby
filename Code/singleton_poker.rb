
require_relative 'player.rb'
require_relative 'hand.rb'
require_relative 'deck.rb'
require_relative 'pile.rb'
require_relative 'report.rb' # new report class
require_relative 'html.rb'
require_relative 'PDF.rb'
require_relative 'superReport.rb'
require_relative 'mod_observation.rb'
require_relative 'noddy_deck.rb'
require_relative 'noddy_pile.rb'
require_relative 'poker_factory.rb'
#require 'singleton' # We only want one version of the game going..

# Class that represents a simple 1-card poker game or a Noddy Colour game (depending on type)

class Poker_Singleton
  #include Singleton
  #include ModObservation

  @@instance = Poker_Singleton.new 6, [Player.new("John"), Player.new("Mary"), Player.new("Luke"), Player.new("Eimear")], PokerComposition.new

  attr_reader :winning_card

  private_class_method :new

  def self.instance
    return @@instance
  end

  # Create poker game of given number of rounds using players array.
  def initialize  no_of_rounds, players, type
    super()
    @players = players
    @no_of_rounds = no_of_rounds
    @results = Hash.new
    @winning_card=String.new
    @players.each do |player|
    @results[player.name] = []
    @game_type=type
    end
  end

  # Player the game of Poker.
  def play
    @pile = @game_type.new_pile
    @no_of_rounds.times do
      play_round
      @pile.empty!
    end
  end


  # Play an individual round.
  def play_round

    @deck = @game_type.new_deck
    # deal each player a hand
    @players.each do |player|
      player.set_hand(@deck.deal_hand(1))
    end
    # Each player plays a card
    @players.each do |player|
      @pile.add(player.play)
    end

    @winning_card = @pile.calculate_winner @players
    #notify_observers

   winner=@pile.last_winner
    @results[winner] << winning_card.to_string

  end

  # Print the overall results of the series of rounds
  def print_results
    @results.each do |name, results|
      puts "#{name} won #{@results[name].length} times with #{results}"
    end
  end
end

# *****************************************************************************
# Simple test to ensure only one instance is returned
# *****************************************************************************

poker_game = Poker_Singleton.instance
another_poker_game = Poker_Singleton.instance
puts another_poker_game.eql?(poker_game)

