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
--// Anti Error Safe Function
local function safeFire(fn)
	local s, e = pcall(fn)
	if not s then warn("[UI ERROR]:", e) end
end

--// Main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoFarmUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

--// Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 260, 0, 360)
mainFrame.Position = UDim2.new(0.5, -130, 0.5, -180)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ZIndex = 3
mainFrame.Parent = screenGui
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

--// Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 34)
titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
titleBar.ZIndex = 4
titleBar.Parent = mainFrame
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚙️ Auto Farm Panel"
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 5
titleText.Parent = titleBar

--// Minimize Button
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 28, 0, 28)
minimize.Position = UDim2.new(1, -34, 0.5, -14)
minimize.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
minimize.Text = "-"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 18
minimize.ZIndex = 6
minimize.Parent = titleBar
local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minimize

--// Content Container
local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -34)
content.Position = UDim2.new(0, 0, 0, 34)
content.BackgroundTransparency = 1
content.ClipsDescendants = true
content.ZIndex = 3
content.Parent = mainFrame

--// Layout for elements
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Parent = content

--// Toggle Template Function
local function createToggle(name, order)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0.8, 0, 0, 36)
	frame.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
	frame.ZIndex = 2
	frame.Parent = content
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = frame

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.7, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = name
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.Gotham
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Position = UDim2.new(0.05, 0, 0, 0)
	label.ZIndex = 3
	label.Parent = frame

	local toggle = Instance.new("TextButton")
	toggle.Size = UDim2.new(0.2, 0, 0.6, 0)
	toggle.Position = UDim2.new(0.75, 0, 0.2, 0)
	toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 110)
	toggle.Text = "OFF"
	toggle.TextColor3 = Color3.new(1, 0.3, 0.3)
	toggle.Font = Enum.Font.GothamBold
	toggle.TextSize = 14
	toggle.ZIndex = 4
	toggle.Parent = frame
	local togCorner = Instance.new("UICorner")
	togCorner.CornerRadius = UDim.new(0, 6)
	togCorner.Parent = toggle

	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = state and "ON" or "OFF"
		toggle.TextColor3 = state and Color3.new(0.3, 1, 0.3) or Color3.new(1, 0.3, 0.3)
		safeFire(function()
			print(name, "set to", state)
		end)
	end)
end

--// Create Toggles
createToggle("Auto Farm", 1)
createToggle("Auto Upgrade", 2)
createToggle("Auto Collect", 3)

--// Dummy Dropdown (ZIndex fixed)
local dummyFrame = Instance.new("Frame")
dummyFrame.Size = UDim2.new(0.8, 0, 0, 36)
dummyFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
dummyFrame.ZIndex = 5
dummyFrame.Parent = content
local dummyCorner = Instance.new("UICorner")
dummyCorner.CornerRadius = UDim.new(0, 8)
dummyCorner.Parent = dummyFrame

local dummySelected = Instance.new("TextButton")
dummySelected.Size = UDim2.new(1, 0, 1, 0)
dummySelected.BackgroundTransparency = 1
dummySelected.Text = "Select Dummy"
dummySelected.TextColor3 = Color3.new(1, 1, 1)
dummySelected.Font = Enum.Font.Gotham
dummySelected.TextSize = 16
dummySelected.TextXAlignment = Enum.TextXAlignment.Left
dummySelected.ZIndex = 6
dummySelected.Parent = dummyFrame

local dummyList = Instance.new("ScrollingFrame")
dummyList.Size = UDim2.new(1, 0, 0, 0)
dummyList.Position = UDim2.new(0, 0, 1, 2)
dummyList.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
dummyList.BorderSizePixel = 0
dummyList.ScrollBarThickness = 6
dummyList.ClipsDescendants = true
dummyList.ZIndex = 10
dummyList.Parent = dummyFrame

local dummyLayout = Instance.new("UIListLayout")
dummyLayout.SortOrder = Enum.SortOrder.LayoutOrder
dummyLayout.Padding = UDim.new(0, 2)
dummyLayout.Parent = dummyList

