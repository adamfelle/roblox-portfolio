-- Adam Felle
-- ModuleScript named "GetChildrenOfType" in ReplicatedStorage
-- Gets all children of a certain instance type from am object.
-- Uses GetDescendants but you can change it to GetChildren if needed.
-- require(game.ReplicatedStorage.GetChildrenOfType).getChildrenOfType(path.to.object, "BasePart")

local module = {}

function module.getChildrenOfType(parent, objType)
	local arr = {}
	
	for _,child in pairs(parent:GetDescendants()) do
		if not child:IsA(objType) then continue end
		table.insert(arr, child)
	end
	
	return arr
end

return module
