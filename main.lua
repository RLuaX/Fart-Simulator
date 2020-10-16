--[[
    Game: https://www.roblox.com/games/4950829171
    Credits: Unsourced Pyramid
    As Of: YYYY-MM-DD:	2020-10-16
]]

--[[Settings]]
_G.ON = true --[[true\false]]

--[[Locals]]
local LPlayer = game:GetService("Players").LocalPlayer
local Tool = "";

--[[Scripts]]
--Baisc Player Cola Patch, too lazy to make it universal
--nvm i made it universal
for v,n in pairs(game:GetService("Workspace")[LPlayer.Name]:GetChildren()) do
    if n.ClassName == "Tool" then
        Tool = n.Name
    end
end

for v,n in pairs(game:GetService("Workspace").Islands["1"].CurrencySpawners:GetDescendants()) do
    for va,ins in pairs(n:GetChildren()) do
        if ins == "Single" then
            for value,inst in pairs(ins:GetChildren()) do
                firetouchinterest(game:GetService("Workspace")[LPlayer.Name].Head, inst.Mover, 0)
                firetouchinterest(game:GetService("Workspace")[LPlayer.Name].Head, inst.Mover, 1)
            end
        end
    end
end

pcall(function()
    local PlayerToolCola = game:GetService("Workspace")[LPlayer.Name][Tool].Settings
    PlayerToolCola["DebounceTime"].Value = 0
end)

function SellWT()
    firetouchinterest(game:GetService("Workspace")[LPlayer.Name].Head, Workspace.Islands[1].SellHitPart, 0)
    firetouchinterest(game:GetService("Workspace")[LPlayer.Name].Head, Workspace.Islands[1].SellHitPart, 1)
end

repeat wait()
    SellWT()
    game:GetService("ReplicatedStorage").RemoteFunctions.Request:InvokeServer("ClickableCurrencyAcquired", Vector3.new(0, 0, 0))
until
_G.ON == false