local DummyOptions = {"Dummy1", "Dummy2", "Dummy3", "Dummy4", "Dummy5", "Dummy6"}
local dummyOpen = false
local function toggleDummyDropdown()
	dummyOpen = not dummyOpen
	local target = dummyOpen and 150 or 0
	dummyList:TweenSize(UDim2.new(1, 0, 0, target), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
end
dummySelected.MouseButton1Click:Connect(toggleDummyDropdown)

for _, name in ipairs(DummyOptions) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.ZIndex = 11
	btn.Parent = dummyList
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 6)
	c.Parent = btn
	btn.MouseButton1Click:Connect(function()
		dummySelected.Text = "Selected: " .. name
		toggleDummyDropdown()
	end)
end
dummyLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	dummyList.CanvasSize = UDim2.new(0, 0, 0, dummyLayout.AbsoluteContentSize.Y + 6)
end)

--// Teleport Dropdown (ZIndex fixed)
local tpFrame = Instance.new("Frame")
tpFrame.Size = UDim2.new(0.8, 0, 0, 36)
tpFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
tpFrame.ZIndex = 5
tpFrame.Parent = content
local tpCorner = Instance.new("UICorner")
tpCorner.CornerRadius = UDim.new(0, 8)
tpCorner.Parent = tpFrame

local tpSelected = Instance.new("TextButton")
tpSelected.Size = UDim2.new(1, 0, 1, 0)
tpSelected.BackgroundTransparency = 1
tpSelected.Text = "Select World"
tpSelected.TextColor3 = Color3.new(1, 1, 1)
tpSelected.Font = Enum.Font.Gotham
tpSelected.TextSize = 16
tpSelected.TextXAlignment = Enum.TextXAlignment.Left
tpSelected.ZIndex = 6
tpSelected.Parent = tpFrame

local tpList = Instance.new("ScrollingFrame")
tpList.Size = UDim2.new(1, 0, 0, 0)
tpList.Position = UDim2.new(0, 0, 1, 2)
tpList.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
tpList.BorderSizePixel = 0
tpList.ScrollBarThickness = 6
tpList.ClipsDescendants = true
tpList.ZIndex = 10
tpList.Parent = tpFrame

local tpLayout = Instance.new("UIListLayout")
tpLayout.SortOrder = Enum.SortOrder.LayoutOrder
tpLayout.Padding = UDim.new(0, 2)
tpLayout.Parent = tpList

local Worlds = {}
for i = 1, 25 do table.insert(Worlds, "World" .. i) end
local tpOpen = false
local function toggleTPDropdown()
	tpOpen = not tpOpen
	local target = tpOpen and 150 or 0
	tpList:TweenSize(UDim2.new(1, 0, 0, target), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
end
tpSelected.MouseButton1Click:Connect(toggleTPDropdown)

for _, name in ipairs(Worlds) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.ZIndex = 11
	btn.Parent = tpList
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 6)
	c.Parent = btn
	btn.MouseButton1Click:Connect(function()
		tpSelected.Text = name
		toggleTPDropdown()
		safeFire(function()
			print("Teleport to:", name)
		end)
	end)
end
tpLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	tpList.CanvasSize = UDim2.new(0, 0, 0, tpLayout.AbsoluteContentSize.Y + 6)
end)

--// Minimize Logic
local minimized = false
minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	local targetY = minimized and 34 or 360
	mainFrame:TweenSize(UDim2.new(0, 260, 0, targetY), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true)
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

-----------------------------------------------------
-- [[ AUTO ATTACK GUI ]]
-----------------------------------------------------

local Remote = ReplicatedStorage:WaitForChild("Modules")
	:WaitForChild("Network")
	:WaitForChild("Network")
	:WaitForChild("RemoteEvent")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "AutoAttackGUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.7, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

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

-- tombol toggle attack
local toggleButton = Instance.new("TextButton", frame)
toggleButton.Size = UDim2.new(1, -20, 0, 32)
toggleButton.Position = UDim2.new(0, 10, 0, 40)
toggleButton.Text = "OFF"
toggleButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14

