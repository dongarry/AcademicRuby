class SuperReport
  @@counter=0

  attr_accessor  :g_player, :w_play, :w_card

  def initialize    (g_player, w_play, w_card)
    @title = "Results after"
    @game_players=g_player
    @winning_player=w_play
    @winning_card=w_card
  end

  def output_report
    @@counter+=1
    output_start
    output_head
    output_body_start
    output_body
    output_body_end
    output_end
  end

  def output_body
     @result=String.new
        @game_players.each {|player|
          if player.name!=@winning_player
            @result+=player.to_string + "(" + player.get_last_card_played.to_string + ") "
          end}
        #@@counter +=1

          line = "Game #{@@counter} Winning Player : #{@winning_player} won with the #{@winning_card} - beat : #{@result} "
          output_line(line)
  end

end