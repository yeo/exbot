defmodule Exbot.Response.Message do
  defstruct([:message_id, :date, :chat, :from, :text])

  def decode(response) do
    %Exbot.Response.Message{
      message_id: response[:message][:message_id],
      date:       response[:message][:date],
      chat:       response[:message][:chat],
      from:       Exbot.Response.User.decode(response[:message][:from]),
      text:       response[:message][:text],
    }
  end
end
