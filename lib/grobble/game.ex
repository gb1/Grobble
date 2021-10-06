defmodule Grobble.Game do
  alias Grobble.Cards
  alias __MODULE__

  defstruct player1_card: [],
            player2_card: [],
            top_card: [],
            deck: [],
            player1_name: "🤓",
            player2_name: "🤠",
            player1_score: 0,
            player2_score: 0,
            game_over: false,
            player1_frozen: false,
            player2_frozen: false

  def new_game do
    [player1_card, player2_card, top_card | deck] = Cards.cards()

    %Game{player1_card: player1_card, player2_card: player2_card, top_card: top_card, deck: deck}
  end

  def guess(game = %Game{:player1_frozen => true}, :player1, _), do: game
  def guess(game = %Game{:player2_frozen => true}, :player2, _), do: game

  def guess(game, player, guess) do
    if guess in game.top_card do
      case player do
        :player1 ->
          deal(%{game | player1_card: game.top_card, player1_score: game.player1_score + 1})

        :player2 ->
          deal(%{game | player2_card: game.top_card, player2_score: game.player2_score + 1})
      end
    else
      case player do
        :player1 ->
          :timer.send_after(5000, self(), :unfreeze_player1)
          %{game | player1_frozen: true}

        :player2 ->
          :timer.send_after(5000, self(), :unfreeze_player2)
          %{game | player2_frozen: true}
      end
    end
  end

  def deal(game) do
    case game.deck do
      [] ->
        %{game | game_over: true}

      [head | tail] ->
        %{game | top_card: head, deck: tail, player1_frozen: false, player2_frozen: false}
    end
  end

  def unfreeze_player(game, :player1), do: %{game | player1_frozen: false}
  def unfreeze_player(game, :player2), do: %{game | player2_frozen: false}
end
