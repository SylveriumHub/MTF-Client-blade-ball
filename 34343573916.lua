local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({

  Title = "🥋 MTX Client Dev Build | Blox Fruits 👑",

  SubTitle = "By MTX Team",

  SaveFolder = "testing | redz lib v5.lua"

})

Window:AddMinimizeButton({

  Button = {

    -- Button Properties

    Image = "rbxassetid://16269686129"

  },

  UICorner = {true,

    -- Corner Properties

    CornerRadius = UDim.new(0.5, 0)

  },

  UIStroke = {false, {

    -- Stroke Properties

  }}

})

local F = Window:MakeTab({"Main Farm", "moon"})

local SF = Window:MakeTab({"Items Farm", "swords"})

local S = Window:MakeTab({"Farm Settings", "settings"})

local SV = Window:MakeTab({"Server Stats", "ghost"})

local ST = Window:MakeTab({"Stats", "bar-chart"})

local RaceV4 = Window:MakeTab({"RaceV4", "rabbit"})

local E = Window:MakeTab({"Esp", "goal"})

local SET = Window:MakeTab({"Sea Events", "Anchor"})

local W = Window:MakeTab({"Teleport", "map-pinned"})

local DF = Window:MakeTab({"Fruit", "apple"})

local SH = Window:MakeTab({"Shop", "shopping-cart"})

local M = Window:MakeTab({"Misc.", "more-horizontal"})

--MTX V2.5 Soon Recode



-- System Requirements Quests

loadstring(game:HttpGet("https://pastebin.com/raw/Ht5HtN4Z"))()



----///Select Weapon

local Section = F:AddSection({"Main Farm | Options"})

F:AddDropdown({

  Name = "Select Weapon",

  Description = "",

  Options = {"Melee","Sword","Fruit","Gun"},

  Default = "Melee",

  Callback = function(value)

    _G.SelectWeapon = value

  end

})

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

F:AddDropdown({

  Name = "Select Farm Mode",

  Description = "",

  Options = {"Auto Farm Level", "No Quest", "Near Farm",},

  Default = "Auto Farm Level",

  Callback = function(value)

    _G.FarmMode = value

    FarmMode = value

  end

})

spawn(function()

  while wait() do

      if FarmMode == "Auto Farm Level" and _G.AutoFarm then

          pcall(function()

              local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text

              if not string.find(QuestTitle, NameMon) then

                  StartMagnet = false

                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")

              end

              if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then

                  StartMagnet = false

                  CheckQuest()

                  if BypassTP then

                  if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then

                  BTP(CFrameQuest)

                  elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then

                  TP1(CFrameQuest)

                  end

              else

                  TP1(CFrameQuest)

              end

              if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then

                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)

                  end

              elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then

                  CheckQuest()

                  if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then

                      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                          if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then

                              if v.Name == Mon then

                                  if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then

                                      repeat task.wait()

                                          EquipWeapon(_G.SelectWeapon)

                                          AutoHaki()                                            

                                          PosMon = v.HumanoidRootPart.CFrame

                                          TP1(v.HumanoidRootPart.CFrame * Pos)

                                          v.HumanoidRootPart.CanCollide = false

                                          v.Humanoid.WalkSpeed = 0

                                          v.Head.CanCollide = false

                                          v.HumanoidRootPart.Size = Vector3.new(70,70,70)

                                          StartMagnet = true

                                          game:GetService'VirtualUser':CaptureController()

                                          game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

                                      until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false

                                  else

                                      StartMagnet = false

                                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")

                                  end

                              end

                          end

                      end

                  else

                      TP1(CFrameMon)

                      UnEquipWeapon(_G.SelectWeapon)

                      StartMagnet = false

                      if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then

                       TP1(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15,10,2))

                      end

                  end

              end

          end)

      end

  end

end)



spawn(function()

  while wait() do

      if FarmMode == "No Quest" and _G.AutoFarm then

          pcall(function()

              local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text

              if not string.find(QuestTitle, NameMon) then

                  StartMagnet = false

                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")

              end

              if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then

                  StartMagnet = false

                  CheckQuest()

                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)

                  if BypassTP then

                  if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude > 1500 then

                  BTP(CFrameMon)

                  elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 1500 then

                  TP1(CFrameMon)

                  end

              else

                  TP1(CFrameMon)

              end

              elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then

                  CheckQuest()

                  if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then

                      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                          if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then

                              if v.Name == Mon then

                                  if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then

                                      repeat task.wait()

                                          EquipWeapon(_G.SelectWeapon)

                                          AutoHaki()                                            

                                          PosMon = v.HumanoidRootPart.CFrame

                                          TP1(v.HumanoidRootPart.CFrame * Pos)

                                          v.HumanoidRootPart.CanCollide = false

                                          v.Humanoid.WalkSpeed = 0

                                          v.Head.CanCollide = false

                                          v.HumanoidRootPart.Size = Vector3.new(70,70,70)

                                          StartMagnet = true

                                          game:GetService'VirtualUser':CaptureController()

                                          game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

                                      until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false

                                  else

                                      StartMagnet = false

                                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")

                                  end

                              end

                          end

                      end

                  else

                      TP1(CFrameMon)

                      UnEquipWeapon(_G.SelectWeapon)

                      StartMagnet = false

                      if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then

                       TP1(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15,10,2))

                      end

                  end

              end

          end)

      end

  end

end)



spawn(function()

while wait() do

  if FarmMode == "Near Farm" and _G.AutoFarm then

    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

              if v.Name and v:FindFirstChild("Humanoid") then

            if v.Humanoid.Health > 0 then

                repeat wait()

                  EquipWeapon(_G.SelectWeapon)

                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then

                      local args = {

                        [1] = "Buso"

                      }

                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                     end

                    topos(v.HumanoidRootPart.CFrame * Pos)

                    v.HumanoidRootPart.CanCollide = false

                    Fastattack = true

                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

              game:GetService("VirtualUser"):CaptureController()

                   game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672), game.Workspace.CurrentCamera.CFrame)

                   AutoFarmNearestMagnet = true

                   PosMon = v.HumanoidRootPart.CFrame

                until not _G.AutoFarmNearest or not v.Parent or v.Humanoid.Health <= 0 

                AutoFarmNearestMagnet = false

                Fastattack = false

            end

        end

    end

  end

end

end)

----/// Auto Farm

local AutoFarm = F:AddToggle({

  Name = "Auto Farm Selected",

  Description = "Auto Farm <font color='rgb(150, 0, 255)'>Selected Mode</font>",

  Default = false

})

