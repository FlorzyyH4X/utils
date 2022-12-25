local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")

local Jumpscare = getconnections(ReplicatedStorage.Bricks.Jumpscare.OnClientEvent)[1].Function
debug.setupvalue(Jumpscare, 1, false)

local Utilities = {}

function Utilities:SetDeathHint(Args)
    debug.setupvalue(getconnections(ReplicatedStorage.Bricks.DeathHint.OnClientEvent)[1].Function, 1, Args)
end

function Utilities:SetDeathReason(Reason)
    local StatsFolder = ReplicatedStorage.GameStats["Player_" .. Players.LocalPlayer.Name]
        
    for _, Data in pairs(StatsFolder:GetChildren()) do
        Data.DeathCause.Value = Reason
        Data.DeathReason.Value = Reason
    end
end
		
function Utilities:Caption(Text)
    firesignal(ReplicatedStorage.Bricks.Caption.OnClientEvent, Text)		
end
		
function Utilities:BreakLights()
    firesignal(ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "breakLights", Workspace.CurrentRooms[Players.LocalPlayer:GetAttribute("CurrentRoom")], 0.416, 60)	
end
		
function Utilities:FlickerLights(Seconds)
    firesignal(ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "flickerLights", Players.LocalPlayer:GetAttribute("CurrentRoom"), Seconds)	
end

function Utilities:Kill()
    Players.LocalPlayer.Character.Humanoid.Health = 0
end

function Utilities:TakeDamage(Damage)
    Players.LocalPlayer.Character.Humanoid:TakeDamage(Damage)
end

function Utilities:Jumpscare(Entity)
    Jumpscare(Entity)
end

function Utilities:Fix()
    Players = game:GetService("Players")
    ReplicatedStorage = game:GetService("ReplicatedStorage")
    Workspace = game:GetService("Workspace")

    Jumpscare = getconnections(ReplicatedStorage.Bricks.Jumpscare.OnClientEvent)[1].Function
    debug.setupvalue(Jumpscare, 1, false)
				
    SoundService.Main.Volume = 1
    Players.LocalPlayer.PlayerGui.MainUI.Jumpscare_Seek.ImageLabel.Visible = true
end

return Utilities
