defmodule Exbot.Response.Message do
  defstruct([:message_id, :date, :chat, :from, :text])

  def decode(response) do
    m = %Exbot.Response.Message{
      message_id: response[:message_id],
      date:       response[:date],
      chat:       response[:chat],
      from:       Exbot.Response.User.decode(response[:from]),
      text:       response[:text],
    }

    
  end
end
