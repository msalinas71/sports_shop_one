json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :user_last_name, :email, :password_digest
  json.url user_url(user, format: :json)
end
