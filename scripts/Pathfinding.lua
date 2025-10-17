-- Adam Felle
-- ModuleScript in ReplicatedStorage named "Pathfinding"

function main(obj, destination, canJump : boolean?, canClimb : boolean?, agentRadius : number?, agentHeight : number?, waypointSpacing : number?, endConditionFunction : () -> any?)
	local PathfindingService = game:GetService("PathfindingService")

	local nextWaypointIndex
	local reachedConnection
	local blockedConnection

	local path = PathfindingService:CreatePath({
		AgentRadius = agentRadius or 2,
		AgentHeight = agentHeight or 5,
		AgentCanJump = canJump or true,
		AgentCanClimb = canClimb or true,
		WaypointSpacing = waypointSpacing or 10
	})

	local success, errorMessage = pcall(function()
		path:ComputeAsync(obj.PrimaryPart.Position, destination.Position)
	end)

	if not success or path.Status ~= Enum.PathStatus.Success then return end

	local waypoints = path:GetWaypoints()

	if #waypoints < 2 then return end

	blockedConnection = path.Blocked:Connect(function(blockedWaypointIndex)
		if not (blockedWaypointIndex >= nextWaypointIndex) then return end
		blockedConnection:Disconnect()
		main(obj, destination, canJump or nil, canClimb or nil, agentRadius or nil, agentHeight or nil, waypointSpacing or nil, endConditionFunction or nil)
	end)

	if not reachedConnection then
		reachedConnection = obj.Humanoid.MoveToFinished:Connect(function(reached)
			if reached and nextWaypointIndex < #waypoints then
				nextWaypointIndex += 1
				if endConditionFunction and endConditionFunction(destination) then 
					reachedConnection:Disconnect()
					blockedConnection:Disconnect()
					nextWaypointIndex = 2
					return
				end
				
				if waypoints[nextWaypointIndex] then
					obj.Humanoid:MoveTo(waypoints[nextWaypointIndex].Position)
				end
			else
				reachedConnection:Disconnect()
				blockedConnection:Disconnect()
			end
		end)
	end

	nextWaypointIndex = 2
	
	if waypoints[nextWaypointIndex] then
		obj.Humanoid:MoveTo(waypoints[nextWaypointIndex].Position)
	end
end

return main
