--// custom wait function (supports same parameters and ways of old one, but faster and cleaner)

local wt = function(t)
	if not t then t = 0.0035 end
	local c = tick()
	repeat game:GetService("RunService").Heartbeat:Wait() until tick()-c>=t
	return true
end

return wt
