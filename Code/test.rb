
require_relative 'card.rb'
def test_find_jack_of_hearts
      found = 0
      jack_of_hearts = Card.new(:HEARTS, :FOUR)
      while found <160 do
        card = Card.new(SUITS[rand(4)], KINDS[rand(13)])
        puts "#{card.to_string}"
        puts card == jack_of_hearts
        puts card.to_string == jack_of_hearts.to_string


        if card == jack_of_hearts
          puts "got it!"
          found=170
        elsif card.eql?(jack_of_hearts)
          puts "got it3!"
          found=170
        end
        found+=1
      end
end


test_find_jack_of_hearts