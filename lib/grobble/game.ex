defmodule Grobble.Game do
  alias Grobble.Cards
  alias __MODULE__

  defstruct player1_card: [],
            player2_card: [],
            top_card: [],
            deck: [],
            player1_score: 0,
            player2_score: 0,
            game_over: false

  def new_game do
    [player1_card, player2_card, top_card | deck] = Cards.cards()

    %Game{player1_card: player1_card, player2_card: player2_card, top_card: top_card, deck: deck}
  end

  def guess(game, player, guess) do
    if guess in game.top_card do
      case player do
        :player1 ->
          deal(%{game | player1_card: game.top_card, player1_score: game.player1_score + 1})

        :player2 ->
          deal(%{game | player2_card: game.top_card, player2_score: game.player2_score + 1})
      end
    else
      game
    end
  end

  def deal(game) do
    case game.deck do
      [] -> %{game | game_over: true}
      [head | tail] -> %{game | top_card: head, deck: tail}
    end
  end
end
