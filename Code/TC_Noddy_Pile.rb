require "test/unit"
require_relative 'noddy_pile.rb'
require_relative 'player.rb'

class TC_Pile < Test::Unit::TestCase

  def setup
    @pile = NoddyPile.new
  end

  def test_initialisation
    assert_equal(0, @pile.no_of_cards)
  end

  def test_winner
    # create pile with entire pack of cards
    Colours.each do |colour|
        card = NoddyCard.new colour
        @pile.add card
    end

    assert_equal(@pile.no_of_cards,12,"Correct amount of cards")

    # check a play
    @pile.empty!
    players = [Player.new("John"), Player.new("Mary")]
    @deck = noddy_deck.new
    # deal each player a hand
    @players.each do |player|
      player.set_hand(@deck.deal_hand(1))
    end
    # Each player plays a card
    @players.each do |player|
      @pile.add(player.play)
    end

    gold = Card.new :GOLD
    assert_equal(gold, @pile.calculate_winner (players))
  end

end