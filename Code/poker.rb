
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
require_relative 'player_decorator.rb'
require_relative 'deck_check.rb'
#require 'singleton' # We only want one version of the game going..

# Class that represents a simple 1-card poker game or a Noddy Colour game (depending on type)

class Poker
  #include Singleton
  include ModObservation

  attr_reader :winning_card


  # Create poker game of given number of rounds using players array.
  def initialize  no_of_rounds, players, type
    super()
    @players = players
    @no_of_rounds = no_of_rounds
    @results = Hash.new
    @winning_card=String.new
    @players.each do |player|
      @results[player.name] = []
    end
    @game_type=type
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


    # Deck check - use adapter to cate for other decks.
    @adapter=@game_type.new_adapter
    deck_checker=Deck_check.new

    if !deck_checker.check_card_count? @adapter.no_of_cards
      puts "Cannot proceed"
    end

    # deal each player a hand
    @players.each do |player|
        player.set_hand(@deck.deal_hand(1))
    end

    # Each player plays a card
    @players.each do |player|
      @pile.add(player.play)
    end

    @winning_card = @pile.calculate_winner @players
    notify_observers

   winner=@pile.last_winner
    @results[winner] << winning_card.to_string

  end

  def print_opinions opinion
      puts "Players Opinions:"
      @players.each {|p| puts p.says(opinion)}
      puts
  end

  # Print the overall results of the series of rounds
  def print_results
    @results.each do |name, results|
      puts "#{name} won #{@results[name].length} times with #{results}"
    end
    puts
  end
end

=begin
# *****************************************************************************
# Just alternate calls to start Noddy Poker or Normal Poker.
# *****************************************************************************
player1=PoshPlayer.new(ShoutingPlayer.new(Player.new("John")))
player2=PoshPlayer.new(AngryPlayer.new(LispPlayer.new(Player.new("Mary"))))
player3=HappyPlayer.new(ShoutingPlayer.new(Player.new("Luke")))
player4=SexistPlayer.new(HappyPlayer.new(Player.new("Eimear")))

#players = [Player.new("John"), Player.new("Mary"), Player.new("Luke"), Player.new("Eimear"),myplayer]
players = [player1,player2,player3,player4]
#poker_game = Poker.new 6, players, PokerComposition.new

players.each {|x| x.says("my opinion on this game is")}
poker_game = Poker.new 20, players, NoddyComposition.new

# *****************************************************************************
# Rest of the calls are results and observations
# *****************************************************************************

## Must be an easier way to get the most successful card!?
 win_cards=Hash.new

poker_game.add_observer do |x|
  if win_cards.has_key?(x.winning_card.to_string) then
     win_cards[x.winning_card.to_string] +=1
  else
     win_cards[x.winning_card.to_string] =1
  end
 end



poker_game.play

#=begin
occ=[]

win_cards.each do |key, value|
    occ<<value
end

win_cards.sort_by { |k, v| v}.each { |card| if card[1]==occ.max
                                      puts "This card won the most in the game: #{card[0]} - occurrences : #{card[1]}"
                                  end }

poker_game.print_results
#=end

# *****************************************************************************
# *****************************************************************************
=end