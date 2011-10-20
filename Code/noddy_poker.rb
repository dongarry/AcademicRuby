require_relative 'game.rb'

class Noddy_poker < Game
    def play_this
      puts "Playing Noddy Poker"
    end

end

my_game=Noddy_poker.new 2,"players","noddy"
my_game.play