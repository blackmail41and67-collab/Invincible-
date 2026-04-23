local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local toggleEvent = RS:WaitForChild("ToggleGodMode")

local godMode = {} -- [player] = true/false

toggleEvent.OnServerEvent:Connect(function(player)
	godMode[player] = not godMode[player]
end)

Players.PlayerAdded:Connect(function(player)
	godMode[player] = false

	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")

		local lastHealth = humanoid.Health

		humanoid.HealthChanged:Connect(function()
			if godMode[player] and humanoid.Health < lastHealth then
				humanoid.Health = lastHealth -- cancel damage
			else
				lastHealth = humanoid.Health
			end
		end)
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	godMode[player] = nil
end)