-- dropdown world
local dropdown = Instance.new("TextButton", frame)
dropdown.Size = UDim2.new(1, -20, 0, 32)
dropdown.Position = UDim2.new(0, 10, 0, 84)
dropdown.Text = "Select World: 1"
dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dropdown.TextColor3 = Color3.new(1, 1, 1)
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 13

-- data world
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

dropdown.MouseButton1Click:Connect(function()
	local nextWorld = (tonumber(selectedWorld) % 10) + 1
	selectedWorld = tostring(nextWorld)
	dropdown.Text = "Select World: " .. selectedWorld
end)

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

-----------------------------------------------------
-- [[ HIPHEIGHT GUI ]]
-----------------------------------------------------

local hipGui = Instance.new("ScreenGui", playerGui)
hipGui.Name = "HipHeightGui"
hipGui.ResetOnSpawn = false

local frame2 = Instance.new("Frame", hipGui)
frame2.Size = UDim2.new(0, 180, 0, 100)
frame2.Position = UDim2.new(0.05, 0, 0.2, 0)
frame2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame2.Active = true
frame2.Draggable = true

local toggleBtn = Instance.new("TextButton", frame2)
toggleBtn.Size = UDim2.new(0, 150, 0, 40)
toggleBtn.Position = UDim2.new(0, 15, 0, 20)
toggleBtn.Text = "HipHeight: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)

local closeBtn = Instance.new("TextButton", frame2)
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -25, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

-- tombol minimize jadi icon kecil
local minimizeBtn2 = Instance.new("TextButton", frame2)
minimizeBtn2.Size = UDim2.new(0, 20, 0, 20)
minimizeBtn2.Position = UDim2.new(1, -50, 0, 5)
minimizeBtn2.Text = "-"
minimizeBtn2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeBtn2.TextColor3 = Color3.new(1, 1, 1)

local floatIcon = Instance.new("TextButton", hipGui)
floatIcon.Size = UDim2.new(0, 60, 0, 30)
floatIcon.Position = UDim2.new(0.05, 0, 0.8, 0)
floatIcon.Text = "Hip"
floatIcon.Visible = false
floatIcon.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
floatIcon.TextColor3 = Color3.new(1, 1, 1)
floatIcon.Draggable = true

local humanoid, defaultHipHeight
local isOn = false
local hipHeightValue = 20

local function updateHumanoid(char)
	humanoid = char:WaitForChild("Humanoid")
	defaultHipHeight = humanoid.HipHeight
	if isOn then
		humanoid.HipHeight = hipHeightValue
	end
end

if player.Character then updateHumanoid(player.Character) end
player.CharacterAdded:Connect(updateHumanoid)

toggleBtn.MouseButton1Click:Connect(function()
	if not humanoid then return end
	isOn = not isOn
	if isOn then
		humanoid.HipHeight = hipHeightValue
		toggleBtn.Text = "HipHeight: ON"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		humanoid.HipHeight = defaultHipHeight or 2
		toggleBtn.Text = "HipHeight: OFF"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	end
end)

closeBtn.MouseButton1Click:Connect(function()
	hipGui:Destroy()
end)

minimizeBtn2.MouseButton1Click:Connect(function()
	frame2.Visible = false
	floatIcon.Visible = true
end)

floatIcon.MouseButton1Click:Connect(function()
	frame2.Visible = true
	floatIcon.Visible = false
end)


    end
})
GUI:CreateToggle({
    parent = main, 
    text = "Anti AFK", 
    default = true, 
    callback = function()
-- LocalScript di StarterPlayerScripts
-- Anti-AFK otomatis aktif begitu player join

local player = game.Players.LocalPlayer
local vu = game:GetService("VirtualUser")

player.Idled:Connect(function()
	-- simulasi klik kanan agar dianggap aktif
	vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	task.wait(1)
	vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

print("[Anti-AFK] Aktif otomatis ✅")
    end
})


