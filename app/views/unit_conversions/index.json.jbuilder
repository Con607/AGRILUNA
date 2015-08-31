json.array!(@unit_conversions) do |unit_conversion|
  json.extract! unit_conversion, :id, :unit_type_id, :convert_to, :value
  json.url unit_conversion_url(unit_conversion, format: :json)
end
