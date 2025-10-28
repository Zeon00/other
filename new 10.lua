local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodLetters/Ash-Libs/refs/heads/main/source.lua"))()
GUI:CreateMain({
    Name = "Ashlabs",
    title = "Slayer Asencion",
    ToggleUI = "K",
    WindowIcon = "home", -- you can use lucid icons
    -- WindowHeight = 600, -- default height
    -- WindowWidth = 800, -- default width
    Theme = {
        Background = Color3.fromRGB(25, 25, 35),
        Secondary = Color3.fromRGB(35, 35, 45),
        Accent = Color3.fromRGB(138, 43, 226),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(50, 50, 60),
        NavBackground = Color3.fromRGB(20, 20, 30)
    },
    Blur = { -- Buggy
        Enable = false, -- transparent option
        value = 0.2
    },
    Config = { -- not implemented yet
        Enabled = false,
    }
})

local main = GUI:CreateTab("Main", "user-round") -- You can use IconID we didnt impleemnt lucid or any external icons
GUI:CreateSection({
    parent = main, 
    text = "Player"
})
GUI:CreateToggle({
    parent = main, 
    text = "Training DUmmy", 
    default = true, 
    callback = function()
-- Final v2: GUI tanpa auto-attack, hanya Auto Dummy (Dropdown Scrollable max 6) + Auto Rebirth + Teleport + Minimize
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Network refs
local Network = ReplicatedStorage:WaitForChild("Modules")
                       :WaitForChild("Network")
                       :WaitForChild("Network")
                       :WaitForChild("RemoteEvent")
local GameRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Game")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SimpleAutoGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 300)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -150)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Simple Auto"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- Close / Minimize
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

local floatIcon = Instance.new("TextButton")
floatIcon.Size = UDim2.new(0, 140, 0, 36)
floatIcon.Position = UDim2.new(0.85, 0, 0.15, 0)
floatIcon.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
floatIcon.Text = "Simple Auto"
floatIcon.TextColor3 = Color3.new(1,1,1)
floatIcon.Font = Enum.Font.GothamBold
floatIcon.TextSize = 16
floatIcon.Visible = false
floatIcon.Parent = screenGui

local floatCorner = Instance.new("UICorner")
floatCorner.CornerRadius = UDim.new(0, 10)
floatCorner.Parent = floatIcon

closeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	floatIcon.Visible = true
end)
floatIcon.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	floatIcon.Visible = false
end)

-- Helper for buttons
local function createToggleButton(parent, text, posY)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.8, 0, 0, 40)
	btn.Position = UDim2.new(0.1, 0, posY, 0)
	btn.BackgroundColor3 = Color3.fromRGB(70,70,80)
	btn.Text = text
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 18
	btn.AutoButtonColor = true
	btn.Parent = parent
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 8)
	c.Parent = btn
	return btn
end

-- Safe fire helper
local function safeFire(fn)
	local ok, err = pcall(fn)
	if not ok then warn("SafeFire error:", err) end
end

---------------------------------------------------------------------
-- Dummy Dropdown (Scrollable, cuma 6 boss)
---------------------------------------------------------------------
local dummyFrame = Instance.new("Frame")
dummyFrame.Size = UDim2.new(0.8, 0, 0, 36)
dummyFrame.Position = UDim2.new(0.1, 0, 0.20, 0)
dummyFrame.BackgroundColor3 = Color3.fromRGB(70,70,80)
dummyFrame.ZIndex = 5
dummyFrame.Parent = mainFrame

local dummyCorner = Instance.new("UICorner")
dummyCorner.CornerRadius = UDim.new(0, 8)
dummyCorner.Parent = dummyFrame

local dummySelected = Instance.new("TextButton")
dummySelected.Size = UDim2.new(1, 0, 1, 0)
dummySelected.BackgroundTransparency = 1
dummySelected.Text = "Select Dummy"
dummySelected.TextColor3 = Color3.new(1,1,1)
dummySelected.Font = Enum.Font.Gotham
dummySelected.TextSize = 16
dummySelected.TextXAlignment = Enum.TextXAlignment.Left
dummySelected.ZIndex = 6
dummySelected.Parent = dummyFrame

