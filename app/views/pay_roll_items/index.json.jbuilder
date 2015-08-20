json.array!(@pay_roll_items) do |pay_roll_item|
  json.extract! pay_roll_item, :id, :pay_roll_id, :employee_id, :assistances, :salary, :discounts, :bonuses, :total
  json.url pay_roll_item_url(pay_roll_item, format: :json)
end
