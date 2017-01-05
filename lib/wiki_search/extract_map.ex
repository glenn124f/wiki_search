defmodule WikiSearch.ExtractMap do
	def extract_from_body(map) do
		{:ok, body} = map
		get_int_key = fn {key, _value} ->
			case Integer.parse(key) do
				:error -> false
				_ -> key
			end
		end

		{_page_id, extract_article} = 
			get_in(body, ["query"])
			|> get_in(["pages"])
			|> Enum.find(get_int_key)
		
		extract_article |> Map.fetch!("extract")
	end
end