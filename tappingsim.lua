repeat wait() until game:IsLoaded()

local folder = Instance.new("Folder", game.ReplicatedStorage)
folder.Name = "Prox"

local copy =  game.Workspace.Proximity.Enchantment:Clone()

copy.Parent = game.ReplicatedStorage.Prox

_G.settingsTable = {
    autoTap = false;
    autoRebirth = false;
    bestWorld = false;
}

print("--- DEFAULT SETTINGS --")
for i,v in pairs(_G.settingsTable) do
    print(i,v)
end
print("------")

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Tapping Sim", 5013109572)

local page = venyx:addPage("Auto Farm", 5012544693)
local page1 = venyx:addPage("Settings", 5012544693)
local ss = page1:addSection("UI")
local ff = page:addSection("Farming")
ff:addToggle("Auto Click [Fast]", true, function(isToggled)
    _G.autotap = isToggled
    if isToggled then
        doTap();
        end
end)



ff:addDropdown("Rebirth amount", {"1", "5", "10", "20", "100", "500", "2000", "4500", "8000", "12500", "18000", "24500", "32000", "40500"}, function(text)
    print("Selected", text)
    _G.rebirths = text
end)
ff:addToggle("Auto Rebirth", nil, function(bool)
    _G.autorebirth = bool
    print("Auto Rebirth is: ", bool)
    if bool then
        autoRebirth(_G.rebirths);
        end
end)
ff:addToggle("Best Farm", nil, function(bool)
    _G.bestfam = bool
    print("Bets farm is : ", bool)
    if bool then
        bestFarm();
        end
end)

ff:addButton("Bring Enchantment", function()
    bringEnch()
    end)

ss:addKeybind("Toggle Keybind", Enum.KeyCode.One, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)
ss:addButton("save", function()
    end)
venyx:SelectPage(venyx.pages[1], true)



function doTap()
        spawn(function()
            while _G.autotap == true do
                local Target = game:GetService("ReplicatedStorage").Events.Tap;
                Target:InvokeServer();
                 end
            end)
end
    

function autoRebirth(amount)
        spawn(function()
            while _G.autorebirth == true do
                    wait(0)
                    local Target = game:GetService("ReplicatedStorage").Events.Rebirth;
                    Target:FireServer(amount);
                 end
            end)
end

function bestFarm()
    spawn(function()
        
        while _G.bestfam == true do
            wait(0)
                game.Players.LocalPlayer.Character:MoveTo("-297.174, 11236.1, -232.338")
            end
        end)
end

function bringEnch()
    spawn(function()
            local clone = game.ReplicatedStorage.Prox.Enchantment:Clone()
            clone.Parent = game.workspace.Proximity
            game.workspace.Proximity.Enchantment.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        end)
    end
