local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodLetters/Ash-Libs/refs/heads/main/source.lua"))()
GUI:CreateMain({
    Name = "Ashlabs",
    title = "Arm Wrestle Simulator",
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
    text = "Auto Claim Online", 
    default = true, 
    callback = function(claim)
	if claim then	
	_G.claim1 = true
	while _G.claim1 == true do
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("1")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("2")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("3")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("6")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("8")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("9")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("11")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TimedRewardService"):WaitForChild("RE"):WaitForChild("onClaim"):FireServer("12")
task.wait(200)
end
		else
		_G.claim1 = false
           end
        print("Toggle state:", claim)
    end
})

GUI:CreateToggle({
    parent = main, 
    text = "Claim Event Duck", 
    default = true, 
    callback = function(event)
if event then
        _G.loop8 = true
	while _G.loop8 == true do
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("Reset"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",1)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",2)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",3)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",4)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",5)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",6)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",7)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",8)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",9)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",10)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",11)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EventPassService"):WaitForChild("RF"):WaitForChild("ClaimReward"):InvokeServer("Free",12)
task.wait(60)
 end
		else
		_G.loop8 = false
           end
        print("Toggle state:", event)
    end
})

GUI:CreateToggle({
    parent = main, 
    text = "Auto Swing", 
    default = true, 
    callback = function(swing)
if swing then
        _G.loop2 = true
	while _G.loop2 == true do
		task.wait()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RE"):WaitForChild("onClick"):FireServer()
           end
		else
		_G.loop2 = false
           end
		print("Toggle state:", swing)
    end
})

GUI:CreateToggle({
    parent = main, 
    text = "Auto Roll Aura", 
    default = true, 
    callback = function(Aura)
if Aura then
        _G.loop3 = true
	while _G.loop3 == true do
		task.wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("AuraService"):WaitForChild("RF"):WaitForChild("Roll"):InvokeServer()
           end
		else
		_G.loop3 = false
           end
		print("Toggle state:", Aura)
    end
})

local main = GUI:CreateTab("Spin and Shop", "webhook") -- You can use IconID we didnt impleemnt lucid or any external icons
GUI:CreateSection({
    parent = main, 
    text = "Shop"
})
GUI:CreateToggle({
    parent = main, 
    text = "Buy Arm Rewind", 
    default = true, 
    callback = function(arm)
if arm then
        _G.loop6 = true
	while _G.loop6 == true do
local args = {"Frosty Merchant",3}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
local args = {"Island Merchant",4}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
local args = {"Island Merchant",5}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
local args = {"Orc Merchant",3}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
local args = {"Orc Merchant",4}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))

task.wait(60)
 end
		else
		_G.loop6 = false
           end
        print("Toggle state:", arm)
    end
})
GUI:CreateToggle({
    parent = main, 
    text = "Buy Shop Summer", 
    default = true, 
    callback = function(shopsummer)
if shopsummer then
        _G.shopsummer1 = true
	while _G.shopsummer1 == true do
local args = {"Pirate Merchant",4}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
local args = {"Pirate Merchant",5}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LimitedMerchantService"):WaitForChild("RF"):WaitForChild("BuyItem"):InvokeServer(unpack(args))
task.wait(60)
 end
		else
		_G.shopsummer1 = false
           end
		 print("Toggle state:", shopsummer)
    end
})


local main = GUI:CreateTab("Battle", "swords") -- You can use IconID we didnt impleemnt lucid or any external icons
GUI:CreateSection({
    parent = main, 
    text = "Summer Island Battle"
})
GUI:CreateToggle({
    parent = main, 
    text = "Auto Crit Hit", 
    default = true, 
    callback = function(Crit)
if Crit then
        _G.Crit1 = true
	while _G.Crit1 == true do
task.wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
task.wait(0.2)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
task.wait(0.4)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestCritHit"):InvokeServer()
           end
		else
		_G.Crit1 = false
           end
print("Toggle state:", Crit)
    end
})
GUI:CreateToggle({
    parent = main, 
    text = "Auto Normal Hit", 
    default = true, 
    callback = function(Hit)
if Hit then
        _G.Hit1 = true
	while _G.Hit1 == true do
		task.wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
task.wait(0.2)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
task.wait(0.4)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestClick"):InvokeServer()
           end
		else
		_G.Hit1 = false
           end
		print("Toggle state:", Hit)
    end
})
GUI:CreateToggle({
    parent = main, 
    text = "Auto Trial 13", 
    default = false, 
    callback = function(losttower)
if losttower then
        _G.losttower1 = true
	while _G.losttower1 == true do
task.wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ChampionshipService"):WaitForChild("RF"):WaitForChild("RequestJoin"):InvokeServer("Medieval")
end
	  		else
		      _G.losttower1 = false
            end
print("Toggle state:", losttower)
    end
})

