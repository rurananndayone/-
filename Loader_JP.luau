-- 日本語表示対応 TokraScript Loader

local Loadstring = loadstring or getgenv().loadstring or getfenv().loadstring
local HttpGet = game.HttpGet

if not (Loadstring and HttpGet) then
    warn("❌ この実行環境ではスクリプトを実行できません")
    return
end

print("📦 TokraScript を読み込み中…")

local Repository = "https://raw.githubusercontent.com/sladostrastnik/TokraScript/refs/heads/main/Games/"
local PlaceId = tostring(game.PlaceId)
local Suffix = ".luau"

local GameScript
local success = pcall(function()
    GameScript = HttpGet(game, Repository .. PlaceId .. Suffix)
end)

if not success or not GameScript then
    warn("❌ このゲームは TokraScript に対応していません")
    return
end

print("✅ スクリプトの読み込み完了")
print("▶ スクリプトを実行します…")

Loadstring(GameScript)()
