defmodule GrobbleWeb.GameLive do
  use GrobbleWeb, :live_view
  alias Grobble.Game
  alias GrobbleWeb.Card

  @impl true
  def mount(_params, _session, socket) do
    game = Game.new_game()

    socket = assign(socket, game: game)

    {:ok, socket}
  end

  @impl true
  def handle_event("player1-guess", %{"emoji" => guess}, socket) do
    {:noreply, assign(socket, game: Game.guess(socket.assigns.game, :player1, guess))}
  end

  @impl true
  def handle_event("player2-guess", %{"emoji" => guess}, socket) do
    {:noreply, assign(socket, game: Game.guess(socket.assigns.game, :player2, guess))}
  end

  @impl true
  def handle_info(:unfreeze_player1, socket) do
    {:noreply, assign(socket, game: Game.unfreeze_player(socket.assigns.game, :player1))}
  end

  @impl true
  def handle_info(:unfreeze_player2, socket) do
    {:noreply, assign(socket, game: Game.unfreeze_player(socket.assigns.game, :player2))}
  end

  @impl true
  def render(assigns) do
    ~H"""

    <div class="game p-5">
      <div class="flex justify-between p-5 px-16 mb-32 opacity-60 shadow-xl rounded-2xl">
        <h4 class="text-5xl text-gray-600"><%= @game.player1_name %> <span class="mx-10"><%= @game.player1_score %></span></h4>
        <h4 class="text-3xl text-gray-600">Cards: <%= @game.deck |> length %></h4>
        <h4 class="text-5xl text-gray-600"><%= @game.player2_name %> <span class="mx-10"><%= @game.player2_score %></span></h4>
      </div>

      <div class="cards">
        <Card.player_card card={@game.player1_card} frozen={@game.player1_frozen}  action="player1-guess" />
        <Card.top_card card={@game.top_card} action="boop"/>
        <Card.player_card card={@game.player2_card} frozen={@game.player2_frozen} action="player2-guess" />
      </div>
    </div>

    """
  end
end