local dummyList = Instance.new("ScrollingFrame")
dummyList.Size = UDim2.new(1, 0, 0, 0)
dummyList.Position = UDim2.new(0, 0, 1, 2)
dummyList.BackgroundColor3 = Color3.fromRGB(50,50,60)
dummyList.BorderSizePixel = 0
dummyList.ScrollBarThickness = 6
dummyList.CanvasSize = UDim2.new(0, 0, 0, 0)
dummyList.ClipsDescendants = true
dummyList.ZIndex = 10
dummyList.Parent = dummyFrame

local dummyLayout = Instance.new("UIListLayout")
dummyLayout.SortOrder = Enum.SortOrder.LayoutOrder
dummyLayout.Padding = UDim.new(0, 2)
dummyLayout.Parent = dummyList

local dummyOpen = false
local function toggleDummyDropdown()
	dummyOpen = not dummyOpen
	local targetHeight = dummyOpen and 150 or 0
	dummyList:TweenSize(UDim2.new(1, 0, 0, targetHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
end
dummySelected.MouseButton1Click:Connect(toggleDummyDropdown)

local DummyOptions = { "Dummy1", "Dummy2", "Dummy3", "Dummy4", "Dummy5", "Dummy6" }
local selectedDummy = DummyOptions[1]

for _, name in ipairs(DummyOptions) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(70,70,80)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.ZIndex = 11
	btn.Parent = dummyList

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 6)
	c.Parent = btn

	btn.MouseButton1Click:Connect(function()
		selectedDummy = name
		dummySelected.Text = "Selected: " .. name
		toggleDummyDropdown()
	end)
end
dummyLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	dummyList.CanvasSize = UDim2.new(0, 0, 0, dummyLayout.AbsoluteContentSize.Y + 6)
end)

---------------------------------------------------------------------
-- Auto Dummy Toggle
---------------------------------------------------------------------
local dummyToggle = createToggleButton(mainFrame, "Auto Dummy: OFF", 0.38)
local dummyOn = false
local dummyLoop

local function fireDummy()
	safeFire(function()
		local arg = "\000\006" .. selectedDummy
		Network:FireServer(buffer.fromstring(arg))
	end)
end

dummyToggle.MouseButton1Click:Connect(function()
	dummyOn = not dummyOn
	dummyToggle.Text = dummyOn and "Auto Dummy: ON" or "Auto Dummy: OFF"
	if dummyOn then
		dummyLoop = RunService.RenderStepped:Connect(fireDummy)
	else
		if dummyLoop then dummyLoop:Disconnect() dummyLoop = nil end
	end
end)

---------------------------------------------------------------------
-- Auto Rebirth
---------------------------------------------------------------------
local rebirthToggle = createToggleButton(mainFrame, "Auto Rebirth: OFF", 0.56)
local rebirthOn = false
local rebirthLoop

local function fireRebirth()
	safeFire(function()
		GameRemote:FireServer("Rebirth")
	end)
end

rebirthToggle.MouseButton1Click:Connect(function()
	rebirthOn = not rebirthOn
	rebirthToggle.Text = rebirthOn and "Auto Rebirth: ON" or "Auto Rebirth: OFF"
	if rebirthOn then
		rebirthLoop = RunService.RenderStepped:Connect(fireRebirth)
	else
		if rebirthLoop then rebirthLoop:Disconnect() rebirthLoop = nil end
	end
end)

---------------------------------------------------------------------
-- Teleport Dropdown (Scrollable)
---------------------------------------------------------------------
local tpFrame = Instance.new("Frame")
tpFrame.Size = UDim2.new(0.8, 0, 0, 36)
tpFrame.Position = UDim2.new(0.1, 0, 0.74, 0)
tpFrame.BackgroundColor3 = Color3.fromRGB(70,70,80)
tpFrame.Parent = mainFrame

local tpCorner = Instance.new("UICorner")
tpCorner.CornerRadius = UDim.new(0, 8)
tpCorner.Parent = tpFrame

local tpSelected = Instance.new("TextButton")
tpSelected.Size = UDim2.new(1, 0, 1, 0)
tpSelected.BackgroundTransparency = 1
tpSelected.Text = "Select World"
tpSelected.TextColor3 = Color3.new(1,1,1)
tpSelected.Font = Enum.Font.Gotham
tpSelected.TextSize = 16
tpSelected.TextXAlignment = Enum.TextXAlignment.Left
tpSelected.Parent = tpFrame

