json.array!(@item_splits) do |item_split|
  json.extract! item_split, :id, :ordered_items_id, :customer_id, :percentage, :details
  json.url item_split_url(item_split, format: :json)
end