AutoFarm:Callback(function(value)

  _G.AutoFarm = value

  _G.Remove_trct = value

  _G.RemoveHit = value

  _G.KobenHeegeen = value

  local effectContainer = game:GetService("ReplicatedStorage").Effect.Container



  local effectsToDestroy = {"Death", "Respawn"}

  

  for _, effectName in ipairs(effectsToDestroy) do

      local effect = effectContainer:FindFirstChild(effectName)

      if effect then

          effect:Destroy()

      end

  end

  StopTween(_G.AutoFarm)

end)

----/// Items Farm

local Section = SF:AddSection({"Items Farm | Options"})

----/// Auto Saber
SF:AddToggle({
  Name = "Auto Saber",
  Default = _G.AutoSaber,
  Callback = function(v)
    _G.Auto_Saber = v
    StopTween(_G.Auto_Saber)
end})

			
 spawn(function()

        while task.wait() do

            if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then

                pcall(function()

                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then

                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then

                            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then

                                topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame

                                wait(1)

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame

                                wait(1)

                            else

                                topos(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))

                            end

                        else

                            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then

                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then

                                    EquipWeapon("Torch")

                                    topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))

                                  else

                                  topos(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))

                                end

                            else

                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then

                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")

                                    wait(0.5)

                                    EquipWeapon("Cup")

                                    wait(0.5)

                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)

                                    wait(0)

                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")

                                else

                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then

                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")

                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then

                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then

										topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 

                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                                if v.Name == "Mob Leader" then

                                                   if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then

                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then

                                                        repeat task.wait()

                                                        AutoHaki()

                                                        EquipWeapon(_G.SelectWeapon)

                                                        v.HumanoidRootPart.CanCollide = false

                                                        v.Humanoid.WalkSpeed = 0

                                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             

                                                        topos(v.HumanoidRootPart.CFrame * Pos)

                                                        game:GetService("VirtualUser"):CaptureController()

                                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))

                                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                                                        until v.Humanoid.Health <= 0 or not _G.Auto_Saber

                                                     end

                                                end

                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then

                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Farm_Mode)

                                                end

                                            end

                                        end

                                     end

                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then

                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")

                                        wait(0.5)

                                        EquipWeapon("Relic")

                                        wait(0.5)

                                        topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))

                                    end

                                end

                            end

                        end

                    else

                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then

                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then

                                    if v.Name == "Saber Expert" then

                                        repeat task.wait()

                                            EquipWeapon(_G.SelectWeapon)

                                            topos(v.HumanoidRootPart.CFrame * Pos)

                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)

                                            v.HumanoidRootPart.Transparency = 1

                                            v.Humanoid.JumpPower = 0

                                            v.Humanoid.WalkSpeed = 0

                                            v.HumanoidRootPart.CanCollide = false

                                            --v.Humanoid:ChangeState(11)

                                            --v.Humanoid:ChangeState(14)

                                            FarmPos = v.HumanoidRootPart.CFrame

                                            MonFarm = v.Name

                                            game:GetService'VirtualUser':CaptureController()

                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),workspace.CurrentCamera.CFrame)

                                        until v.Humanoid.Health <= 0 or not _G.Auto_Saber

                                        if v.Humanoid.Health <= 0 then

                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")

                                        end

                                    end

                                end

                            end

                        end

                    end

                end)

            end

        end

    end)
    
----/// Auto Second Sea

if World1 then

SF:AddSection({
  Name = "Auto Second Sea",
  Default = _G.AutoSecondSea,
  Callback = function(v)
  _G.AutoSecondSea = v
  StopTween(_G.AutoSecondSea)
end})

        spawn(function()

            while wait() do 

                if _G.AutoSecondSea then

                    pcall(function()

                        local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value

                        if MyLevel >= 700 and World1 then

                            if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then

                                local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)

                                repeat topos(CFrame1) wait() until (CFrame1.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false

                                wait(1.1)

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")

                                wait(0.5)

                                EquipWeapon("Key")

                                repeat topos(CFrame.new(1347.7124, 37.3751602, -1325.6488)) wait() until (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false

                                wait(0.5)

                            else

                                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then

                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then

                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                            if v.Name == "Ice Admiral" then

                                                if not v.Humanoid.Health <= 0 then

                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then

                                                        OldCFrameSecond = v.HumanoidRootPart.CFrame

                                                        repeat task.wait()

                                                            AutoHaki()

                                                            EquipWeapon(_G.SelectWeapon)

                                                            v.HumanoidRootPart.CanCollide = false

                                                            v.Humanoid.WalkSpeed = 0

                                                            v.Head.CanCollide = false

                                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                                            v.HumanoidRootPart.CFrame = OldCFrameSecond

                                                            topos(v.HumanoidRootPart.CFrame * Pos)

                                                            game:GetService("VirtualUser"):CaptureController()

                                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))

                                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                                                        until not _G.AutoSecondSea or not v.Parent or v.Humanoid.Health <= 0

                                                    end

                                                else 

                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")

                                                end

                                            end

                                        end

                                    else

                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then

                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5,10,7))

                                        end

                                    end

                                end

                            end

                        end

                    end)

                end

            end

        end)

    end

----/// Auto Third Sea

    if World2 then

SF:AddSection({
  Name = "Auto Third Sea",
  Default = _G.AutoThirdSea,
  Callback = function(v)
    _G.AutoThirdSea = v
    StopTween(_G.AutoThirdSea)
end})


        spawn(function()

            while wait() do

                if _G.AutoThirdSea then

                    pcall(function()

                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then

                            _G.AutoFarm = false

                            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then

                                topos(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))

                                if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then

                                    wait(1.5)

                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")

                                end

                                wait(1.8)

                                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then

                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                        if v.Name == "rip_indra" then

                                            OldCFrameThird = v.HumanoidRootPart.CFrame

                                            repeat task.wait()

                                                AutoHaki()

                                                EquipWeapon(_G.SelectWeapon)

                                                topos(v.HumanoidRootPart.CFrame * Pos)

                                                v.HumanoidRootPart.CFrame = OldCFrameThird

                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                                v.HumanoidRootPart.CanCollide = false

                                                v.Humanoid.WalkSpeed = 0

                                                game:GetService'VirtualUser':CaptureController()

                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")

                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                                            until _G.AutoThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent

                                        end

                                    end

                                elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then

                                    topos(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))

                                end

                            end

                        end

                    end)

                end

            end

        end)

    end

