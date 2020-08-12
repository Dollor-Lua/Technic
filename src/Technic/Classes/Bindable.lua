local b = {}
b.__index = b

local metas = {}

function checkExists(e)
	if e._event then
		return true
	else
		return false
	end
end

function b.get(name)
	for i,v in pairs(metas) do
		if v._name == name then
			return v
		end
	end
end

function b.new(name)
	local e    = Instance.new("BindableEvent")
	local e2   = Instance.new("BindableEvent")
	local e3   = Instance.new("BindableEvent")
	local e4   = Instance.new("BindableEvent")
	local e5   = Instance.new("BindableEvent")
	local e6   = Instance.new("BindableEvent")
	
	local self = setmetatable({
		_events         = {e, e2, e3, e4, e5, e6},
		_name           = name,
		
		_event          = e,
		_fired          = e2,
		
		_canFire        = true,
		_destroyed      = false,
		
		_activated      = e3,
		_deactivated    = e4,
		_destroyed_     = e5,
		_tracebacked    = e6,
		
		event           = e.Event,
		fired           = e2.Event,
		
		activated       = e3.Event,
		deactivated     = e4.Event,	
		destroyed       = e5.Event,
		tracebacked     = e6.Event,
	}, b)
	
	table.insert(metas, self)
	return self
end

function b:Fire(...)
	local exists = checkExists(self)
	if not exists then
		self._destroyed = true
		warn("Cannot run function. (Doesn't exist)")
		self.event = nil
		return
	end 
	
	if not self._canFire then 
		error("Cannot fire bindable. (Bindable is deactivated.)") 
		return
	end
	
	if self._destroyed then
		error("Cannot fire bindable. (This instance was destroyed.)")
		return
	end
	
	self._event:Fire(...)
	self._fired:Fire()
end

function b:SetActive(bool)
	local exists = checkExists(self)
	if not exists then
		self._destroyed = true
		self.event = nil
		warn("Cannot run function. (Doesn't exist)")
		return
	end 
	
	if type(bool) == 'boolean' then
		self._canFire = bool
		
		if bool == true then
			self._activated:Fire()
		else
			self._deactivated:Fire()
		end
	end
end

function b:Rid()
	local exists = checkExists(self)
	if not exists then
		self._destroyed = true
		warn("Cannot run function. (Doesn't exist)")
		return
	end 
	
	self._destroyed_:Fire()
	
	self._destroyed = true
	self._event:Destroy()
	self.event = nil
end

function b:Traceback()
	if not self._destroyed then
		warn("There is nothing to trace back to! (Traceback is only accessable if the event was destroyed)")
		return	
	end
	
	self._event = Instance.new("BindableEvent")
	self.event = self._event.Event
	self._destroyed = false
	self._canFire = true
	
	self._tracebacked:Fire()
end

return b
