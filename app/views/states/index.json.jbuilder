json.array!(@states) do |state|
  json.extract! state, :id, :machine_id, :name, :starts, :accepts
  json.url state_url(state, format: :json)
end
