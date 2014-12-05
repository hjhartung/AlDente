json.order do
	json.id @order.id
	json.waiter_name @order.waiter_name
	json.ipad_id @order.ipad_id
	json.party_size @order.party_size

	json.ordered_items @order.ordered_items do |ordered_item|
		json.item_id ordered_item.item_id
		json.comments ordered_item.comments

		json.item do 
			json.id ordered_item.item
			json.name ordered_item.item.name
			json.cost ordered_item.item.cost
			json.category ordered_item.item.category
		end
	end
end