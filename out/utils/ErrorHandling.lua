-- Compiled with roblox-ts v1.2.3
local _Debugging = false
local function SetDebugger(state)
	_Debugging = state
end
local function LogToConsole(_param)
	local message = _param.message
	local debug = _param.debug
	if debug and not (_Debugging ~= 0 and _Debugging == _Debugging and _Debugging ~= "" and _Debugging) then
		return nil
	end
	local _value = debug and _Debugging
	if _value ~= 0 and _value == _value and _value ~= "" and _value then
		warn(":: Rovolution Roblox API Debug :: " .. message)
		return nil
	end
	error(":: Rovolution Roblox API :: " .. message)
end
return {
	SetDebugger = SetDebugger,
	LogToConsole = LogToConsole,
}
