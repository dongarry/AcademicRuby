require_relative 'deck_adapter.rb'

class PokerComposition
  def new_pile
    Pile.new
  end

  def new_deck
    Deck.new
  end

   def new_adapter
    Deck.new
  end
end

class NoddyComposition
  def new_pile
    NoddyPile.new
  end

  def new_deck
    NoddyDeck.new
  end

   def new_adapter
    Deck_adapter.new(NoddyDeck.new)
  end
end