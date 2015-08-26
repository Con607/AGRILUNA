json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :description, :telephone, :celphone, :address, :contact_name, :email, :product_application_buy_ids
  json.url supplier_url(supplier, format: :json)
end
