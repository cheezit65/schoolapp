json.array!(@lugs) do |lug|
  json.extract! lug, :id
  json.url lug_url(lug, format: :json)
end
