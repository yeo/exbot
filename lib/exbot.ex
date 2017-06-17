defmodule Exbot do
  import Exbot.Api

  def get_me, do: request("getMe")

  def get_updates(f) do
    request(f, "getUpdates")
  end

  def get_updates do
    request("getUpdates")
  end

  def send_message(m) do
    request("sendMessage", m)
  end
end
