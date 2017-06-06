json.array!(@payments) do |payment|
  json.extract! payment, :id, :reservation_id_id, :total_amount
  json.url payment_url(payment, format: :json)
end
