local t = {}
t.__index = t

function t.new(...)
	local e    = Instance.new("BindableEvent")
	local e2   = Instance.new("BindableEvent")
	
	local self = setmetatable({
		_items           = {...},
		
		_added           = e,
		_removed         = e2,
		_destroyed       = false,
		
		ItemAdded        = e.Event,
		ItemRemoved      = e2.Event,
		
		length           = #{...},
	}, t)
	
	return self
end

function t.remove(Table, position)
	if Table._items then
		if Table._destroyed == true then
			error("This table was destroyed.")
			return
		end
		
		table.remove(Table._items, position)
	else
		error("The table sent is not a table constructed from this module. Please construct the table with .new(arguments)")
		return
	end
end

function t:push(item)
	if self._destroyed == true then
		error("This table was destroyed.")
		return
	end
	
	if item == nil then
		error("The type \"Item\" is nil. Please use a valid object next time. (Push)")
		return
	end
	
	table.insert(self._items, item)
	self.length = self.length + 1
end

function t:splice(pos, item)
	if self._destroyed == true then
		error("This table was destroyed.")
		return
	end
	
	pos = tonumber(pos)
	if pos == nil then
		error("Argument One (Position) is invalid or nil. Please enter a valid number. (Splice)")
		return
	end
	if item == nil then
		error("Argument Two (Item) is nil. Please enter a valid object next time. (Splice)")
		return
	end
	
	table.insert(self._items, pos, item)
	self.length = self.length + 1
end

function t:unshift(item)
	if self._destroyed == true then
		error("This table was destroyed.")
		return
	end
	
	if item == nil then
		error("Argument One (Item) is nil. Please enter a valid object next time. (Unshift)")
	end
	
	table.insert(self._items, 1, item)
	self.length = self.length + 1
end

function t:shift()
	if self._destroyed == true then
		error("This table was destroyed.")
		return
	end
	
	if #self._items <= 0 then
		error("Cannot shift table. (No items in table) (Shift)")
	end
	
	table.remove(self._items, 1)
	self.length = self.length - 1
end

function t:join(str)
	if self._destroyed == true then
		error("This table was destroyed.")
		return
	end
	
	if type(str) ~= "string" then
		warn("The string specified is not a string. Please expect different results. (Join)")
	end
	
	str = tostring(str)
	local s = ""
	for i,v in pairs(self._items) do
		if type(v) ~= "string" then
			warn("Item in position "..i.." of the table is not a valid string. Expect different results because of this.")
		end
		
		if i~=1 then
			s = s.. str
		end
		s = s.. tostring(v)
	end
	
	return s
end

function t:GetItems()
	if self._destroyed == true then
		error("This table was destroyed.")
		return
	end
	
	return self._items
end

function t:Rid()
	if self._destroyed == false then
		self._destroyed = true
		self._added:Destroy()
		self._removed:Destroy()
		self.ItemAdded = nil
		self.ItemRemoved = nil
	else
		error("This table is already destroyed! (Collection Class) (Rid)")
		return
	end
end

return t
