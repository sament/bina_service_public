defmodule BinaServiceWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  #For now, simply handle joining room. Later handle messages by topics by handle_in
  def handle_in(slot_address, %{"body" => body}, socket) do
    broadcast!(socket, slot_address, %{body: body})
    #Sends message to that slot subscribers
    {:noreply, socket}
  end

end