SF:AddToggle({
  Name = "Auto factory",
  Default = _G.AutoFactory,
  Callback = function(v)
    _G.AutoFactory = v
    StopTween(_G.AutoFactory)
end})
        
        spawn(function()

            while wait() do

                pcall(function()

                    if _G.AutoFactory then

                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then

                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                if v.Name == "Core" and v.Humanoid.Health > 0 then

                                    repeat task.wait()

                                        AUTOHAKI()         

                                        EquipWeapon(_G.SelectWeapon)           

                                        topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  

                                        game:GetService("VirtualUser"):CaptureController()

                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))

                                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false

                                end

                            end

                        else

                            topos(CFrame.new(448.46756, 199.356781, -441.389252))

                        end

                    end

                end)

            end

        end)
    
----///Auto Legend swords
    
SF:AddToggle({
  Name = "Auto Legendary Swords",
  Default = _G.AutoBuyLegendarySword,
  Callback = function(v)
    _G.AutoBuyLegendarySword = v
    StopTween(_G.AutoBuyLegendarySword)
end})

spawn(function()

        while wait() do

            if _G.AutoBuyLegendarySword then

                pcall(function()

                    local args = {

                        [1] = "LegendarySwordDealer",

                        [2] = "1"

                    }

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {

                        [1] = "LegendarySwordDealer",

                        [2] = "2"

                    }

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {

                        [1] = "LegendarySwordDealer",

                        [2] = "3"

                    }

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    if _G.AutoBuyLegendarySword_Hop and _G.AutoBuyLegendarySword and World2 then

                        wait(10)

                        Hop()

                    end

                end)

            end 

        end

    end)
    
    
SF:AddToggle({
  Name = "Auto Rengoku",
  Deafult = _G.AutoRengoku,
  Callback = function(v)
    _G.AutoRengoku = v
    StopTween(_G.AutoRengoku)
end})

spawn(function()

        pcall(function()

            while wait() do

                if _G.AutoRengoku then

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then

                        EquipWeapon("Hidden Key")

                        topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))

                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then

                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                            if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then

                                repeat task.wait()

                                    EquipWeapon(_G.SelectWeapon)

                                    AUTOHAKI()

                                    v.HumanoidRootPart.CanCollide = false

                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                    RengokuMon = v.HumanoidRootPart.CFrame

                                    topos(v.HumanoidRootPart.CFrame * Pos)

                                    game:GetService'VirtualUser':CaptureController()

                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

                                    StartRengokuMagnet = true

                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0

                                StartRengokuMagnet = false

                            end

                        end

                    else

                        StartRengokuMagnet = false

                        topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))

                    end

                end

            end

        end)

    end

----/// Auto Bartilo Quest

SF:AddToggle({
  Name = "Auto Bartilo Quest",
  Default = _G.AutoBartilo,
  Callback = function(v)
    _G.AutoBartilo
    StopTween(_G.AutoBartilo)
end})

spawn(function()

        pcall(function()

            while wait(.1) do

                if _G.AutoBartilo then

                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then

                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 

                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then

                                Ms = "Swan Pirate"

                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                    if v.Name == Ms then

                                        pcall(function()

                                            repeat task.wait()

                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)

                                                EquipWeapon(_G.SelectWeapon)

                                                AutoHaki()

                                                v.HumanoidRootPart.Transparency = 1

                                                v.HumanoidRootPart.CanCollide = false

                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                                topos(v.HumanoidRootPart.CFrame * Pos)													

                                                PosMonBarto =  v.HumanoidRootPart.CFrame

                                                game:GetService'VirtualUser':CaptureController()

                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

                                                AutoBartiloBring = true

                                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false

                                            AutoBartiloBring = false

                                        end)

                                    end

                                end

                            else

                                repeat topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10

                            end

                        else

                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10

                            wait(1.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)

                        end 

                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then

                        if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then

                            Ms = "Jeremy"

                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                if v.Name == Ms then

                                    OldCFrameBartlio = v.HumanoidRootPart.CFrame

                                    repeat task.wait()

                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)

                                        EquipWeapon(_G.SelectWeapon)

                                        AutoHaki()

                                        v.HumanoidRootPart.Transparency = 1

                                        v.HumanoidRootPart.CanCollide = false

                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                        v.HumanoidRootPart.CFrame = OldCFrameBartlio

                                        topos(v.HumanoidRootPart.CFrame * Pos)

                                        game:GetService'VirtualUser':CaptureController()

                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false

                                end

                            end

                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then

                            repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10

                            wait(1.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")

                            wait(1)

                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10

                            wait(2)

                        else

                            repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10

                        end

                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then

                        repeat topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10

                        wait(1)

                        repeat topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10

                    end

                end 

            end

        end)

    end)
    
----/// Auto Upgrade Race v2


SF:AddToggle({
  Name = "Auto Upgrade Race v2",
  Default = _G.Auto_EvoRace,
  Callback = function(v)
    _G.Auto_EvoRace = v
    StopTween(_G.Auto_EvoRace)
end})

    spawn(function()

        pcall(function()

            while wait(.1) do

                if _G.Auto_EvoRace then

                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then

                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then

                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))

                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then

                                wait(1.3)

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")

                            end

                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then

                            pcall(function()

                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then

                                    topos(game:GetService("Workspace").Flower1.CFrame)

                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then

                                    topos(game:GetService("Workspace").Flower2.CFrame)

                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then

                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then

                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                            if v.Name == "Zombie" then

                                                repeat task.wait()

                                                    AutoHaki()

                                                    EquipWeapon(_G.SelectWeapon)

                                                    topos(v.HumanoidRootPart.CFrame * Pos)

                                                    v.HumanoidRootPart.CanCollide = false

                                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                                    game:GetService("VirtualUser"):CaptureController()

                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))

                                                    PosMonEvo = v.HumanoidRootPart.CFrame

                                                    StartEvoMagnet = true

                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false

                                                StartEvoMagnet = false

                                            end

                                        end

                                    else

                                        StartEvoMagnet = false

                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))

                                    end

                                end

                            end)

                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")

                        end

                    end

                end

            end

        end)

    end)
    
----/// Auto Superhuman

local Section = SF:AddSection({"Auto Fighting Styles"})
    
