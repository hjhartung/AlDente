json.array!(@users) do |user|
  json.extract! user, :id, :restaurant_id, :role, :active, :password_digest
  json.url user_url(user, format: :json)
end
