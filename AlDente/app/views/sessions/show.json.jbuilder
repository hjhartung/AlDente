json.session do
	json.id @session.id
	json.waiter_name @session.waiter_name
	json.ipad_id @session.ipad_id
	json.party_size @session.party_size

	json.ordered_items @session.ordered_items do |ordered_item|
		json.item_id ordered_item.item_id
		json.comments ordered_item.comments

		json.item do 
			json.id ordered_item.item
			json.name ordered_item.item.name
			json.cost number_to_currency ordered_item.item.cost
			json.category ordered_item.item.category
		end
	end
end