local main = GUI:CreateTab("Misc", "circle-ellipsis") -- You can use IconID we didnt impleemnt lucid or any external icons
GUI:CreateSection({
    parent = main, 
    text = "Option"
})


GUI:CreateButton({
    parent = main, 
    text = "Anti AFK", 
    callback = function()
local VirtualUser = game:GetService('VirtualUser')
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Anti AFK loaded!",
    Text = "Made by Tuuguu936",
    Button1 = "Okay",
    Duration = 5
})
end})

GUI:CreateButton({
    parent = main, 
    text = "Reedem Code", 
    callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("banker")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("sorryoops")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("timetravel")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("world19")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("bulk")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("superhero")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("tokenstore")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("captain")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("skullbeard")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("pirate")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("athlete")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("tradingback")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("blossom")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("ninja")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("snowops")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("hideout")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("cosmic")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("stocking")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("frostlands")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("polar")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("shiny")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("Christmas")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("hacker")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("classic")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("clans")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("rifted")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("hauntedmanor")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("trainers")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("ghosthunting")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("spooky")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("soon")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("hatching")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("billion")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("Heavenly")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("rework")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("paradise")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("wasteland")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("apocalypse")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("energy")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("royalty")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("performance")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("charms")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("wizard")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("atlantis")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("800mvisits")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("icecold")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("forging")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("noob")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("fixingstuff")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("celebration")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("glassbridge")
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeRedemptionService"):WaitForChild("RE"):WaitForChild("onRedeem"):FireServer("octogames")

end})

local main = GUI:CreateTab("New Event", "squircle") -- You can use IconID we didnt impleemnt lucid or any external icons
GUI:CreateSection({
    parent = main, 
    text = "Option"
})
GUI:CreateToggle({
    parent = main, 
    text = "Auto Dumble Octo", 
    default = true, 
    callback = function(Dumbleocto)
if Dumbleocto then
        _G.Dumbleocto1 = true
	while _G.Dumbleocto1 == true do
		task.wait(10)
   	local args = {
	"GlassBridge",
	"Dumbells",
	"GlassBridge12"
}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RE"):WaitForChild("onGuiEquipRequest"):FireServer(unpack(args))
       end
		else
		_G.Dumbleocto1 = false
           end
        print("Toggle state:", Dumbleocto)
    end
})


GUI:CreateToggle({
    parent = main, 
    text = "Fight Glass Creator", 
    default = true, 
    callback = function(Pethatlon)
if Pethatlon then
        _G.loop50 = true
	while _G.loop50 == true do
local args = {"GlassCreator"}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ArmWrestleService"):WaitForChild("RF"):WaitForChild("RequestStartFight"):InvokeServer(unpack(args))
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RE"):WaitForChild("onClick"):FireServer()
local args = {
	"GlassBridge",
	"Dumbells",
	"GlassBridge12"
}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RE"):WaitForChild("onGuiEquipRequest"):FireServer(unpack(args))
end
		else
		_G.loop50 = false
           end
        print("Toggle state:", Pethatlon)
    end
})



local main = GUI:CreateTab("misc", "cake") -- You can use IconID we didnt impleemnt lucid or any external icons
GUI:CreateSection({
    parent = main, 
    text = "Shortcut"
})
GUI:CreateToggle({
    parent = main, 
    text = "Auto Daily Login", 
    default = true, 
    callback = function(dailylogin)
if dailylogin then
        _G.dailylogin1 = true
			while _G.dailylogin1 == true do
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("DailyRewardService"):WaitForChild("RE"):WaitForChild("onClaimReward"):FireServer()
task.wait(20)
                        end
		else
		_G.dailylogin1 = false
        end
		print("Toggle state:", dailylogin)
    end
})
