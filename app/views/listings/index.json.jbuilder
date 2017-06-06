json.array!(@listings) do |listing|
  json.extract! listing, :id, :user_id, :description, :accomodates_no_persons, :address, :city, :price, :photo_url, :smooking, :pet_friendly, :apartment, :house, :house_type, :start_date, :end_date
  json.url listing_url(listing, format: :json)
end
