json.array!(@chars) do |char|
  json.extract! char, :id, :alphabet_id, :char
  json.url char_url(char, format: :json)
end
