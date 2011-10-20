
class Report
  @@counter=0

  def generate_report(game_players,winning_player,winning_card)
    @result=String.new
    game_players.each {|player|
      if player.name!=winning_player
        @result+=player.to_string + "(" + player.last_card_played.to_string + ") "
      end
    }
    @@counter +=1
    puts "Game #{@@counter} Winning Player : #{winning_player} won with the #{winning_card} - beat : #{@result} "
  end


end