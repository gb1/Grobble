defmodule GrobbleWeb.GameLive do
  use GrobbleWeb, :live_view
  alias Grobble.Game
  alias GrobbleWeb.App

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("MOUNT!")

    if connected?(socket) do
      game = Game.new_game()
      {:ok, assign(socket, game: game, newcard_animation: "animate-new-card1")}
    else
      {:ok, socket}
    end
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
  def handle_info(:new_round, socket) do
    IO.puts("BOOP")

    socket =
      case socket.assigns.newcard_animation do
        "animate-new-card1" ->
          assign(socket, newcard_animation: "animate-new-card2")

        "animate-new-card2" ->
          assign(socket, newcard_animation: "animate-new-card1")
      end

    IO.inspect(socket.assigns.newcard_animation)

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    cond do
      Map.has_key?(assigns, :game) ->
        game = assigns.game
        player1 = MapSet.new(game.player1_card)
        top = MapSet.new(game.top_card)

        answer =
          MapSet.intersection(player1, top)
          |> MapSet.to_list()
          |> hd()

        ~H"""

        <h1 class="text-6xl"><%= answer%></h1>

        <App.new_game game={@game} newcard_animation={@newcard_animation}/>
        """

      true ->
        ~H"""
        """
    end
  end
end
