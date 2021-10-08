defmodule GrobbleWeb.Card do
  use Phoenix.Component
  alias GrobbleWeb.Emoji
  require IEx

  def player_card(assigns) do
    class =
      cond do
        assigns.frozen -> "frozen_card"
        !assigns.frozen -> "card"
      end

    ~H"""
    <div class={class}>
    <%= for pic <- @card do %>
      <Emoji.emoji pic={pic} click_action={@action}/>
    <% end %>
    </div>
    """
  end

  def top_card(assigns) do
    ~H"""
    <div class={@newcard_animation}>
    <%= for pic <- @card do %>
      <Emoji.dealer_emoji pic={pic}/>
    <% end %>
    </div>
    """
  end
end
