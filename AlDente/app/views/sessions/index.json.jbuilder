json.array!(@sessions) do |session|
  json.extract! session, :id, :waiter_name, :ipadID, :restaurant_id, :user_id
  json.url session_url(session, format: :json)
end
