json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :first_name, :last_name, :city, :state, :country, :listing_id
  json.url user_url(user, format: :json)
end
