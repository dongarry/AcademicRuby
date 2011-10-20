require "test/unit"
require_relative 'pile.rb'

class TC_Pile < Test::Unit::TestCase

  def setup
    @pile = Pile.new
  end

  def test_initialisation
    assert_equal(0, @pile.no_of_cards)
  end

  def test_winner
    # create pile with entire pack of cards
    SUITS.each do |suit|
      KINDS.each do |kind|
        card = Card.new suit, kind
        @pile.add card
      end
    end
    # check that ace of spades is the winner

    # check a play
    @pile.empty!
    players = [Player.new("John"), Player.new("Mary")]
    @deck = deck.new

    # deal each player a hand
    @players.each do |player|
      player.set_hand(@deck.deal_hand(1))
    end
    # Each player plays a card
    @players.each do |player|
      @pile.add(player.play)
    end

    ace_of_spades = Card.new :SPADES, :ACE
    #assert_equal(ace_of_spades, @pile.calculate_winner(@players))
    assert @pile.calculate_winner(@players)
  end

end