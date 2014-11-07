json.array!(@sessions) do |session|
  json.extract! session, :id, :waiter_name, :ipad_id, :restaurant_id
  json.url session_url(session, format: :json)
end
