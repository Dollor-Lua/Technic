local testservice = game:GetService("TestService")

local classes = script.Parent.Classes
local libs = script.Parent.Libraries

local instantiate = function(class)
	class = tostring(class)
	if classes:FindFirstChild(class) then
		return require(classes[class]).new()
	else
		warn("If you were trying to fork the Technic Framework, make sure your class is inside the \"Classes\" folder.")
		error("The class sent \""..class.."\" is not a valid class of the Technic Framework.")
	end
end

local loadLib = function(library)
	library = tostring(library)
	if libs:FindFirstChild(library) then
		return require(libs[library])
	else
		warn("If you were trying to fork the Technic Framework, make sure your library is inside the \"Libraries\" folder.")
		error("The library sent \""..library.."\" is not a valid library of the Technic Framework.")
	end
end

local environmentSettings = getfenv(1)

environmentSettings.Instantiate = instantiate
environmentSettings.GetLibrary = loadLib
environmentSettings.checkpoint = require(script.Libraries.ts).checkpoint
environmentSettings.message = require(script.Libraries.ts).blMessage
environmentSettings.__technicVersion = script.__VERSION.Value
environmentSettings.__tV = script.__VERSION.Value 
environmentSettings.gs = require(script.Libraries.gs)
environmentSettings.wait = require(script.Libraries.wait)

return environmentSettings
