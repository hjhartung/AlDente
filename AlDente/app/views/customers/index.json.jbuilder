json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :paid, :session_id, :tip_percentage
  json.url customer_url(customer, format: :json)
end
