-- Compiled with roblox-ts v1.2.3
local TS = require(script.include.RuntimeLib)
-- Cause of the way we are handling state a Class based approach seems to be the best way to go.
local _ErrorHandling = TS.import(script, script, "utils", "ErrorHandling")
local LogToConsole = _ErrorHandling.LogToConsole
local SetDebugger = _ErrorHandling.SetDebugger
local HTTP_HANDLER = TS.import(script, script, "utils", "Https").HTTP_HANDLER
SetDebugger(true)
local Rovolution_API
do
	local super = HTTP_HANDLER
	Rovolution_API = setmetatable({}, {
		__tostring = function()
			return "Rovolution_API"
		end,
		__index = super,
	})
	Rovolution_API.__index = Rovolution_API
	function Rovolution_API.new(...)
		local self = setmetatable({}, Rovolution_API)
		return self:constructor(...) or self
	end
	function Rovolution_API:constructor(projectID, apiKey)
		super.constructor(self, projectID, apiKey)
		self:VerifyKey()
	end
	function Rovolution_API:VerifyKey()
		if self.apiKey == "" then
			LogToConsole({
				message = "API Key is not given!",
			})
		end
		if self.projectID == "" then
			LogToConsole({
				message = "Project Key is not given!",
			})
		end
		-- No data needed
		local test = self:SendToApi({
			path = "checkKey",
			data = {},
		})
	end
	function Rovolution_API:ExileUser(groupID, userID)
		return self:SendToApi({
			path = "exileUser",
			data = {
				groupID = groupID,
				userID = userID,
			},
		})
	end
	function Rovolution_API:SetRank(groupID, userID, rank)
		return self:SendToApi({
			path = "setRank",
			data = {
				groupID = groupID,
				userID = userID,
				rank = rank,
			},
		})
	end
	function Rovolution_API:PromoteUser(groupID, userID)
		return self:SendToApi({
			path = "promoteUser",
			data = {
				groupID = groupID,
				userID = userID,
			},
		})
	end
	function Rovolution_API:DemoteUser(groupID, userID)
		return self:SendToApi({
			path = "demoteUser",
			data = {
				groupID = groupID,
				userID = userID,
			},
		})
	end
	function Rovolution_API:AcceptJoinRequest(groupID, userID)
		return self:SendToApi({
			path = "acceptJoinRequest",
			data = {
				groupID = groupID,
				userID = userID,
			},
		})
	end
	function Rovolution_API:RejectJoinRequest(groupID, userID)
		return self:SendToApi({
			path = "rejectJoinRequest",
			data = {
				groupID = groupID,
				userID = userID,
			},
		})
	end
end
return {
	default = Rovolution_API,
}
