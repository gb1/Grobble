defmodule GrobbleWeb.Emoji do
  use Phoenix.Component

  def size, do: Enum.random(["size1", "size2", "size3", "size4", "size5"])

  def emoji(assigns) do
    ~H"""
    <button phx-click={@click_action} phx-value-emoji={ @pic } class={size()}><%= @pic %></button>
    """
  end

  def dealer_emoji(assigns) do
    ~H"""
    <button phx-value-emoji={ @pic } class={size()}><%= @pic %></button>
    """
  end
end
