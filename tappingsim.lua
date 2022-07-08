repeat wait() until game:IsLoaded()

local Folder = Instance:n

local UI = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = UI:Window("Tapping Sim")
local a = win:Server("Farming", "")
local a1 = a:Channel("Auto Farming")

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

-- functions


function doTap()
    spawn(function()
        while _G.autotap == true do
            local Target = game:GetService("ReplicatedStorage").Events.Tap;
            Target:InvokeServer();
        end
    end)
end
