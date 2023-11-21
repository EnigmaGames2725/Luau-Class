local Stack = {}

local Schema = {}
local Metatable = {
	__index = Schema,
	__add = function(t, v)
		for i = 1, #v do
			t:Push(v:Pop())
		end
	end,
}

function Stack.new()
	return setmetatable({}, Metatable)
end

function Schema:Push(Value: any)
	self[#self+1] = Value
end

function Schema:Pop()
	if #self ~= 0 then
		local Value = self[#self]
		self[#self] = nil
		
		return Value
	else
		return nil
	end
end

function Schema:Peek(Depth: number?)
	if #self ~= 0 then
		local Value = self[#self - ((Depth or 1) - 1)]

		return Value
	else
		return nil
	end
end

export type Stack = typeof(Stack.new(table.unpack({...})))

return Stack
