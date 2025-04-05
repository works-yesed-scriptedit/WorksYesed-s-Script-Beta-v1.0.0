local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "WorksYesed's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Roading...",
   LoadingSubtitle = "by WorksYesed",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local CharacterTab = Window:CreateTab("home", nil) -- Title, Image
local CharacterSection = CharacterTab:CreateSection("Character")


Rayfield:Notify({
   Title = "WorksYesedScript",
   Content = "Good luck!",
   Duration = 3,
   Image = 4483362458,
})

local Button = CharacterTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
            -- Infinite Jump Script by Ashborn
-- Discord: ashbornthegoat
 
-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
 
-- Get the local player and their character
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
 
-- Infinite jump logic
UserInputService.JumpRequest:Connect(function()
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
   end,
})

local Input = CharacterTab:CreateInput({
   Name = "WalkSpeed",
   CurrentValue = "",
   PlaceholderText = "Enter WalkSpeed",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
            
       -- 入力値が数値かどうかを確認
       local speedValue = tonumber(Text)
       if speedValue then
           getgenv().Enabled = true  -- スピード変更を有効化
           getgenv().Speed = speedValue  -- 入力された値でスピードを設定
           loadstring(game:HttpGet("https://raw.githubusercontent.com/eclipsology/SimpleSpeed/main/SimpleSpeed.lua"))()
       else
           warn("無効な入力です！数値を入力してください。")  -- 数値でない場合のエラーメッセージ
       end
   end,
})

local Input = CharacterTab:CreateInput({
   Name = "JumpPower",
   CurrentValue = "",
   PlaceholderText = "Enter Jump Power",
   RemoveTextAfterFocusLost = false,
   Flag = "Input2",
   Callback = function(Text)
       -- 入力されたテキストを数値に変換
       local jumpPowerValue = tonumber(Text)
       
       -- 数値が正しい場合、ジャンプパワーを設定
       if jumpPowerValue and jumpPowerValue > 0 then
           -- プレイヤーのHumanoidを取得
           local player = game.Players.LocalPlayer
           local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
           
           if humanoid then
               humanoid.JumpPower = jumpPowerValue  -- JumpPowerを設定
               warn("ジャンプパワー（JumpPower）が " .. jumpPowerValue .. " に設定されました。")
           else
               warn("Humanoidが見つかりませんでした。")
           end
       else
           warn("無効な入力です！正しい数値を入力してください。")
       end
   end,
})
