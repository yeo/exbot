defmodule Exbot.Response.Update do

  def decode(response) do
    Enum.map(response, &(Exbot.Response.Message.decode(&1)))
  end
end
