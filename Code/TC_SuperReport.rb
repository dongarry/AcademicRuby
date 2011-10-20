require  'test/unit'
require_relative 'html.rb'
require_relative 'PDF.rb'
require_relative 'player.rb'
require_relative 'deck.rb'


class TC_SuperClass < Test::Unit::TestCase

  def test_initialize
    @players = [Player.new("Gabriel"), Player.new("Don")]
    @win_card="ACE of Hearts"
    @win_name="Gabriel"
    @my_deck = Deck.new
    @players.each do |player|
      player.set_hand(@my_deck.deal_hand(1))
      player.play
    end
  end

  def test_PDF
     @players = [Player.new("Gabriel"), Player.new("Don")]
    @win_card="ACE of Hearts"
    @win_name="Gabriel"
    @my_deck = Deck.new
    @players.each do |player|
      player.set_hand(@my_deck.deal_hand(1))
      player.play
    end

    report = PDF_report.new(@players,@win_name,@win_card)
    report.output_report

  end

  def test_Html
     @players = [Player.new("Gabriel"), Player.new("Don")]
    @win_card="ACE of Hearts"
    @win_name="Don"
    @my_deck = Deck.new
    @players.each do |player|
      player.set_hand(@my_deck.deal_hand(1))
      player.play
    end

    report = Html_report.new(@players,@win_name,@win_card)
    report.output_report

  end



end