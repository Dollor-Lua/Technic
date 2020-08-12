local tb = plugin:CreateToolbar("Technic Code")
local b = tb:CreateButton("Technic Code Gui", "Opens the Technic Code Gui", "rbxassetid://5543006553")

local info = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Left,
	false,
	false,
	200,
	300,
	200,
	300
)

local widget = plugin:CreateDockWidgetPluginGui("TCode-MainGui", info)
widget.Name = "TCodeGuiMain"
widget.Title = "Technic Code"

wait()

script.Parent.Main.Parent = widget

b.Click:Connect(function()
	widget.Enabled = not widget.Enabled
end)

local text = {
	[[local a = 1
local b = 2
local c = 3
	
print(a)
print(b..a)
print( c )
]],
	
	[[local function add(a, b)
	return a + b
end
	
print(add(1, 2)) -- hopefully 3
]],
	[[local str = tostring(123)
print(str)
	
print("The value is: ".. str)
]]
}

while true do
	for i=1, 3 do
		script.Parent.RichtextController2.src.Value = text[i]
		wait(2)
	end
end
