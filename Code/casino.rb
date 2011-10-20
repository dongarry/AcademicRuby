require_relative 'player.rb'
require_relative 'poker.rb'
require_relative 'casino_manager.rb'
require_relative 'chain_of_resp'

class Casino
  @@counter=0


   def initialize no_poker_games_in_a_match,no_of_matches,game_type
      @no_poker=no_poker_games_in_a_match
      @no_of_matches =no_of_matches
      @type=game_type
   end

   def entry_check
     #Lets check all players have passed house admission rules
       admin_rules = WebManager.new(Front_door_bouncer.new(Legal_secretary.new(Casino_door_man.new(Casino_cashier.new))))
       admin_rules.entry_check
   end

   def start_em_up
     @no_of_matches.times do
       @@counter+=1
       #players = [Player.new("John"), Player.new("Mary"), Player.new("Luke"), Player.new("Eimear")]
       player1=PoshPlayer.new(ShoutingPlayer.new(Player.new("John")))
       player2=PoshPlayer.new(AngryPlayer.new(LispPlayer.new(Player.new("Mary"))))
       player3=HappyPlayer.new(ShoutingPlayer.new(Player.new("Luke")))
       player4=SexistPlayer.new(HappyPlayer.new(Player.new("Eimear")))


       players=[player1,player2,player3,player4]

       poker_game = Poker.new @no_poker, players, @type

       win_cards=Hash.new
       poker_game.add_observer do |x|
         if win_cards.has_key?(x.winning_card.to_string) then
            win_cards[x.winning_card.to_string] +=1
         else
            win_cards[x.winning_card.to_string] =1
         end
        end

       poker_game.play

       occ=[]

       win_cards.each do |key, value|
           occ<<value
       end

       puts "Here are the most occurring winning cards from game #{@@counter} :"
       win_cards.sort_by { |k, v| v}.each { |card| if card[1]==occ.max then puts puts "#{card[0]} - occurrences : #{card[1]}" end }

       poker_game.print_results

       poker_game.print_opinions "my opinion is"
       #poker_game.print_opinions ["my","array","opinion","is"]
     end

    end
end

#las_vegas_noddy = Casino.new 100,1, NoddyComposition.new
#las_vegas_noddy.entry_check
#las_vegas_noddy.start_em_up

las_vegas = Casino.new 100,1, PokerComposition.new
las_vegas.entry_check
las_vegas.start_em_up