local Deque = {}

local Schema = {}
local Metatable = {__index = Schema}

function Deque.new()
	return setmetatable({}, Metatable)
end

function Schema:Enqueue(Data: any)
	self[#self+1] = Data
end

function Schema:EnqueueFront(Data: any)
	for i = #self, 1, -1 do
		self[i+1] = self[i]
	end
	
	self[1] = Data
end

function Schema:Dequeue()
	local Data = self[1]
	self[1] = nil
	self = table.remove(self, 1)
	
	return Data
end

function Schema:DequeueLast()
	local Data = self[#self]
	self[#self] = nil
	self = table.remove(self, #self)
	
	return Data
end

function Schema:Peek(n: number?)
	return self[n or 1]
end

return Deque
