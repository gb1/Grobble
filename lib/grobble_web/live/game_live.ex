defmodule GrobbleWeb.GameLive do
  use GrobbleWeb, :live_view
  alias Grobble.Game

  @impl true
  def mount(_params, _session, socket) do
    game = Game.new_game()

    socket =
      assign(socket,
        player1_card: game.player1_card,
        top_card: game.top_card,
        player2_card: game.player2_card
      )

    {:ok, socket}
  end

  @impl true
  def handle_event("click", unsigned_params, socket) do
    IO.inspect(unsigned_params)
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""

    <div class="game">


    <div class="card">
    <h2>Jesse</h2>
    <%= for pic <- @player1_card do %>
    <button phx-click="click" phx-value-emoji={ pic } class="emoji"><%= pic %></button>
    <% end %>
    </div>

    <div class="card">
    <%= for pic <- @top_card do %>
    <button phx-click="click" class="emoji"><%= pic %></button>
    <% end %>
    </div>

    <div class="card">
    <h2>Daddy</h2>
    <%= for pic <- @player2_card do %>
    <button phx-click="click" class="emoji"><%= pic %></button>
    <% end %>
    </div>

    </div>

    """
  end
end