SF:AddToggle({
  Name = "Auto Superhuman",
  Default = _G.AutoSuperhuman,
  Callback = function(v)
    _G.AutoSuperhuman = v
    StopTween(_G.AutoSuperhuman)
end})

    spawn(function()

        pcall(function()

            while wait() do 

                if _G.AutoSuperhuman then

                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then

                        UnEquipWeapon("Combat")

                        wait(.1)

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")

                    end   

                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then

                        _G.SelectWeapon = "Superhuman"

                    end  

                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then

                            _G.SelectWeapon = "Black Leg"

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then

                            _G.SelectWeapon = "Electro"

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then

                            _G.SelectWeapon = "Fishman Karate"

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then

                            _G.SelectWeapon = "Dragon Claw"

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then

                            UnEquipWeapon("Black Leg")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")

                        end

                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then

                            UnEquipWeapon("Black Leg")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then

                            UnEquipWeapon("Electro")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")

                        end

                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then

                            UnEquipWeapon("Electro")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then

                            UnEquipWeapon("Fishman Karate")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 

                        end

                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then

                            UnEquipWeapon("Fishman Karate")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 

                        end

                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then

                            UnEquipWeapon("Dragon Claw")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")

                        end

                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then

                            UnEquipWeapon("Dragon Claw")

                            wait(.1)

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")

                        end 

                    end

                end

            end

        end)

    end)
    
----/// Auto Death Step

SF:AddToggle({
  Name = "Auto Death Step",
  Default = _G.AutoDeathStep,
  Callback = function(v)
    _G.AutoDeathStep = v
    StopTween(_G.AutoDeathStep)
end})

spawn(function()

        while wait() do wait()

            if _G.AutoDeathStep then

                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")

                        _G.SelectWeapon = "Death Step"

                    end  

                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")

                        _G.SelectWeapon = "Death Step"

                    end  

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then

                        _G.SelectWeapon = "Black Leg"

                    end 

                else 

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")

                end

            end

        end

    end)

----/// Auto Sharkman Karate

SF:AddToggle({
  Name = "Auto Sharkman Karate",
  Default = _G.AutoSharkman,
  Callback = function(v)
    _G.AutoSharkman = v
    StopTween(AutoSharkman)
end})

spawn(function()

        pcall(function()

            while wait() do

                if _G.AutoSharkman then

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")

                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  

                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then

                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then

                        else 

                            Ms = "Tide Keeper"

                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then   

                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                                    if v.Name == Ms then    

                                        OldCFrameShark = v.HumanoidRootPart.CFrame

                                        repeat task.wait()

                                            AutoHaki()

                                            EquipWeapon(_G.SelectWeapon)

                                            v.Head.CanCollide = false

                                            v.Humanoid.WalkSpeed = 0

                                            v.HumanoidRootPart.CanCollide = false

                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                            v.HumanoidRootPart.CFrame = OldCFrameShark

                                            topos(v.HumanoidRootPart.CFrame*CFrame.new(2,20,2))

                                            game:GetService("VirtualUser"):CaptureController()

                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))

                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSharkman == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")

                                    end

                                end

                            else

                                topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202))

                                wait(3)

                            end

                        end

                    else 

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

                    end

                end

            end

        end)

    end)

if World3 then

SF:AddToggle({
  Name = "Auto Electric Claw",
  Default = _G.AutoElectricClaw,
  Callback = function(v)
    _G.AutoElectricClaw
    StopTween(_G.AutoElectricClaw)
end})

spawn(function()

        pcall(function()

            while wait() do 

                if _G.AutoElectricClaw then

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then

                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

                            _G.SelectWeapon = "Electric Claw"

                        end  

                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

                            _G.SelectWeapon = "Electric Claw"

                        end  

                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then

                            _G.SelectWeapon = "Electro"

                        end 

                    else

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")

                    end

                end

                if _G.AutoElectricClaw then

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then

                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then

                            if _G.AutoFarm == false then

                                repeat task.wait()

                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))

                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")

                                wait(2)

                                repeat task.wait()

                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))

                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10

                                wait(1)

                                repeat task.wait()

                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))

                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10

                                wait(1)

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

                            elseif _G.AutoFarm == true then

                                _G.AutoFarm = false

                                wait(1)

                                repeat task.wait()

                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))

                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")

                                wait(2)

                                repeat task.wait()

                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))

                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10

                                wait(1)

                                repeat task.wait()

                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))

                                until not _G.AutoElectricClaw or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10

                                wait(1)

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

                                _G.SelectWeapon = "Electric Claw"

                                wait(.1)

                                _G.AutoFarm = true

                            end

                        end

                    end

                end

            end

        end)

    end)

SF:AddToggle({
  Name = "Auto Dragon Talon",
  Default = _G.AutoDragonTalon,
  Callback = function(v)
    _G.AutoDragonTalon = v
end})

spawn(function()

        while wait() do

            if _G.AutoDragonTalon then

                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")

                        _G.SelectWeapon = "Dragon Talon"

                    end  

                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")

                        _G.SelectWeapon = "Dragon Talon"

                    end  

                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then

                        _G.SelectWeapon = "Dragon Claw"

                    end 

                else 

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")

                end

            end

        end

    end)

SF:AddToggle({
  Name = "Auto Godhuman",
  Default = _G.AutoGodHuman,
  Callback = function(v)
    _G.AutoGodHuman = v
end})

spawn(function()

    while task.wait() do

		if _G.Auto_God_Human then

			pcall(function()

				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then

					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true) == 1 then

						if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400 then

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")

						end

					else

						game.StarterGui:SetCore("SendNotification", {

							Title = "Notification", 

							Text = "Not Have Superhuman" ,

							Icon = "http://www.roblox.com/asset/?id=16079726256",

							Duration = 2.5

						})

					end

					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true) == 1 then

						if game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400 then

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

						end

					else

						game.StarterGui:SetCore("SendNotification", {

							Title = "Notification", 

							Text = "Not Have Death Step" ,

							Icon = "http://www.roblox.com/asset/?id=16079726256",

							Duration = 2.5

						})

					end

					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true) == 1 then

						if game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400 then

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

						end

					else

						game.StarterGui:SetCore("SendNotification", {

							Title = "Notification", 

							Text = "Not Have SharkMan Karate" ,

							Icon = "http://www.roblox.com/asset/?id=16079726256",

							Duration = 2.5

						})

					end

					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true) == 1 then

						if game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400 then

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")

						end

					else

						game.StarterGui:SetCore("SendNotification", {

							Title = "Notification", 

							Text = "Not Have Electric Claw" ,

							Icon = "http://www.roblox.com/asset/?id=16079726256",

							Duration = 2.5

						})

					end

					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 1 then

						if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400 or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400 then

							if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true), "Bring") then

								game.StarterGui:SetCore("SendNotification", {

									Title = "Notification", 

									Text = "Not Have Enough Material" ,

									Icon = "http://www.roblox.com/asset/?id=16053605732",

									Duration = 2.5

								})

							else

								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")

							end

						end

					else

						game.StarterGui:SetCore("SendNotification", {

							Title = "Notification", 

							Text = "Not Have Dragon Talon" ,

							Icon = "http://www.roblox.com/asset/?id=16079726256",

							Duration = 2.5

						})

					end

				else

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")

				end

			end)

		end

	end

