json.array!(@reviews) do |review|
  json.extract! review, :id, :trip_id, :user_id, :review, :place_id
  json.url review_url(review, format: :json)
end
