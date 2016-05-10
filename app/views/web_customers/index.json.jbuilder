json.array!(@web_customers) do |web_customer|
  json.extract! web_customer, :id, :firstName, :lastName, :phone, :addressLine1, :addressLine2, :city, :state, :postalcode
  json.url web_customer_url(web_customer, format: :json)
end
