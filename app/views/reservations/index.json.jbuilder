json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :listing_id, :user_id, :start_date, :end_date, :amount
  json.url reservation_url(reservation, format: :json)
end