end)

----/// Auto Canvandder

SF:AddToggle({
  Name = "Auto Canvandder",
  Default = _G.AutoCanvandder,
  Callback = function(v)
    _G.AutoCanvandder = v
    StopTween(_G.AutoCanvandder)
end})
    

    local CavandisPos = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)

    spawn(function()

        while wait() do

            if  _G.AutoCanvandder and World3 then

                pcall(function()

                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then

                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                            if v.Name == "Beautiful Pirate" then

                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then

                                    repeat task.wait()

                                        AutoHaki()

                                        EquipWeapon(_G.SelectWeapon)

                                        v.HumanoidRootPart.CanCollide = false

                                        v.Humanoid.WalkSpeed = 0

                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                        topos(v.HumanoidRootPart.CFrame * Pos)

                                        game:GetService("VirtualUser"):CaptureController()

                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))

                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)

                                    until not  _G.AutoCarvender or not v.Parent or v.Humanoid.Health <= 0

                                end

                            end

                        end

                    else

                    if BypassTP then

                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude > 1500 then

			        BTP(CavandisPos)

				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude < 1500 then

				    topos(CavandisPos)

					end

				else

				    topos(CavandisPos)

				end

				    UnEquipWeapon(_G.SelectWeapon)

                    topos(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))

                        if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then

                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))

                        end

                    end

                end)

            end

        end

    end)
    
----/// Auto Pussy Sword

SF:AddToggle({
  Name = "Auto Buddy Sword",
  Default = _G.AutoBudySword,
  Callback = function(v)
    _G.AutoBudySword = v
    StopTween(_G.AutoBudySword)
end})

local BigMomPos = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)

    spawn(function()

        while wait() do

            if _G.AutoBudySword and World3 then

                pcall(function()

                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then

                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                            if v.Name == "Cake Queen" then

                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then

                                    repeat task.wait()

                                        AutoHaki()

                                        EquipWeapon(_G.SelectWeapon)

                                        v.HumanoidRootPart.CanCollide = false

                                        v.Humanoid.WalkSpeed = 0

                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                                        topos(v.HumanoidRootPart.CFrame * Pos)

                                        game:GetService("VirtualUser"):CaptureController()

                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))

                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)

                                    until not _G.AutoBudySword or not v.Parent or v.Humanoid.Health <= 0

                                end

                            end

                        end

                    else

                    if BypassTP then

                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BigMomPos.Position).Magnitude > 1500 then

			        BTP(BigMomPos)

				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BigMomPos.Position).Magnitude < 1500 then

				    topos(BigMomPos)

					end

				else

				    topos(BigMomPos)

				end

				    UnEquipWeapon(_G.SelectWeapon)

                    topos(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875))

                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then

                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2,20,2))

                        end

                    end

                end)

            end

        end

    end)







    
   
----/// Settings

local Section = S:AddSection({"Setting Farm | Options"})

----/// Bring Mob Mode

S:AddDropdown({

  Name = "Bring Mob Mode",

  Description = "",

  Options = {"Low", "Normal", "Super Bring"},

  Default = "Normal",

  Callback = function(value)

    _G.BringMode = value

  end

})

spawn(function()

  while wait(.1) do

      if _G.BringMode then

          pcall(function()

              if _G.BringMode == "Low" then

                  _G.BringMode = 250

              elseif _G.BringMode == "Normal" then

                  _G.BringMode = 300

              elseif _G.BringMode == "Super Bring" then

                  _G.BringMode = 350

              end

          end)

      end

  end

end)

spawn(function()

  while task.wait() do

      pcall(function()

          if _G.BringMonster then

              CheckQuest()

              for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do

                  if _G.AutoFarm and StartMagnet and v.Name == Mon and (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon == "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then

                      v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                      v.HumanoidRootPart.CFrame = PosMon

                      v.Humanoid:ChangeState(14)

                      v.HumanoidRootPart.CanCollide = false

                      v.Head.CanCollide = false

                      if v.Humanoid:FindFirstChild("Animator") then

                          v.Humanoid.Animator:Destroy()

                      end

                      sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                  elseif _G.AutoFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then

                      v.HumanoidRootPart.Size = Vector3.new(50,50,50)

                      v.HumanoidRootPart.CFrame = PosMon

                      v.Humanoid:ChangeState(14)

                      v.HumanoidRootPart.CanCollide = false

                      v.Head.CanCollide = false

                      if v.Humanoid:FindFirstChild("Animator") then

                          v.Humanoid.Animator:Destroy()

                      end

                      sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)

                  end

              end

          end

      end)

  end

end)

----/// FastAttack

S:AddDropdown({

  Name = "Fast Attack Delay",

  Description = "",

  Options = {"Super Fast (0)", "Fast (0.1)", "Recomended (0.15)"},

  Default = "Fast (0.1)",

  Callback = function(value)

    _G.FastAttackDelay = value

  end

})

spawn(function()

  while wait(.1) do

      if _G.FastAttackDelay then

          pcall(function()

              if _G.FastAttackDelay == "Super Fast (0)" then

                  _G.FastAttackDelay = 0

              elseif _G.FastAttackDelay == "Fast (0.1)" then

                  _G.FastAttackDelay = 0.1

              elseif _G.FastAttackDelay == "Recomended (0.15)" then

                  _G.FastAttackDelay = 0.155

              elseif _G.FastAttackDelay == "0.155" then

                  _G.FastAttackDelay = 0.155

              elseif _G.FastAttackDelay == "0.16" then

                  _G.FastAttackDelay = 0.16

              elseif _G.FastAttackDelay == "0.165" then

                  _G.FastAttackDelay = 0.165

              elseif _G.FastAttackDelay == "0.17" then

                  _G.FastAttackDelay = 0.17

              elseif _G.FastAttackDelay == "Normal (0.175)" then

                  _G.FastAttackDelay = 0.175

              elseif _G.FastAttackDelay == "0.18" then

                  _G.FastAttackDelay = 0.18

              elseif _G.FastAttackDelay == "0.185" then

                  _G.FastAttackDelay = 0.185

              end

          end)

      end

  end

end)

function GetBladeHit()

  local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))

  local CmrFwLib = CombatFrameworkLib[2]

  local p13 = CmrFwLib.activeController

  local weapon = p13.blades[1]

  if not weapon then 

      return weapon

  end

  while weapon.Parent ~= game.Players.LocalPlayer.Character do

      weapon = weapon.Parent 

  end

  return weapon

end

