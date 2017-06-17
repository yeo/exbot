defmodule Exbot.Api do
  alias Exbot.Response

  @base_url "https://api.telegram.org/bot"
  def url(path) do
    case Application.fetch_env(:exbot, "token") do
      {:ok, token } -> @base_url <> token <> "/" <> path
    end
  end

	defp build_payload(params) do
    params = params
			|> Enum.filter_map(fn {_, v} -> v end, fn {k, v} -> {k, to_string(v)} end)
  	{:form, params}
	end

  def request(method, payload \\ []) do
    method
    |> url
    |> HTTPoison.post(build_payload(payload), [], [])
    |> response(method)
  end

  def response(raw_response, method) do
    with({:ok, %HTTPoison.Response{body: body}} <- raw_response,
        %{result: result} <- Poison.decode!(body, keys: :atoms),
        do: decode(result, method))
  end

  defp decode(body, method) do
    case method do
      "getMe" -> Response.User.decode(body)
      "sendMessage" -> Response.Message.decode(body)
      "getUpdates" -> Response.Update.decode(body)
    end
  end
end
