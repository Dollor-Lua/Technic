local wt = {}

local testservice = game:GetService("TestService")

wt.checkpoint = function(...)
	local args = {...}
	for i,v in pairs(args) do
		testservice:Checkpoint(tostring(v))
	end
end

wt.blMessage = function(...)
	local args = {...}
	for i,v in pairs(args) do
		testservice:Message(tostring(v))
	end
end

return wt