function AttackHit()

  local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))

  local CmrFwLib = CombatFrameworkLib[2]

  local plr = game.Players.LocalPlayer

  for i = 1, 1 do

      local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)

      local cac = {}

      local hash = {}

      for k, v in pairs(bladehit) do

          if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then

              table.insert(cac, v.Parent.HumanoidRootPart)

              hash[v.Parent] = true

          end

      end

      bladehit = cac

      if #bladehit > 0 then

          pcall(function()

              CmrFwLib.activeController.timeToNextAttack = 1

              CmrFwLib.activeController.attacking = false

              CmrFwLib.activeController.blocking = false

              CmrFwLib.activeController.timeToNextBlock = 0

              CmrFwLib.activeController.increment = 3

              CmrFwLib.activeController.hitboxMagnitude = 60

              CmrFwLib.activeController.focusStart = 0

              game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBladeHit()))

              game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")

          end)

      end

  end

end

spawn(function()

  while wait(.1) do

      if _G.FastAttack then

          pcall(function()

              repeat task.wait(_G.FastAttackDelay)

                  AttackHit()

              until not _G.FastAttack

          end)

      end

  end

end)

local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)

CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

y = debug.getupvalues(CombatFrameworkR)[2]

spawn(function()

    game:GetService("RunService").RenderStepped:Connect(function()

        if _G.FastAttack then

            if typeof(y) == "table" then

                pcall(function()

                    CameraShaker:Stop()

                    y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)

                    y.activeController.timeToNextAttack = 0

                    y.activeController.hitboxMagnitude = 60

                    y.activeController.active = false

                    y.activeController.timeToNextBlock = 0

                    y.activeController.focusStart = 1655503339.0980349

                    y.activeController.increment = 1

                    y.activeController.blocking = false

                    y.activeController.attacking = false

                    y.activeController.humanoid.AutoRotate = true

                end)

            end

        end

    end)

end)

spawn(function()

    game:GetService("RunService").RenderStepped:Connect(function()

        if _G.FastAttack or _G.FastAttackCambodiakak == true then

            game.Players.LocalPlayer.Character.Stun.Value = 0

            game.Players.LocalPlayer.Character.Busy.Value = false        

        end

    end)

end)

    local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)

    CamShake:Stop()

    local Client = game.Players.LocalPlayer

    local STOP = require(Client.PlayerScripts.CombatFramework.Particle)

    local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)

    spawn(function()

        while task.wait() do

            pcall(function()

                if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end

                if not shared.cpc then shared.cpc = STOP.play end

                    STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)

                    local Hits = STOPRL.getBladeHits(b,c,d)

                    if Hits then

                        if _G.FastAttack then

                            STOP.play = function() end

                            a:Play(0.01,0.01,0.01)

                            func(Hits)

                            STOP.play = shared.cpc

                            wait(a.length * 0.5)

                            a:Stop()

                        else

                            a:Play()

                        end

                    end

                end

            end)

        end

    end)

----/// Remove Lag Farm

spawn(function()

	while wait() do

		if _G.KobenHeegeen then

			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false

		else

			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true

		end

	end

end)

  spawn(function()

	while wait() do

		if _G.Remove_trct then

			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false

		else

			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true

		end

	end

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

----/// Warp

local Section = W:AddSection({"Warp | Options"})

---/// Stop Tween

local Button = W:AddButton({"Stop All Tween", function(Value)

  topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)

  _G.Clip = false

end})

----/// Auto Set Spawn

local SetSpawnPoint = W:AddToggle({

  Name = "SetSpawn [active for Tp Bypass]",

  Default = false

})

SetSpawnPoint:Callback(function(Value)

  _G.Set = value

end)

spawn(function()

  while wait() do

     if _G.Set then

        pcall(function()

        local args = {

        [1] = "SetSpawnPoint"

        }

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

     end)

   end

 end

end)

----/// Teleport

