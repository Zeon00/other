-- Load Ash Libs
local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodLetters/Ash-Libs/refs/heads/main/source.lua"))()

-- Create Main Window
GUI:CreateMain({
    Name = "Ashlabs",
    title = "Arm Wrestle Simulator",
    ToggleUI = "K",
    WindowIcon = "home",
    Theme = {
        Background = Color3.fromRGB(25, 25, 35),
        Secondary = Color3.fromRGB(35, 35, 45),
        Accent = Color3.fromRGB(138, 43, 226),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(50, 50, 60),
        NavBackground = Color3.fromRGB(20, 20, 30)
    }
})

-- ================================
-- Tabs
-- ================================
local autoTab = GUI:CreateTab("Automation", "user-round")
GUI:CreateSection({ parent = autoTab, text = "Auto Features" })

local attackTab = GUI:CreateTab("Auto Attack", "sword")
GUI:CreateSection({ parent = attackTab, text = "Attack Settings" })

local playerTab = GUI:CreateTab("Player", "user-circle")
GUI:CreateSection({ parent = playerTab, text = "Player Settings" })

local worldTab = GUI:CreateTab("World", "globe")
GUI:CreateSection({ parent = worldTab, text = "World Selection" })

-- ================================
-- Variables
-- ================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Network = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("Network"):WaitForChild("RemoteEvent")
local GameRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Game")

local dummyOptions = {"Dummy1","Dummy2","Dummy3","Dummy4","Dummy5","Dummy6"}
local worlds = {}
for i = 1, 25 do table.insert(worlds, "World"..i) end

local selectedDummy = dummyOptions[1]
local selectedWorld = worlds[1]

-- ================================
-- Helpers
-- ================================
local function safeFire(fn)
    local ok, err = pcall(fn)
    if not ok then warn("SafeFire error:", err) end
end

-- ================================
-- Automation Toggles
-- ================================
-- Auto Dummy
local dummyOn = false
local dummyLoop
GUI:CreateToggle({
    parent = autoTab,
    text = "Auto Dummy",
    default = false,
    callback = function(state)
        dummyOn = state
        if dummyOn then
            dummyLoop = RunService.RenderStepped:Connect(function()
                safeFire(function()
                    local arg = "\000\006"..selectedDummy
                    Network:FireServer(buffer.fromstring(arg))
                end)
            end)
        else
            if dummyLoop then dummyLoop:Disconnect() dummyLoop = nil end
        end
    end
})

-- Auto Rebirth
local rebirthOn = false
local rebirthLoop
GUI:CreateToggle({
    parent = autoTab,
    text = "Auto Rebirth",
    default = false,
    callback = function(state)
        rebirthOn = state
        if rebirthOn then
            rebirthLoop = RunService.RenderStepped:Connect(function()
                safeFire(function()
                    GameRemote:FireServer("Rebirth")
                end)
            end)
        else
            if rebirthLoop then rebirthLoop:Disconnect() rebirthLoop = nil end
        end
    end
})

-- Auto Next Floor
local nextOn = false
local nextLoop
GUI:CreateToggle({
    parent = autoTab,
    text = "Auto Next Floor",
    default = false,
    callback = function(state)
        nextOn = state
        if nextOn then
            nextLoop = RunService.RenderStepped:Connect(function()
                safeFire(function()
                    GameRemote:FireServer("NextFloor")
                end)
            end)
        else
            if nextLoop then nextLoop:Disconnect() nextLoop = nil end
        end
    end
})

