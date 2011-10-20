
require 'test/unit'
require_relative 'card.rb'

class TC_Card < Test::Unit::TestCase

  def test_initialize
    my_card = Card.new :SPADES, :TWO
    assert_equal(my_card.suit, :SPADES)
    assert_equal(my_card.kind, :TWO)

    my_card = Card.new :HEARTS, :ACE
    assert_equal(my_card.suit, :HEARTS)
    assert_equal(my_card.kind, :ACE)
  end

  def test_to_string
    my_card = Card.new :HEARTS, :TEN
    str = my_card.to_string
    assert_equal(str, "#{my_card.kind} of #{my_card.suit}")
  end

  def test_ranks
    two_of_clubs = Card.new :CLUBS, :TWO
    three_of_clubs = Card.new :CLUBS, :THREE
    three_of_diamonds = Card.new :DIAMONDS, :THREE
    ace_of_spades = Card.new :SPADES, :ACE
    jack_of_hearts = Card.new :HEARTS, :JACK
    jack_of_spades = Card.new :SPADES, :JACK
    assert jack_of_hearts > three_of_diamonds
    assert jack_of_hearts == jack_of_hearts
    assert jack_of_spades > jack_of_hearts
    assert three_of_diamonds > three_of_clubs
    assert three_of_clubs < three_of_diamonds
    # test two_of_clubs is worst, ace_of_spades is best
    500.times do
      random_card = Card.new(SUITS[rand(SUITS.length)], KINDS[rand(KINDS.length)])
      assert two_of_clubs <= random_card
      assert random_card >= two_of_clubs
      assert ace_of_spades >= random_card
      assert random_card <= ace_of_spades
    end
  end

  def test_find_jack_of_hearts
      found = false
      jack_of_hearts = Card.new(:HEARTS, :JACK)
      while !found do
        card = Card.new(SUITS[rand(4)], KINDS[rand(13)])
        if card.to_string == jack_of_hearts.to_string
          found=true
        end
      end
      assert found
  end
end

