require_relative 'hand.rb'
require_relative 'player.rb'

class PlayerDecorator

  attr_reader :name

  # Create a player with the given name.
  def initialize player
    @card_player=player
    @name = player.name
  end

  def get_last_card_played
     @card_player.get_last_card_played
  end

   def set_last_card_played card
     @card_player.set_last_card_played card
   end

  def set_hand hand
    @card_player.set_hand hand
  end

  def play
    @card_player.play
  end

  def to_string
    @card_player.to_string
  end

  def says(opinion)
      @card_player.says(opinion)
  end
end

class ShoutingPlayer < PlayerDecorator

  def says(opinion)
      @card_player.says("#{opinion.upcase} !!!!!")
  end
end

class AngryPlayer < PlayerDecorator

  def says(opinion)
      @card_player.says("#{opinion} aaaaaarrrrrrrrrrrggghhhhhhhh I hate this game!!")
  end
end

class LispPlayer < PlayerDecorator

  def says(opinion)
      @card_player.says(opinion.gsub("s","sh"))
  end
end

class HappyPlayer < PlayerDecorator

  def says(opinion)
      @card_player.says("#{opinion} having a great time")
  end
end

class PoshPlayer < PlayerDecorator

  def says(opinion)
      @card_player.says("#{opinion} this games reminds me of playing horse polo with the Lord Duke of Westminister")
  end
end

class SexistPlayer < PlayerDecorator

  def says(opinion)
      @card_player.says("#{opinion} the girls should be in the kitchen")
  end
end


class TalkativePlayer < PlayerDecorator

  def talks(opinion)
      opinion.each {|t| chat+=t.to_s}
      @card_player.says(chat)
  end
end

class Dec_Player_adapter
  def initialize player
     @card_player=player
  end

  def says(opinion)
      @card_player.talks(chat)
  end
end
