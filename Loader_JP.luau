-- 日本語表示対応 TokraScript Loader（画面表示版）

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- === 画面に表示するGUIを作る ===
local gui = Instance.new("ScreenGui")
gui.Name = "TokraLoaderJP"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.4, 0.15)
frame.Position = UDim2.fromScale(0.3, 0.4)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.AnchorPoint = Vector2.new(0, 0)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 16)

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.fromScale(1, 1)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextScaled = true
text.Font = Enum.Font.SourceSansBold
text.Text = "📦 TokraScript を読み込み中…"

-- === 少し表示させる ===
task.wait(2)

-- === ここから元のLoader処理 ===
local Loadstring = loadstring or getgenv().loadstring or getfenv().loadstring
local HttpGet = game.HttpGet

if not (Loadstring and HttpGet) then
    text.Text = "❌ この実行環境では実行できません"
    task.wait(3)
    gui:Destroy()
    return
end

local Repository = "https://raw.githubusercontent.com/sladostrastnik/TokraScript/refs/heads/main/Games/"
local PlaceId = tostring(game.PlaceId)
local Suffix = ".luau"

local GameScript
local success = pcall(function()
    GameScript = HttpGet(game, Repository .. PlaceId .. Suffix)
end)

if not success or not GameScript then
    text.Text = "❌ このゲームは TokraScript に対応していません"
    task.wait(3)
    gui:Destroy()
    return
end

text.Text = "✅ 読み込み完了\n▶ スクリプトを実行します…"
task.wait(1)

gui:Destroy()
Loadstring(GameScript)()
