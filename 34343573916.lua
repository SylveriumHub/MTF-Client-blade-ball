local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 450, 0, 290)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BorderSizePixel = 3
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 4.5)
FrameCorner.Parent = Frame

local F = Instance.new("Frame")
F.Size = UDim2.new(0, 450, 0, 45)
F.Position = UDim2.new(0, 0, 0, 0)
F.AnchorPoint = Vector2.new(0, 0)
F.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
F.BorderSizePixel = 0
F.Active = false
F.Draggable = false
F.Parent = Frame

local FCorner = Instance.new("UICorner")
FCorner.CornerRadius = UDim.new(0, 4.5)
FCorner.Parent = F

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0.01, 0)
Close.BackgroundTransparency = 1
Close.Text = "+"
Close.Rotation = 45
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(187, 187, 187)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
   ScreenGui:Destroy()
end)

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = Closw

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.03, 0)
Title.Text = "Moon HubðŸŒ™ - Key System"
Title.TextSize = 17
Title.Font = "ArialBold"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.2, 0)
Instructions.Text = "ðŸ”‘ Get Key to Access Moon HubðŸŒ™."
Instructions.TextSize = 12
Instructions.TextColor3 = Color3.fromRGB(170, 170, 170)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.26, 0)
Instructions.Text = "it Has ONLY 1 Step!"
Instructions.TextSize = 12
Instructions.TextColor3 = Color3.fromRGB(170, 170, 170)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.95, 0, 0.17, 0)
TextBox.Position = UDim2.new(0.04, 0, 0.39, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextBox.PlaceholderText = "Enter Key Here."
TextBox.Text = ""
TextBox.TextSize = 14
TextBox.TextXAlignment = "Left"
TextBox.TextColor3 = Color3.fromRGB(200, 200, 200)
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = TextBox

local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.48, 0, 0.17, 0)
GetKey.Position = UDim2.new(0.51, 0, 0.6, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
GetKey.BorderSizePixel = 1
GetKey.Text = "Get Key"
GetKey.TextSize = 14
GetKey.TextColor3 = Color3.fromRGB(220, 220, 220)
GetKey.Parent = Frame
GetKey.MouseButton1Click:Connect(function()
   setclipboard("https://link-target.net/1101500/key-system")
        TextBox.PlaceholderText = "https://link-target.net/1101500/key-system"
        TextBox.Text = ""
        wait(1.5)
        TextBox.PlaceholderText = "Enter Key Here."
   TextBox.Text = ""
end)

local GetCorner = Instance.new("UICorner")
GetCorner.CornerRadius = UDim.new(0, 5)
GetCorner.Parent = GetKey

local CheckKey = Instance.new("TextButton")
CheckKey.Size = UDim2.new(.48, 0, 0.17, 0)
CheckKey.Position = UDim2.new(0.01, 0, 0.6, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
CheckKey.BorderSizePixel = 1 
CheckKey.Text = "Check Key"
CheckKey.TextSize = 14
CheckKey.TextColor3 = Color3.fromRGB(220, 220, 220)
CheckKey.Parent = Frame
     
local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 5)
CheckCorner.Parent = CheckKey

local JoinDiscord = Instance.new("TextButton")
JoinDiscord.Size = UDim2.new(0.98, 0, 0.17, 0)
JoinDiscord.Position = UDim2.new(0.01, 0, 0.813, 0)
JoinDiscord.BackgroundColor3 = Color3.fromRGB(3, 149, 100)
JoinDiscord.BorderSizePixel = 1
JoinDiscord.Text = "Join Discord Server"
JoinDiscord.TextSize = 14
JoinDiscord.TextColor3 = Color3.fromRGB(220, 220, 220)
JoinDiscord.Parent = Frame
JoinDiscord.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/spHmEyUVdR")
        TextBox.PlaceholderText = "Link Copied to Clipboard"
        TextBox.Text = ""
        wait(1.5)
        TextBox.PlaceholderText = "Enter Key Here."
    TextBox.Text = ""
end)

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 5)
DiscordCorner.Parent = JoinDiscord

local function Key(key)
    return key == "bsdkfghk8" -- Replace this with your key
end

CheckKey.MouseButton1Click:Connect(function()
    if TextBox.Text == "" then
    TextBox.PlaceholderText = "Please, Insert the Key."
    TextBox.Text = ""
    wait(.75)
    TextBox.PlaceholderText = "Enter Key Here."
        else
    local EKey = TextBox.Text
    if Key(EKey) then
        TextBox.PlaceholderText = "Correct Key!"
        TextBox.Text = ""
        wait(.75)
        ScreenGui:Destroy()

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "ðŸŒ™ Lunar Client | Blox Fruits",
    SubTitle = "by lost._thur",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl 
})

