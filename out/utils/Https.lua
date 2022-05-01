-- Compiled with roblox-ts v1.2.3
local TS = require(script.Parent.Parent.include.RuntimeLib)
-- I know cringe name, but its important all traffic will come through here
local HttpService = TS.import(script, TS.getModule(script, "@rbxts", "services")).HttpService
local LogToConsole = TS.import(script, script.Parent, "ErrorHandling").LogToConsole
-- This is just a temporary server will change :)
local _baseUrl = "http://server1.rovolution.me:3000/api/v1/roblox-api/"
local HTTP_HANDLER
do
	HTTP_HANDLER = setmetatable({}, {
		__tostring = function()
			return "HTTP_HANDLER"
		end,
	})
	HTTP_HANDLER.__index = HTTP_HANDLER
	function HTTP_HANDLER.new(...)
		local self = setmetatable({}, HTTP_HANDLER)
		return self:constructor(...) or self
	end
	function HTTP_HANDLER:constructor(projectID, apiKey)
		self.projectID = projectID
		self.apiKey = apiKey
	end
	function HTTP_HANDLER:SendRequest(_param)
		local path = _param.path
		local data = _param.data
		-- send object
		local send_object = {
			projectID = self.projectID,
			apiKey = self.apiKey,
			data = data,
		}
		local json_Serialised
		local _exitType, _returns = TS.try(function()
			-- Serialise the JSON
			json_Serialised = HttpService:JSONEncode(send_object)
		end, function()
			-- If it fails, log it
			LogToConsole({
				message = "Failed to serialise JSON",
				debug = true,
			})
			return TS.TRY_RETURN, { false }
		end)
		if _exitType then
			return unpack(_returns)
		end
		-- Ok JSON serialised, now send it
		local response = ""
		local _exitType_1, _returns_1 = TS.try(function()
			-- Send the request
			response = HttpService:PostAsync(_baseUrl .. path, json_Serialised)
		end, function(e)
			-- More logging cause yay
			LogToConsole({
				message = "Failed to Post an Async req",
				debug = true,
			})
			return TS.TRY_RETURN, { false }
		end)
		if _exitType_1 then
			return unpack(_returns_1)
		end
		-- Now decode the response
		local returned_json_Decoded
		local _exitType_2, _returns_2 = TS.try(function()
			-- Serialise the JSON
			returned_json_Decoded = HttpService:JSONDecode(response)
		end, function()
			-- If it fails, log it
			LogToConsole({
				message = "Failed to decode returned JSON",
				debug = true,
			})
			return TS.TRY_RETURN, { false }
		end)
		if _exitType_2 then
			return unpack(_returns_2)
		end
		return returned_json_Decoded
	end
	function HTTP_HANDLER:SendToApi(_param)
		local path = _param.path
		local data = _param.data
		local Result = self:SendRequest({
			path = path,
			data = data,
		})
		if Result == false then
			LogToConsole({
				message = "Failed to send request to API",
				debug = false,
			})
			return false
		end
		return Result
	end
end
return {
	HTTP_HANDLER = HTTP_HANDLER,
}
