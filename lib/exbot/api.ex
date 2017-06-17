defmodule Exbot.Api do
  @base_url "https://api.telegram.org/bot"
  def url(path, token \\ nil) do
		case token do
			nil ->
				case Application.fetch_env(:exbot, "token") do
					{:ok, token } -> @base_url <> token <> "/" <> path
				end
			_ -> @base_url <> token <> "/" <> path
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
    result = with({:ok, %HTTPoison.Response{body: body}} <- raw_response,
									%{result: result} <- Poison.decode!(body, keys: :atoms),
									do: result)
		result
  end
end
