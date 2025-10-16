local module = {}

function module.ListMerger(lists)
	local mergedList = {}
	
	for _, list in lists do
		for _, obj in list do
			table.insert(mergedList, obj)
		end
	end
	
	return mergedList
end

return module
