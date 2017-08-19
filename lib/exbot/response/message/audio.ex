defmodule Exbot.Response.Message.Audio do
  defstruct([:message_id, :date, :chat, :from, :text])

  def decode(response) do
    Exbot.Response.Message.decode(response)
  end
end
