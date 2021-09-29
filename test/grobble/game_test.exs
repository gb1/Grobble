defmodule Grobble.GameTest do
  use ExUnit.Case, async: true
  alias Grobble.Game

  test "create a game in a good initial state" do
    game = Game.new_game()
    assert game.player1_score === 0
    assert game.player2_score === 0
    assert length(game.deck) === 54
    assert length(game.player1_card) === 8
    assert length(game.player2_card) === 8
  end

  test "a game is over when there are no cards left to deal" do
    init_game = %Game{
      player1_card: ["a", "b", "c"],
      player2_card: ["a", "d", "e"],
      top_card: ["b", "d", "f"],
      deck: []
    }

    game = Game.deal(init_game)
    assert game.game_over === true
  end

  test "deal a new card" do
    init_game = %Game{
      player1_card: ["a", "b", "c"],
      player2_card: ["a", "d", "e"],
      top_card: ["b", "d", "f"],
      deck: [["l", "o", "l"]]
    }

    game = Game.deal(init_game)
    assert game.game_over === false
    assert game.top_card === ["l", "o", "l"]
    assert game.deck === []
  end

  test "make a correct guess and check the result" do
    init_game = %Game{
      player1_card: ["a", "b", "c"],
      player2_card: ["a", "d", "e"],
      top_card: ["b", "d", "f"],
      deck: [["a", "d", "f"]]
    }

    game = Game.guess(init_game, :player1, "b")
    assert game.player1_score === 1
    assert game.player1_card === init_game.top_card
    assert game.top_card === ["a", "d", "f"]
    assert game.deck === []

    game2 = Game.guess(game, :player1, "d")
    assert game2.player1_score === 2
    assert game2.player1_card === game.top_card
    assert game.deck === []
  end
end
