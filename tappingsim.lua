repeat wait() until game:IsLoaded()

local UI = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = UI:Window("Tapping Sim")
local a = win:Server("Farming", "")
local a1 = a:Channel("Auto Farming")

a1:Toggle("Auto Tap", false, function(bool)
    _G.autotap = bool
    print("Auto Tep set to: ", bool)
    if bool then 
        doTap()
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
