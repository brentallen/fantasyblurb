json.array!(@picks) do |pick|
  json.extract! pick, :id, :player, :idea
  json.url pick_url(pick, format: :json)
end
