repeat wait() until game:IsLoaded()

_G.oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
print(oldpos)
local Folder = Instance.new("Folder", game.ReplicatedStorage)
Folder.Name = "Prox"

game.Players.LocalPlayer.Character:MoveTo("37.2773, 9.55834, -581.942")

wait(5)

local clone = game.Workspace.Proximity.Enchantment:Clone()
clone.Parent = game.ReplicatedStorage.Prox

wait(2)

game.Players.LocalPlayer.Character:MoveTo(_G.oldpos)

local UI = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = UI:Window("Vas hub")
local a = win:Server("Farming", "")
local a1 = a:Channel("Auto Farming")

local a2 = a:Channel("Teleport")

a2:Button("Teleport to Best Area", function()
    game.Players.LocalPlayer.Character:MoveTo("-428.193, 17169.8, -554.182")
    end)
a2:Button("Bring Enchantment", function()
    doTPEnch()
    end)

a1:Toggle("Auto Tap", false, function(bool)
    _G.autotap = bool
    print("Auto Tep set to: ", bool)
    if bool then 
        UI:Notification("Success", "Auto Tap Enabled", "Okay!")
        doTap()
    else
        UI:Notification("Success", "Auto Tap Disabled", "Okay!")
    end
end)

a1:Toggle("Auto Rebirth", false, function(bool)
    _G.autorebirth = bool
    print("Auto Rebirth set to: ", bool)
    if bool then 
        UI:Notification("Success", "Auto Rebirth Enabled", "Okay!")
        doRebirth()
    else
        UI:Notification("Success", "Auto Rebirth Disabled", "Okay!")
    end
end)

a1:Dropdown("Select Rebirht Amount", {"1", "5", "10", "20", "100", "500", "2000", "4500", "8000", "12500", "18000", "24500", "32000", "40500"}, function(bool)
    _G.amount = bool
    end)
a1:Slider("Infinite Rebirth Amount!", 0, 1000000000, 500, function(slide)
    _G.amount = slide
    print(slide)
    end)


-- functions


function doTap()
    spawn(function()
        while _G.autotap == true do
            wait(0)
            local Target = game:GetService("ReplicatedStorage").Events.Tap;
            Target:FireServer();
            
        end
    end)
end

function doRebirth()
    spawn(function()
        while _G.autorebirth == true do
            wait(0)
                    local Target = game:GetService("ReplicatedStorage").Events.Rebirth;
                    Target:FireServer(_G.amount);
        end
    end)
end

function doTPEnch()
    spawn(function()
        local clone = game.ReplicatedStorage.Prox.Enchantment:Clone()
        
        clone.Parent = game.Workspace.Proximity
        
        game.workspace.Proximity.Enchantment.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end)
end
