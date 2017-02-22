json.array!(@transitions) do |transition|
  json.extract! transition, :id, :in_state, :out_state, :in_char, :out_char, :direction
  json.url transition_url(transition, format: :json)
end
