local RS = game:GetService("ReplicatedStorage")
local toggleEvent = RS:WaitForChild("ToggleGodMode")

local button = script.Parent

local enabled = false

button.Text = "God Mode: OFF"

button.MouseButton1Click:Connect(function()
	enabled = not enabled

	if enabled then
		button.Text = "God Mode: ON"
	else
		button.Text = "God Mode: OFF"
	end

	toggleEvent:FireServer()
end)