-- ================================
-- Auto Attack Toggle
-- ================================
-- Auto Attack (1–10) menggunakan buffer, logic asli tidak diubah
local attackRunning = false
local worldData = {
    ["1"] = { "\000\000\001\001\000\004Monk", "\000\000\001\001\000\aStudent", "\000\000\001\001\000\aSamurai", "\000\000\001\001\000\003Oni", "\000\000\001\001\000\aWarrior" },
    ["2"] = { "\000\000\001\001\000\003Odo", "\000\000\001\001\000\005Newma", "\000\000\001\001\000\004Yaha", "\000\000\001\001\000\004Susa", "\000\000\001\001\000\003Kyo" },
    ["3"] = { "\000\000\001\001\000\014Brother Spider", "\000\000\001\001\000\rSister Spider", "\000\000\001\001\000\rMother Spider", "\000\000\001\001\000\rFather Spider", "\000\000\001\001\000\004Rewi" },
    ["4"] = { "\000\000\001\001\000\006Waiter", "\000\000\001\001\000\tConductor", "\000\000\001\001\000\aSlasher", "\000\000\001\001\000\003Emu", "\000\000\001\001\000\003Aka" },
    ["5"] = { "\000\000\001\001\000\nLeaf Demon", "\000\000\001\001\000\fFlower Demon", "\000\000\001\001\000\tDak Oiran", "\000\000\001\001\000\003Dak", "\000\000\001\001\000\003Gyu" },
    ["6"] = { "\000\000\001\001\000\004Aize", "\000\000\001\001\000\005Urogi", "\000\000\001\001\000\004Kara", "\000\000\001\001\000\003Gyo", "\000\000\001\001\000\004Zoha" },
    ["7"] = { "\000\000\001\001\000\tTen Pupil", "\000\000\001\001\000\vTen Student", "\000\000\001\001\000\fTen Disciple", "\000\000\001\001\000\vTen Scholar", "\000\000\001\001\000\nTen Sensei" },
    ["8"] = { "\000\000\001\001\000\fMuichi Pupil", "\000\000\001\001\000\014Muichi Student", "\000\000\001\001\000\015Muichi Disciple", "\000\000\001\001\000\014Muichi Scholar", "\000\000\001\001\000\rMuichi Sensei" },
    ["9"] = { "\000\000\001\001\000\vMitsu Pupil", "\000\000\001\001\000\rMitsu Student", "\000\000\001\001\000\014Mitsu Disciple", "\000\000\001\001\000\rMitsu Scholar", "\000\000\001\001\000\fMitsu Sensei" },
    ["10"] = { "\000\000\001\001\000\nOban Pupil", "\000\000\001\001\000\fOban Student", "\000\000\001\001\000\rOban Disciple", "\000\000\001\001\000\fOban Scholar", "\000\000\001\001\000\vOban Sensei" }
}

local function attackWorld(worldId)
    local mobs = worldData[worldId]
    if not mobs then return end
    for _, mob in ipairs(mobs) do
        pcall(function()
            local args = { buffer.fromstring(mob) }
            Network:FireServer(unpack(args))
        end)
    end
end

GUI:CreateToggle({
    parent = attackTab,
    text = "Auto Attack",
    default = false,
    callback = function(state)
        attackRunning = state
        task.spawn(function()
            while attackRunning do
                attackWorld(selectedWorld)
                task.wait(0.02)
            end
        end)
    end
})

GUI:CreateDropdown({
    parent = attackTab,
    text = "Select World",
    options = {"World1","World2","World3","World4","World5","World6","World7","World8","World9","World10"},
    default = "1",
    callback = function(sel)
        selectedWorld = sel
    end
})

-- ================================
-- Player Toggles
-- ================================
-- HipHeight
local humanoid, defaultHipHeight
local hipHeightValue = 20
local isHipOn = false
local function updateHumanoid(char)
    humanoid = char:WaitForChild("Humanoid")
    defaultHipHeight = humanoid.HipHeight
    if isHipOn then
        humanoid.HipHeight = hipHeightValue
    end
end
if player.Character then updateHumanoid(player.Character) end
player.CharacterAdded:Connect(updateHumanoid)

GUI:CreateToggle({
    parent = playerTab,
    text = "HipHeight",
    default = false,
    callback = function(state)
        isHipOn = state
        if humanoid then
            humanoid.HipHeight = isHipOn and hipHeightValue or (defaultHipHeight or 2)
        end
    end
})

-- Anti AFK (always ON)
GUI:CreateToggle({
    parent = playerTab,
    text = "Anti AFK",
    default = true,
    callback = function(state)
        task.spawn(function()
            while true do
                task.wait(600)
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local oldPos = hrp.Position
                    hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, 1)
                    task.wait(0.5)
                    hrp.CFrame = CFrame.new(oldPos)
                end
            end
        end)
    end
})

-- ================================
-- World Tab
-- ================================
GUI:CreateDropdown({
    parent = worldTab,
    text = "Select Dummy",
    options = dummyOptions,
    default = dummyOptions[1],
    callback = function(sel) selectedDummy = sel end
})

GUI:CreateDropdown({
    parent = worldTab,
    text = "Select World",
    options = worlds,
    default = worlds[1],
    callback = function(sel)
        selectedWorld = sel
        safeFire(function()
            GameRemote:FireServer("Travel", selectedWorld)
        end)
    end
})
