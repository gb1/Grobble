defmodule GrobbleWeb.App do
  use Phoenix.Component
  alias GrobbleWeb.Card

  def new_game(assigns) do
    ~H"""
    <div class="game p-5">
      <div class="flex justify-between p-5 px-16 mb-32 opacity-60 shadow-xl rounded-2xl">
        <h4 class="text-5xl text-gray-600 opacity-100"><%= @game.player1_name %> <span class="mx-10"><%= @game.player1_score %></span></h4>
        <h4 class="text-3xl text-gray-600">Cards: <%= @game.deck |> length %></h4>
        <h4 class="text-5xl text-gray-600"><%= @game.player2_name %> <span class="mx-10"><%= @game.player2_score %></span></h4>
      </div>

      <div class="cards">
        <Card.player_card card={@game.player1_card} frozen={@game.player1_frozen}  action="player1-guess" />
        <Card.top_card card={@game.top_card} action="boop" newcard_animation={@newcard_animation}/>
        <Card.player_card card={@game.player2_card} frozen={@game.player2_frozen} action="player2-guess" />
      </div>
    </div>
    """
  end
end
