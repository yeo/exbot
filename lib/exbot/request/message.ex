defmodule Exbot.Request.Message do
  def create(chat, text) do
    [chat_id: chat, text: text]
  end

  [:parse_mode, :disable_notification, :reply_to_message_id] |> Enum.each(fn(name) ->
    def unquote(:"with_#{name}")(m, value) do
      m ++ [{unquote(name), value}]
    end
  end)
end
