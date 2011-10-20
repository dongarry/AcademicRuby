class Deck_adapter
  def initialize deck
    @deck = deck
  end

  def no_of_cards
    @deck.no_of_cards+40
  end

end