local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = "home" }),
    Stats = Window:AddTab({ Title = "Stats", Icon = "bar-chart-4"}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

local Options = Fluent.Options

do

    Fluent:Notify({
        Title = "🌙 Lunar Client",
        Content = "Lunar Client Loaded Sucessfully!",
        SubContent = "",
        Duration = 2.5 -- Set to nil to make the notification not disappear
    })



    Tabs.Farm:AddParagraph({
        Title = "Kitsune Island ðŸ¦Š",
        Content = ""
    })

local Weapon = Tabs.Farm:AddDropdown("Select Weapon", {
    Title = "Select Weapon Farm",
    Values = {"Melee", "Sword", "Fruit"},
    Multi = false,
    Default = 1,
})

Weapon:SetValue("Melee")

Weapon:OnChanged(function(value)
    _G.SelectWeapon = value
end)
task.spawn(function()
	while wait() do
		pcall(function()
			if _G.SelectWeapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			end
		end)
	end
    end)


    local Method = Tabs.Farm:AddDropdown("Method", {
        Title = "Choose Farm Method",
        Values = {"Level Farm", "No Quest", "Nearest Farm"},
        Multi = false,
        Default = "Level Farm",
    })

Method:OnChanged(function(Value)
    _G.FarmMode = Value
    FarmMode = Value
    print("Selected Farm Mode is: ", Method.Value)
end)
spawn(function()
    while wait() do
        if _G.Farmfast and World1 then
            pcall(function()
            if game.Players.LocalPlayer.Data.Level.Value >= 10 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Shanda" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    StardMag = true
                                    FastMon = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                    TP1(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not _G.Farmfast or not v.Parent or v.Humanoid.Health <= 0
                                StardMag = false
                                TP1(CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531))
                                UnEquipWeapon(_G.SelectWeapon)
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Shanda") then
                        TP1(game:GetService("ReplicatedStorage"):FindFirstChild("Shanda").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                    end
                end
            end)
        end
    end
end)
    spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast then
					if game.Players.LocalPlayer.Data.Level.Value >= 75 then
						_G.Farmfast = false
						_G.AutoPlayerHunter = true
					end
				end
			end
		end)
	end)

spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast then
					if game.Players.LocalPlayer.Data.Level.Value >= 200 then
				    	_G.AutoFarm = true
						_G.AutoPlayerHunter = false
					end
				end
			end
		end)
	end)

local Toggle = Tabs.Farm:AddToggle("Auto Farm Selected", {Title = "Auto Farm Selected", Default = false })

Toggle:OnChanged(function(value)
    _G.AutoFarm = value
    _G.RemoveHit = value
    StopTween(_G.AutoFarm)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.RemoveHit == true then
            game:GetService("ReplicatedStorage").Effect.Container.LevelUp:Destroy()
            game:GetService("ReplicatedStorage").Util.Sound:Destroy()
            game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy"):Destroy()
            game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp"):Destroy()
            game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()        
        end
    end)
end)

----///Settings Tab

local Keybind = Tabs.Settings:AddKeybind("Keybind", {
        Title = "Minimize KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "RightControl",
        Callback = function(Value)
Fluent:Notify({
    Title = "Keybind Notify",
    Content = ("Keybind is now:", Value),
    Duration = 4
})
        end,

        ChangedCallback = function(New)
Fluent:Notify({
    Title = "Keybind Notify",
    Content = ("Keybind Changed!", New),
    Duration = 4
})
        end
    })

    Keybind:OnClick(function()
Fluent.Notify({
    Title = "Keybind Notify"
    Content = ("Keybind Clicked:", Keybind:GetState()),
    Duration = 2.5
end)

    Keybind:OnChanged(function()
Fluent:Notify({
    Title = "KeyBind Notify",
    Content = ("KeyBind now is:", Keybind.Value),
    Duration = 2.5
})
end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
Fluent:Notify({
    Title = "Notify",
    Content = "The KeyBind is being held down.",
    Duration = 3
})
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("RightControl", "Toggle")
    
----/// Stats Tab

    local FLVL = Tabs.Farm:AddInput("Fake Level", {
        Title = "Fake Level",
        Default = "",
        Placeholder = "",
        Numeric = true, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(flvl)
            game.Players.LocalPlayer.Data.Level.Value = flvl
Fluent:Notify({
    Title = "Notify",
    Content = ("Your Level now is: ", FLVL.flvl),
    Duration = 4
})    
        end
    })

Input:OnChanged(function()
    
end

end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Notification!",
    Content = "Last config used is now loaded.",
    Duration = 2.5
})

SaveManager:LoadAutoloadConfig()

    else
        TextBox.PlaceholderText = "Invalid key. Try again."
        TextBox.Text = ""
        wait(.75)
        TextBox.PlaceholderText = "Enter Key Here."
        TextBox.Text = ""
        end
    end
end)