local tpList = Instance.new("ScrollingFrame")
tpList.Size = UDim2.new(1, 0, 0, 0)
tpList.Position = UDim2.new(0, 0, 1, 2)
tpList.BackgroundColor3 = Color3.fromRGB(50,50,60)
tpList.BorderSizePixel = 0
tpList.ScrollBarThickness = 6
tpList.CanvasSize = UDim2.new(0, 0, 0, 0)
tpList.ClipsDescendants = true
tpList.Parent = tpFrame

local tpLayout = Instance.new("UIListLayout")
tpLayout.SortOrder = Enum.SortOrder.LayoutOrder
tpLayout.Padding = UDim.new(0, 2)
tpLayout.Parent = tpList

local Worlds = {}
for i = 1, 25 do table.insert(Worlds, "World"..i) end
local tpOpen = false

local function toggleTPDropdown()
	tpOpen = not tpOpen
	local targetHeight = tpOpen and 150 or 0
	tpList:TweenSize(UDim2.new(1, 0, 0, targetHeight), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
end
tpSelected.MouseButton1Click:Connect(toggleTPDropdown)

for _, name in ipairs(Worlds) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(70,70,80)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.Parent = tpList

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 6)
	c.Parent = btn

	btn.MouseButton1Click:Connect(function()
		tpSelected.Text = name
		toggleTPDropdown()
		safeFire(function()
			GameRemote:FireServer("Travel", name)
		end)
	end)
end
tpLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	tpList.CanvasSize = UDim2.new(0, 0, 0, tpLayout.AbsoluteContentSize.Y + 6)
end)

    end
})

GUI:CreateToggle({
    parent = main, 
    text = "Auto Attack", 
    default = true, 
    callback = function()
-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- // Remote
local Remote = ReplicatedStorage:WaitForChild("Modules")
	:WaitForChild("Network")
	:WaitForChild("Network")
	:WaitForChild("RemoteEvent")

-- // GUI Setup
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "AutoAttackGUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = true

local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, 26)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Auto Attack"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -28, 0, 1)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
closeBtn.AutoButtonColor = false
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 24, 0, 24)
minimizeBtn.Position = UDim2.new(1, -56, 0, 1)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 14
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeBtn.AutoButtonColor = false

local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _, obj in ipairs(frame:GetChildren()) do
		if obj ~= titleBar then
			obj.Visible = not minimized
		end
	end
	frame.Size = minimized and UDim2.new(0, 200, 0, 26) or UDim2.new(0, 200, 0, 150)
end)

-- // Buttons
local toggleButton = Instance.new("TextButton", frame)
toggleButton.Size = UDim2.new(1, -20, 0, 32)
toggleButton.Position = UDim2.new(0, 10, 0, 40)
toggleButton.Text = "OFF"
toggleButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14
toggleButton.AutoButtonColor = false

local dropdown = Instance.new("TextButton", frame)
dropdown.Size = UDim2.new(1, -20, 0, 32)
dropdown.Position = UDim2.new(0, 10, 0, 84)
dropdown.Text = "Select World: 1"
dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dropdown.TextColor3 = Color3.new(1, 1, 1)
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 13
dropdown.AutoButtonColor = false

-- // World Data
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

-- // Logic
local selectedWorld = "1"
local attackRunning = false

local function attackWorld(worldId)
	local mobs = worldData[worldId]
	if not mobs then return end
	for _, mob in ipairs(mobs) do
		pcall(function()
			local args = { buffer.fromstring(mob) }
			Remote:FireServer(unpack(args))
		end)
	end
end

-- Dropdown world ganti
dropdown.MouseButton1Click:Connect(function()
	local nextWorld = (tonumber(selectedWorld) % 10) + 1
	selectedWorld = tostring(nextWorld)
	dropdown.Text = "Select World: " .. selectedWorld
end)

-- Toggle On/Off
toggleButton.MouseButton1Click:Connect(function()
	attackRunning = not attackRunning
	if attackRunning then
		toggleButton.Text = "ON"
		toggleButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
		task.spawn(function()
			while attackRunning do
				attackWorld(selectedWorld)
				task.wait(0.02)
			end
		end)
	else
		toggleButton.Text = "OFF"
		toggleButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
	end
end)

    end
})

