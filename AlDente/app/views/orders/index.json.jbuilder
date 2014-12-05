json.array!(@orders) do |order|
  json.extract! order, :id, :waiter_name, :ipad_id, :restaurant_id
  json.url order_url(order, format: :json)
end
