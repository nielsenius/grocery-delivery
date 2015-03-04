json.array!(@items) do |item|
  json.extract! item, :id, :name, :amount, :grocery_list_id
  json.url item_url(item, format: :json)
end
