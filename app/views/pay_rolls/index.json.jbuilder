json.array!(@pay_rolls) do |pay_roll|
  json.extract! pay_roll, :id, :pay_roll_item_id, :start_date, :end_date, :subtotal, :discount, :bonus, :total
  json.url pay_roll_url(pay_roll, format: :json)
end
