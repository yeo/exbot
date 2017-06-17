defmodule Exbot
  @moduledoc """
  Sponsor by https://noty.im

  Provides access to Telegram Bot API.
  """

  def get_me, do: request("getMe")
  def send_message(m) do: request("sendMessage", m)
  def send_message(m, f) do: request("sendMessage", m |> f.)
  def get_updates(f) do: request("getUpdates", m |> f.)
end
