defmodule Exbot.Request.Update do
  [:offset, :limit, :timeout] |> Enum.each(fn(name) ->
    def unquote(:"with_#{name}")(m \\ [], value) do
      m ++ [{unquote(name), value}]
    end
  end)
end
