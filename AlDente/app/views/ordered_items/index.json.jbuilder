json.array!(@ordered_items) do |ordered_item|
  json.extract! ordered_item, :id, :item_id
  json.url ordered_item_url(ordered_item, format: :json)
end
