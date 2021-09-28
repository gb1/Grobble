defmodule Grobble.Game do
  alias Grobble.Cards
  alias __MODULE__
  defstruct player1_card: [], player2_card: [], top_card: [], deck: []

  def new_game do
    [player1_card, player2_card, top_card | deck] = Cards.cards()

    %Game{player1_card: player1_card, player2_card: player2_card, top_card: top_card, deck: deck}
  end
end
