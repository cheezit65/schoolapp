json.array!(@web_orders) do |web_order|
  json.extract! web_order, :id
  json.url web_order_url(web_order, format: :json)
end
