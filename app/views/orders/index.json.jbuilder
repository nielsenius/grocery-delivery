json.array!(@orders) do |order|
  json.extract! order, :id, :placed_on, :tip, :notes, :buyer_id, :shopper_id, :grocery_list_id
  json.url order_url(order, format: :json)
end
