json.array!(@fertigations) do |fertigation|
  json.extract! fertigation, :id, :greenhouse_id, :fertigation_datetime, :tank, :fertigation_item_ids, :total_cost
  json.url fertigation_url(fertigation, format: :json)
end
