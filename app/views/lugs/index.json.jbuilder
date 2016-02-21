json.array!(@lugs) do |lug|
  json.extract! lug, :id, :title, :post
  json.url lug_url(lug, format: :json)
end
