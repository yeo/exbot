defmodule Exbot.Response.User do
  defstruct id: 0, username: "", first_name: "", last_name: ""

  def decode(response) do
    %Exbot.Response.User{
      id: response[:id],
      username: response[:username],
      first_name: response[:firstname],
      last_name: response[:last_name],
    }
  end
end
