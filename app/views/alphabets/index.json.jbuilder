json.array!(@alphabets) do |alphabet|
  json.extract! alphabet, :id, :machine_id
  json.url alphabet_url(alphabet, format: :json)
end
