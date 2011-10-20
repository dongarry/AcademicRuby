
require  'test/unit'
require_relative 'deck.rb'
require_relative 'hand.rb'

class TC_Deck < Test::Unit::TestCase

  def test_initialize
    my_deck = Deck.new 
    ace_of_spades = Card.new :SPADES, :ACE
    jack_of_hearts = Card.new :HEARTS, :JACK
    two_of_diamonds = Card.new :DIAMONDS, :TWO
    one_of_clubs = Card.new :CLUBS, :ONE
    assert(my_deck.has_card?(ace_of_spades))
    assert(my_deck.has_card?(jack_of_hearts))
    assert(my_deck.has_card?(two_of_diamonds))
    assert_equal(my_deck.has_card?(one_of_clubs), false)
  end

  def test_add_and_remove
    my_deck = Deck.new
    ace_of_spades = Card.new :SPADES, :ACE
    assert(my_deck.has_card?(ace_of_spades))
    my_deck.remove ace_of_spades
    assert_equal(my_deck.has_card?(ace_of_spades), false)
    my_deck.add ace_of_spades
    assert(my_deck.has_card?(ace_of_spades))
  end

  def test_find_3_of_a_kind
    my_deck = Deck.new
    i=0
    searching = true
    while searching
      i+=1
      card1 = my_deck.pick_random
      card2 = my_deck.pick_random
      card3 = my_deck.pick_random
      if card1.kind==card2.kind && card2.kind==card3.kind
#       puts "Found three #{card1.kind}S after #{i} attempts"
#       puts card1.to_string, card2.to_string, card3.to_string
        searching = false
      end
      my_deck.add card1
      my_deck.add card2
      my_deck.add card3
      if !searching
        assert true # 3 of a kind have been found
        return
      end
    end
  end

  def test_deal_hand
    no_of_cards = 26
    my_deck = Deck.new
    my_hand = my_deck.deal_hand no_of_cards
    assert_equal(no_of_cards, my_hand.no_of_cards)
    # check that none of the cards in the hand are still in the deck
    my_hand.each{|card| assert(!my_deck.has_card?(card))}
  end

end
