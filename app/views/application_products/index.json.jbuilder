json.array!(@application_products) do |application_product|
  json.extract! application_product, :id, :application_item_ids, :name, :description, :quantity_available, :units_of_measure
  json.url application_product_url(application_product, format: :json)
end
