defmodule GrobbleWeb.GameLive do
  use GrobbleWeb, :live_view
  alias Grobble.Game

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
  def render(assigns) do
    ~H"""

    <div class="game">
    <div class="card">

    <%= for pic <- @game.player1_card do %>
    <button phx-click="player1-guess" phx-value-emoji={ pic } class="emoji"><%= pic %></button>
    <% end %>
    <h4>Jesse: <%= @game.player1_score %></h4>
    </div>

    <div class="card">
    <%= for pic <- @game.top_card do %>
    <button class="emoji"><%= pic %></button>
    <% end %>
    </div>

    <div class="card">

    <%= for pic <- @game.player2_card do %>
    <button phx-click="player2-guess" phx-value-emoji={ pic } class="emoji"><%= pic %></button>
    <% end %>
    <h4>Daddy: <%= @game.player2_score %></h4>
    </div>


    </div>

    """
  end
end
