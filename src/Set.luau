local Set = {}

local Schema = {}
local Metatable = {
	__index = Schema,
	__tostring = function(self)
		local Values = {}
		
		for Key: string, Value in self do
			table.insert(Values, Key)
		end
		
		return table.concat(Values, ", ")
	end,
	__add = function(a, b)
		for Key, _ in b do
			a[Key] = true
		end
		
		return a
	end,
	__sub = function(a, b)
		for Key, _ in b do
			a[Key] = nil
		end

		return a
	end,
}

function Set.new(Items: {string} | nil)
	local _Set = {}
	
	if Items ~= nil then
		for _, Item in ipairs(Items) do
			_Set[Item] = true
		end
	end
	
	return setmetatable(_Set, Metatable)
end

function Schema:Add(New: string | {string})
	if typeof(New) == "string" then
		self[New] = true
		
	elseif typeof(New) == "table" then
		for _, Item in New do
			self[Item] = true
		end
	end
end

function Schema:Remove(New: string | {string})
	if typeof(New) == "string" then
		self[New] = nil

	elseif typeof(New) == "table" then
		for _, Item in New do
			self[Item] = nil
		end
	end
end

function Schema:Contains(Value: string | {string})
	if typeof(Value) == "string" then
		return self[Value] == true
		
	elseif typeof(Value) == "table" then
		for _, Item in Value do
			if self[Value] ~= true then
				return false
			end
		end
		
		return true
	end
end

function Set:Union(a: Set, b: Set)
	local _New = Set.new()
	
	for Key, Item in a do
		_New[Key] = true
	end
	
	for Key, Item in b do
		_New[Key] = true
	end
	
	return _New
end

function Set:Intersect(a: Set, b: Set)
	local _New = Set.new()

	for Key, Item in b do
		if a[Key] == true then
			_New[Key] = true
		end
	end
	
	for Key, Item in a do
		if b[Key] == true then
			_New[Key] = true
		end
	end

	return _New
end

function Set:Exclude(a: Set, b: Set)
	local _New = Set.new()

	for Key, Item in b do
		if a[Key] ~= true then
			_New[Key] = true
		end
	end

	for Key, Item in a do
		if b[Key] ~= true then
			_New[Key] = true
		end
	end

	return _New
end

export type Set = typeof(Set.new(table.unpack(...)))

return Set
