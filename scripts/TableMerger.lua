-- Adam Felle
-- ModuleScript named "TableMerger" in ReplicatedStorage
-- Merges tables together as that is not default table behavior.
-- require(game.ReplicatedStorage.TableMerger).MergeTables({{1,2,3}, {4,5,6})

local module = {}

function module.MergeTables(lists)
	local mergedList = {}
	
	for _, list in lists do
		for _, obj in list do
			table.insert(mergedList, obj)
		end
	end
	
	return mergedList
end

return module
