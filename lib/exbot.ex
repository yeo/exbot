defmodule Exbot do
  import Exbot.Api

  def get_me, do: request("getMe")

  @doc """
  Get update

  alias Exbot.Request.Update
  Exbot.get_update(&(&1 |> Update.with_limit(100)))
  """
  def get_updates(f \\ nil) do
    payload = [limit: 100]
    case f do
      nil -> request("getUpdates", [])
      _ -> request("getUpdates", f.([]))
    end
  end

  def send_message(m) do
    request("sendMessage", m)
  end
end