if World1 then

  local Dropdown = W:AddDropdown({

      Name = "Select Island",

      Description = "",

      Options = {"WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village", "Desert", "Snow Island", "MarineFord", "Colosseum", "Sky Island 1", "Prison", "Magma Village", "thirteen", "Under Water Island", "Fountain City"},

      Default = {"Jungle"},

      Callback = function(value)

          _G.SelectIsland = value

          _G.SelectWarp = value

      end

    })

  end

  if World2 then

      local Dropdown = W:AddDropdown({

          Name = "Select Island",

          Description = "",

          Options = {"The Cafe", "Frist Spot", "Dark Area", "Flamingo Mansion", "Flamingo Room", "Green Zone", "Factory", "Colossuim", "Zombie Island", "Two Snow Mountain", "Punk Hazard", "Cursed Ship", "Ice Castle", "Forgotten Island", "Ussop Island", "Mini Sky Island"},

          Default = {"The Cafe"},

          Callback = function(value)

              _G.SelectIsland = value

              _G.SelectWarp = value

          end

        })

      end

      if World3 then

          local Dropdown = W:AddDropdown({

              Name = "Select Island",

              Description = "",

              Options = {"Mansion", "Port Town", "Great Tree", "Castle On The Sea", "MiniSky", "Hydra Island", "Floating Turtle", "Haunted Castle", "Ice Cream Island", "Peanut Island", "Cake Island",  "Cocoa Island", "Candy Island", "tike outpost New"},

              Default = {"Mansion"},

              Callback = function(value)

                  _G.SelectIsland = value

                  _G.SelectWarp = value

              end

            })

          end

          local Teleport = W:AddToggle({

            Name = "Go to selected island",

            Default = false

          })

          Teleport:Callback(function(value)

            _G.TeleportIsland = value

            if _G.TeleportIsland == true then

                repeat wait()

                    if _G.SelectIsland == "WindMill" then

                        topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))

                    elseif _G.SelectIsland == "Marine" then

                        topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))

                    elseif _G.SelectIsland == "Middle Town" then

                        topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))

                    elseif _G.SelectIsland == "Jungle" then

                        topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))

                    elseif _G.SelectIsland == "Pirate Village" then

                        topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))

                    elseif _G.SelectIsland == "Desert" then

                        topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))

                    elseif _G.SelectIsland == "Snow Island" then

                        topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))

                    elseif _G.SelectIsland == "MarineFord" then

                        topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))

                    elseif _G.SelectIsland == "Colosseum" then

                        topos( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))

                    elseif _G.SelectIsland == "Sky Island 1" then

                        topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))

                    elseif _G.SelectIsland == "Sky Island 2" then  

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))

                    elseif _G.SelectIsland == "Sky Island 3" then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))

                    elseif _G.SelectIsland == "Prison" then

                        topos( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))

                    elseif _G.SelectIsland == "Magma Village" then

                        topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))

                    elseif _G.SelectIsland == "Under Water Island" then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))

                    elseif _G.SelectIsland == "Fountain City" then

                        topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))

                    elseif _G.SelectIsland == "Shank Room" then

                        topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))

                    elseif _G.SelectIsland == "Mob Island" then

                        topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))

                    elseif _G.SelectIsland == "The Cafe" then

                        topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))

                    elseif _G.SelectIsland == "Frist Spot" then

                        topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))

                    elseif _G.SelectIsland == "Dark Area" then

                        topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))

                    elseif _G.SelectIsland == "Flamingo Mansion" then

                        topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))

                    elseif _G.SelectIsland == "Flamingo Room" then

                        topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))

                    elseif _G.SelectIsland == "Green Zone" then

                        topos( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))

                    elseif _G.SelectIsland == "Factory" then

                        topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))

                    elseif _G.SelectIsland == "Colossuim" then

                        topos( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))

                    elseif _G.SelectIsland == "Zombie Island" then

                        topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))

                    elseif _G.SelectIsland == "Two Snow Mountain" then

                        topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))

                    elseif _G.SelectIsland == "Punk Hazard" then

                        topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))

                    elseif _G.SelectIsland == "Cursed Ship" then

                        topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))

                    elseif _G.SelectIsland == "Ice Castle" then

                        topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))

                    elseif _G.SelectIsland == "Forgotten Island" then

                        topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))

                    elseif _G.SelectIsland == "Ussop Island" then

                        topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))

                    elseif _G.SelectIsland == "Mini Sky Island" then

                        topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))

                    elseif _G.SelectIsland == "Great Tree" then

                        topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))

                    elseif _G.SelectIsland == "Castle On The Sea" then

                        topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))

                    elseif _G.SelectIsland == "MiniSky" then

                        topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))

                    elseif _G.SelectIsland == "Port Town" then

                        topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))

                    elseif _G.SelectIsland == "Hydra Island" then

                        topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))

                    elseif _G.SelectIsland == "Floating Turtle" then

                        topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))

                    elseif _G.SelectIsland == "Mansion" then

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))

                    elseif _G.SelectIsland == "Haunted Castle" then

                        topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))

                    elseif _G.SelectIsland == "Ice Cream Island" then

                        topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))

                    elseif _G.SelectIsland == "Peanut Island" then

                        topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))

                    elseif _G.SelectIsland == "Cake Island" then

                        topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))

                    elseif _G.SelectIsland == "Cocoa Island" then

                        topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))

                    elseif _G.SelectIsland == "Candy Island" then

                        topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))

                    elseif _G.SelectIsland == "tike outpost New" then

                    topos(CFrame.new(-16213, 9, 438))

                    end

                until not _G.TeleportIsland

            end

            StopTween(_G.TeleportIsland)

        end)

        local Button = W:AddButton({"Bypass Tp", function()

          if _G.TeleportWarp == "Manslon" then

          elseif _G.SelectWarp == "WindMill" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Marine" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Middle Town" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Jungle" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Pirate Village" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Desert" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688)

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Snow Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469)

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "MarineFord" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Colosseum" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Sky Island 1" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Prison" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Magma Village" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Under Water Island" then

              wait(.1)

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              elseif _G.SelectWarp == "Fountain City" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Shank Room" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1442.16553, 29.8788261, -28.3547478)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Mob Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2850.20068, 7.39224768, 5354.99268)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "The Cafe" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Frist Spot" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Dark Area" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Flamingo Mansion" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()      

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")  

          elseif _G.SelectWarp == "Flamingo Room" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2284.4140625, 15.152037620544, 875.72534179688)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()        

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Green Zone" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()      

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")  

          elseif _G.SelectWarp == "Factory" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(424.12698364258, 211.16171264648, -427.54049682617)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()      

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")  

          elseif _G.SelectWarp == "Colossuim" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()  

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")      

          elseif _G.SelectWarp == "Zombie Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()       

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint") 

          elseif _G.SelectWarp == "Two Snow Mountain" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938)

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()    

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")    

          elseif _G.SelectWarp == "Punk Hazard" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Cursed Ship" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(923.40197753906, 125.05712890625, 32885.875)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Ice Castle" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Forgotten Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Ussop Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Mini Sky Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-288.74060058594, 49326.31640625, -35248.59375)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Great Tree" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Castle On The Sea" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5085.23681640625, 316.5072021484375, -3156.202880859375)

          elseif _G.SelectWarp == "MiniSky" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Port Town" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Hydra Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5749.7861328125, 611.9736938476562, -276.2497863769531)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

          elseif _G.SelectWarp == "Floating Turtle" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625)

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Mansion" then

              wait(.1)

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Haunted Castle" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Ice Cream Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Peanut Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375)

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Cake Island" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375) 

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Sea to Treats Old" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(508.21466064453125, 25.07753562927246, -12438.2294921875) 

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

          elseif _G.SelectWarp == "Sea to Treats" then

              wait(.1)

              game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1141.0223388671875, 47.25519561767578, -14204.609375) 

              local player = game.Players.LocalPlayer

              local character = player.Character

              local humanoid = character:WaitForChild("Humanoid")

              humanoid.Health = 0

              game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")

              elseif _G.SelectWarp == "tike outpost" then

                  wait(.1)

                  game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16213, 9, 438) 

                  local player = game.Players.LocalPlayer

                  local character = player.Character

                  local humanoid = character:WaitForChild("Humanoid")

                  humanoid.Health = 0

                  game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()

                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")               

          end

   end})



   local Section = SH:AddSection({"Shop | Abilities"})







   SH:AddButton({"Geppo[10k]", function()

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")    

   

     end})

   

     

   

   SH:AddButton({"Buso Haki[25k]", function()

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")    

   

     end})

   

     

   

   SH:AddButton({"Soru[50k]", function()

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")

   

     end})

   

     

   

   SH:AddButton({"Ken Haki[750k]", function()

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")

   

     end})

   

     

   

   local Section = SH:AddSection({"Shop | Fighting Styles"})

   

   

   

   SH:AddButton({"Dark Step[150k]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")

   

     end})

   

     

   

   SH:AddButton({"Electro[500k]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")

   

   

   

     end})

   

     

   

   SH:AddButton({"Fishman-Karate[750k]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")

   

     end})

   

     

   

   SH:AddButton({"Dragon Breath[1.5k f]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")

   

     end})

   

     

   

   SH:AddButton({"Super Human[3mi]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")

   

     end})

   

     

   

   SH:AddButton({"Death Step[2.5mi + 5k f]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")

   

     end})

   

     

   

   SH:AddButton({"Sharkman-Karate[2.5mi + 5k f]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

   

     end})

   

     

   

   SH:AddButton({"Electric-Claw[3mi + 5k f]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true)

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

   

     end})

   

     

   

   SH:AddButton({"Dragon Talon[3mi + 5k f]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true)

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")

   

     end})

   

     

   

   SH:AddButton({"God Human[5mi + 5k f]", function()

   

       local args = {

   

       [1] = "BuyGodhuman"

   

   }

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Sanguine Art[5mi + 5k f]", function()

   

       local args = {

   

       [1] = "BuySanguineArt"

   

   }

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

     end})

   

     

   

   local Section = SH:AddSection({"Shop | Swords"})

   

   

   

   SH:AddButton({"Katana[5k]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")

   

     end})

   

     

   

   SH:AddButton({"Cutlass[5k]", function()

   

       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")

   

     end})

   

     

   

   SH:AddButton({"Iron Mace[25k]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Iron Mace"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Pipe[100k]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Pipe"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Dual Katana[12k]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Dual Katana"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Triple Katana[60k]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Triple Katana"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Dual-Headed Blade[400k]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Dual-Headed Blade"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Soul Cane[750k]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Soul Cane"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Bisento[1mi]", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Bisento"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   local Section = SH:AddSection({"Shop | Accessories"})

   

   

   

   SH:AddButton({"Black Cape", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Black Cape"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Swordsman Hat", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Swordsman Hat"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Tomoe Ring", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Tomoe Ring"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   local Section = SH:AddSection({"Shop | Guns"})

   

     

   

   SH:AddButton({"Slingshot", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Slingshot"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Musket", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Musket"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Refined Slingshot", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Refined Slingshot"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Cannon", function()

   

       local args = {

   

         [1] = "BuyItem",

   

         [2] = "Cannon"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Kabucha", function()

   

       local args = {

   

       [1] = "BlackbeardReward",

   

       [2] = "Slingshot",

   

       [3] = "1"

   

   }

   

   

   

   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Bizarre Rifle", function()

   

       local args = {

   

         [1] = "Ectoplasm",

   

         [2] = "Buy",

   

         [3] = 1

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   local Section = SH:AddSection({"Shop | Races"})

   

     

   

   SH:AddButton({"Cyborg Race[2.5k f]", function()

   

       local args = {

   

         [1] = "CyborgTrainer",

   

         [2] = "Buy"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Ghoul Race[100 Ectoplasms]", function()

   

       local args = {

   

         [1] = "Ectoplasm",

   

         [2] = "BuyCheck",

   

         [3] = 4

   

       }

   

     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

       local args = {

   

         [1] = "Ectoplasm",

   

         [2] = "Change",

   

         [3] = 4

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   local Section = SH:AddSection({"Shop | Others"})

   

   

   

   SH:AddButton({"Random Race", function()

   

       local args = {

   

         [1] = "BlackbeardReward",

   

         [2] = "Reroll",

   

         [3] = "2"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Stat Refund", function()

   

       local args = {

   

         [1] = "BlackbeardReward",

   

         [2] = "Refund",

   

         [3] = "2"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})

   

     

   

   SH:AddButton({"Law Microchip", function()

   

       local args = {

   

         [1] = "BlackbeardReward",

   

         [2] = "Microchip",

   

         [3] = "2"

   

       }	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

   

   

   

     end})





     local FrozenIsland = SV:AddParagraph({"Frozen Island Check..."})  

     spawn(function()

         pcall(function()

             while wait() do

                 if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then

                     FrozenIsland:Set("🟢 : Frozen Dimension Spawning")

                 else

                     FrozenIsland:Set("🔴 : Frozen Dimension Not Found")

                 end

             end

         end)

     end)

     local CheckMoon = SV:AddParagraph({"Moon Check..."})    

     task.spawn(function()

             while task.wait() do

                 pcall(function()

                     if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then

                      CheckMoon:Set("🌕 : Full Moon 100%")

                     elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then

                      CheckMoon:Set("🌖 : Full Moon 75%")

                     elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then

                      CheckMoon:Set("🌗 : Full Moon 50%")

                     elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then

                      CheckMoon:Set("🌘 : Full Moon 25%")

                     elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then

                      CheckMoon:Set("🌘: Full Moon 15%")

                     else

                      CheckMoon:Set("❕ Wait For Moon...")

                     end

                 end)

             end

     end)



----/// Misc

local Section = M:AddSection({"Misc | Options"})

----/// Auto Rejoin

local AutoRejoin = M:AddToggle({

  Name = "Auto Rejoin",

  Default = true

})

AutoRejoin:Callback(function(Value)

  _G.AutoRejoin = value

end)

spawn(function()

  while wait() do

      if _G.AutoRejoin then

              getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)

                  if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then

                      game:GetService("TeleportService"):Teleport(game.PlaceId)

                  end

               end)

          end

      end

  end)

  ----/// Anti AFK

  local AntiAFK = M:AddToggle({

    Name = "Anti AFK",

    Default = true

  })

  AntiAFK:Callback(function(Value)

    local vu = game:GetService("VirtualUser")

    repeat wait() until game:IsLoaded() 

    game:GetService("Players").LocalPlayer.Idled:connect(function()

    game:GetService("VirtualUser"):ClickButton2(Vector2.new())

        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

        wait(1)

        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

    end)

  end)

  local FastAttack = S:AddToggle({

    Name = "FastAttack",

    Default = true

  })

  FastAttack:Callback(function(value)

    _G.FastAttack = value

  end)

  local Bring = S:AddToggle({

    Name = "Bring Mob",

    Default = true

  })

  Bring:Callback(function(value)

    _G.BringMonster = value

  end)

  ----/// Anti Cheat Bypass

    local AntiCheatBypass = M:AddToggle({

    Name = "Anti Cheat Bypass Activated ✅",

    Default = true

  })

  AntiCheatBypass:Callback(function(value)

    _G.SafeFarm = value

    CheckAntiCheatBypass() 

  end)

  function CheckAntiCheatBypass()

    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do

        if v:IsA("LocalScript") then

            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then

                v:Destroy()

            end

        end

     end

     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do

        if v:IsA("LocalScript") then

            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then

                v:Destroy()

            end

        end

     end

    end

   CheckAntiCheatBypass()

   local Paragraph = M:AddParagraph({"Window", "Window Settings Color"})

   M:AddButton({"Dark + cyan", function()

    redzlib:SetTheme("Dark")

  end})

  

  M:AddButton({"Darker + blue", function()

    redzlib:SetTheme("Darker")

  end})

  

  M:AddButton({"Darker + Purple", function()

    redzlib:SetTheme("Purple")

  end})