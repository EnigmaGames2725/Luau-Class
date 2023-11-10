local Queue = {}

local Schema = {}
local Metatable = {__index = Schema}

function Queue.new()
	return setmetatable({}, Metatable)
end

function Schema:Enqueue(Data: any)
	self[#self+1] = Data
end

function Schema:Dequeue()
	local Data = self[1]
	self[1] = nil
	self = table.remove(self, 1)
	return Data
end

function Schema:Peek(n: number?)
	return self[n or 1]
end

return Queue
