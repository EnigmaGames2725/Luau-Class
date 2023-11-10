local PriorityQueue = {}

local Schema = {}
local Metatable = {__index = Schema}

function PriorityQueue.new()
	return setmetatable({}, Metatable)
end

function Schema:Enqueue(Data: any, Priority: number)
	table.insert(self, {Priority = Priority, Data = Data})
	self = table.sort(self, function(a, b)
		if a ~= nil then
			if b ~= nil then
				if a.Priority > b.Priority then
					return true
				else 
					return false
				end
			else
				return true
			end
		else
			return false
		end

	end)
end

function Schema:Dequeue()
	if self[1] then
		local Data = self[1]
		self = table.remove(self, 1)
		return Data.Data
	else
		
	end
end

function Schema:Peek(n: number?)
	return self[n or 1]
end

return PriorityQueue
