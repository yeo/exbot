defmodule Exbot.Response.Update do
  defstruct [:update_id, :message]

  def decode(response) do
    Enum.map(response, &(decode_record(&1)))
  end

	def decode_record(record) do
    %Exbot.Response.Update{
			update_id: record[:update_id],
			message: Exbot.Response.Message.decode(record[:message]),
		}
	end
end
