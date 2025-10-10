-- ModuleScript in ReplicatedStorage named "CheckWord"
-- Call by doing require(game.ReplicatedStorage.CheckWord).CheckWord("example")

local module = {}

local HttpService = game:GetService("HttpService")

local API_URL = "https://api.dictionaryapi.dev/api/v2/entries/en/"

function module.CheckWord(word)
	local data = pcall(function() return HttpService:JSONDecode(HttpService:GetAsync(API_URL .. word)) end)
	
	if data and not data["title"] then return true end
	return false
end

return module
