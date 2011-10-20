require 'test/unit'
require_relative 'hand.rb'

class TC_Hand < Test::Unit::TestCase

  def test_to_string
    @my_hand = Hand.new
    c = Card.new :HEARTS, :FOUR
    @my_hand.add c
    puts @my_hand.to_string
    assert_equal(1, @my_hand.no_of_cards)
    assert_equal("FOUR of HEARTS ", @my_hand.to_string)
  end

end