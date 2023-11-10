local Stack = {}

local Schema = {}
local Metatable = {__index = Schema}

function Stack.new()
	local _Stack = setmetatable({}, Metatable)
	
	return _Stack
end

function Schema:Push(Value)
	self[#self+1] = Value
end

function Schema:Pop(): any
	if #self ~= 0 then
		local Value = self[#self]
		self[#self] = nil
		return Value
	else
		return nil
	end
end

return Stack
