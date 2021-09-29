defmodule Grobble.GameServer do
  alias Grobble.Game
  use GenServer

  # Client

  def start_link() do
    GenServer.start_link(__MODULE__, Game.new_game(), name: :game)
  end

  def game(pid) do
    GenServer.call(pid, :game)
  end

  # Server (callbacks)
  @impl true
  def init(game) do
    {:ok, game}
  end

  @impl true
  def handle_call(:game, _from, state) do
    {:reply, state, state}
  end
end
