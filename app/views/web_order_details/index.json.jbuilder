json.array!(@web_order_details) do |web_order_detail|
  json.extract! web_order_detail, :id
  json.url web_order_detail_url(web_order_detail, format: :json)
end
