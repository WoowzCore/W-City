local PANEL = {}
local curent_panel 
local SelectColor = Color(0,192,0)

local Selects = {
    {Title = "Отключиться", Func = function(luaMenu) RunConsoleCommand("disconnect") end},
    {Title = "Дефолтное меню", Func = function(luaMenu) luaMenu:CloseFast() gui.ActivateGameUI() end},
    {Title = "Traitor Role",
    GamemodeOnly = true,
    CreatedFunc = function(self, parent, luaMenu)
        local btn = vgui.Create( "DLabel", self )
        btn:SetText( "SOE" )
        btn:SetMouseInputEnabled( true )
        btn:SizeToContents()
        btn:SetFont( "ZCity_Small" )
        btn:SetTall( ScreenScale( 15 ) )
        btn:Dock(BOTTOM)
        btn:DockMargin(ScreenScale(20),ScreenScale(10),0,0)
        btn:SetTextColor(Color(255,255,255))
        btn:InvalidateParent()
        btn.RColor = Color(225, 225, 225, 0)
        btn.WColor = Color(225, 225, 225, 255)
        btn.x = btn:GetX()

        function btn:DoClick()
            luaMenu:Close()
            hg.SelectPlayerRole(nil, "soe")
        end
    
        local selfa = self
        function btn:Think()
            self.HoverLerp = selfa.HoverLerp
            self.HoverLerp2 = LerpFT(0.2, self.HoverLerp2 or 0, self:IsHovered() and 1 or 0)
                
            self:SetTextColor(self.RColor:Lerp(self.WColor:Lerp(SelectColor, self.HoverLerp2), self.HoverLerp))
            self:SetX(self.x + ScreenScaleH(40) + self.HoverLerp * ScreenScaleH(50))
        end

        local btn = vgui.Create( "DLabel", btn )
        btn:SetText( "STD" )
        btn:SetMouseInputEnabled( true )
        btn:SizeToContents()
        btn:SetFont( "ZCity_Small" )
        btn:SetTall( ScreenScale( 15 ) )
        btn:Dock(BOTTOM)
        btn:DockMargin(0,ScreenScale(2),0,0)
        btn:SetTextColor(Color(255,255,255))
        btn:InvalidateParent()
        btn.RColor = Color(225, 225, 225, 0)
        btn.WColor = Color(225, 225, 225, 255)
        btn.x = btn:GetX()

        function btn:DoClick()
            luaMenu:Close()
            hg.SelectPlayerRole(nil, "standard")
        end
    
        function btn:Think()
            self.HoverLerp = selfa.HoverLerp
            self.HoverLerp2 = LerpFT(0.2, self.HoverLerp2 or 0, self:IsHovered() and 1 or 0)
    
            self:SetTextColor(self.RColor:Lerp(self.WColor:Lerp(SelectColor, self.HoverLerp2), self.HoverLerp))
            self:SetX(self.x + ScreenScaleH(35))
        end
    end,
    Func = function(luaMenu)
        
    end,
    },
    {Title = "Достижения", Func = function(luaMenu,pp) 
        hg.DrawAchievmentsMenu(pp)
    end},
    {Title = "Настройки", Func = function(luaMenu,pp) 
        hg.DrawSettings(pp) 
    end},
    {Title = "Вид", Func = function(luaMenu,pp) hg.CreateApperanceMenu(pp) end},
    {Title = "Обратно", Func = function(luaMenu) luaMenu:Close() end},
}

surface.CreateFont("ZC_MM_Title", {
    font = "Bahnschrift",
    size = ScreenScale(40),
    weight = 800,
    antialias = true
})

function PANEL:InitializeMarkup()
    return markup.Parse("<font=ZC_MM_Title><colour=2,199,2,255>W</colour>-City</font>\n<font=ZCity_Tiny><colour=105,105,105>" .. game.GetMap() .. "</colour></font>")
end

local clr_gray = Color(255,255,255,25)
local clr_verygray = Color(10,10,19,235)

function PANEL:Init()
    self:SetAlpha(0)
    self:SetSize(ScrW(), ScrH())
    self:Center()
    self:SetTitle("")
    self:SetDraggable(false)
    self:SetBorder(false)
    self:SetColorBG(clr_verygray)
    self:SetDraggable(false)
    self:ShowCloseButton(false)
    curent_panel = nil
    self.Title, self.TitleShadow = self:InitializeMarkup()

    timer.Simple(0, function()
        if self.First then
            self:First()
        end
    end)

    self.lDock = vgui.Create("DPanel", self)
    local lDock = self.lDock
    lDock:Dock(LEFT)
    lDock:SetSize(ScrW() / 4, ScrH())
    lDock:DockMargin(ScreenScale(0), ScreenScaleH(90), ScreenScale(10), ScreenScaleH(90))
    lDock.Paint = function(this, w, h)
        self.Title:Draw(ScreenScale(15), ScreenScale(50), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 255, TEXT_ALIGN_LEFT)
    end

    self.Buttons = {}
    for k, v in ipairs(Selects) do
        if v.GamemodeOnly and engine.ActiveGamemode() ~= "zcity" then continue end
        self:AddSelect(lDock, v.Title, v)
    end


    local bottomDock = vgui.Create("DPanel", self)
    bottomDock:SetPos(ScreenScale(1), ScrH() - ScrH()/10)
    bottomDock:SetSize(ScreenScale(190), ScreenScaleH(40))
    bottomDock.Paint = function(this, w, h) end
    self.panelparrent = vgui.Create("DPanel", self)
    self.panelparrent:SetPos(bottomDock:GetWide()+bottomDock:GetX(), 0)
    self.panelparrent:SetSize(ScrW() - bottomDock:GetWide()*1, ScrH())
    self.panelparrent.Paint = function(this, w, h) end
    
    local git = vgui.Create("DLabel", bottomDock)
    git:Dock(BOTTOM)
    git:DockMargin(ScreenScale(10), 0, 0, 0)
    git:SetFont("ZCity_Tiny")
    git:SetTextColor(clr_gray)
    git:SetText("GitHub: github.com/" .. hg.GitHub_ReposOwner .. "/" .. hg.GitHub_ReposName)
    git:SetContentAlignment(4)
    git:SetMouseInputEnabled(true)
    git:SizeToContents()

    function git:DoClick()
        gui.OpenURL("https://github.com/" .. hg.GitHub_ReposOwner .. "/" .. hg.GitHub_ReposName)
    end

    local version = vgui.Create("DLabel", bottomDock)
    version:Dock(BOTTOM)
    version:DockMargin(ScreenScale(10), 0, 0, 0)
    version:SetFont("ZCity_Tiny")
    version:SetTextColor(clr_gray)
    version:SetText(hg.Version)
    version:SetContentAlignment(4)
    version:SizeToContents()
end

function PANEL:First( ply )
    self:AlphaTo( 255, 0.1, 0, nil )
end

local gradient_d = surface.GetTextureID("vgui/gradient-d")
local gradient_r = surface.GetTextureID("vgui/gradient-u")
local gradient_l = surface.GetTextureID("vgui/gradient-l")

local BackgroundGradientColor = Color(0,102,0,35)
function PANEL:Paint(w,h)
    draw.RoundedBox(0, 0, 0, w, h, self.ColorBG)
    hg.DrawBlur(self, 3)
    surface.SetTexture(gradient_l)
    surface.DrawTexturedRect(0, 0, w, h)
    surface.SetDrawColor(BackgroundGradientColor)
    surface.SetTexture(gradient_d)
    surface.DrawTexturedRect(0, 0, w, h)
end

function PANEL:AddSelect(pParent, Title, tbl)
    local ID = #self.Buttons + 1
    self.Buttons[ID] = vgui.Create("DLabel", pParent)
    local Button = self.Buttons[ID]

    local TitleLower = utf8.lower(Title)
    
    Button:SetText(Title)
    Button:SetMouseInputEnabled(true)
    Button:SetFont("ZCity_Small")
    
    Button:SetTall(ScreenScale(15))
    
    Button:Dock(BOTTOM)
    Button:DockMargin(ScreenScale(15), ScreenScale(3), 0, 0)
    
    Button:SetContentAlignment(4)
    
    Button.Func = tbl.Func
    Button.HoveredFunc = tbl.HoveredFunc
    local LUAMenu = self 
    if tbl.CreatedFunc then tbl.CreatedFunc(Button, self, LUAMenu) end
    Button.RColor = Color(225, 225, 225)
    
    function Button:DoClick()
        if curent_panel == TitleLower then
			for i = 1, 3 do
				surface.PlaySound("shitty/tap_release.wav")
			end
            LUAMenu.panelparrent:AlphaTo(0,0.2,0,function()
                LUAMenu.panelparrent:Remove()
                LUAMenu.panelparrent = nil
                LUAMenu.panelparrent = vgui.Create("DPanel", LUAMenu)
                
                LUAMenu.panelparrent:SetPos(some_coordinates_x, 0)
                LUAMenu.panelparrent:SetSize(some_size_x, some_size_y)
                LUAMenu.panelparrent.Paint = function(this, w, h) end
                curent_panel = nil
            end)
            return 
        end
        some_size_x = LUAMenu.panelparrent:GetWide()
        some_size_y = LUAMenu.panelparrent:GetTall()
        some_coordinates_x = LUAMenu.panelparrent:GetX()
        LUAMenu.panelparrent:AlphaTo(0,0.2,0,function()
            LUAMenu.panelparrent:Remove()
            LUAMenu.panelparrent = nil
            LUAMenu.panelparrent = vgui.Create("DPanel", LUAMenu)
            
            LUAMenu.panelparrent:SetPos(some_coordinates_x, 0)
            LUAMenu.panelparrent:SetSize(some_size_x, some_size_y)
            LUAMenu.panelparrent.Paint = function(this, w, h) end
            Button.Func(LUAMenu, LUAMenu.panelparrent)
            curent_panel = utf8.lower(Title)
        end)
		for i = 1, 3 do
			surface.PlaySound("shitty/tap_depress.wav")
		end
    end

    local RandSymbols = {"@", "#", "$", "%", "&"}
    function Button:Think()
        local IsHovered = self:IsHovered()
        
        self.HoverLerp = LerpFT(0.2, self.HoverLerp or 0, IsHovered and 1 or 0)

        local v = self.HoverLerp
        if SelectColor then
            self:SetTextColor(self.RColor:Lerp(SelectColor, v))
        end

        local IsCurrent = (curent_panel == TitleLower)

        local BaseText = (IsCurrent and Title ~= "Traitor Role") and ">> " .. utf8.upper(Title) or Title
        if IsHovered then
            BaseText = BaseText .. " <<"
        end
        
        local Chars = {}
        for _, Code in utf8.codes(BaseText) do
            table.insert(Chars, utf8.char(Code))
        end

        local L = #Chars
        
        local Chance = IsHovered and 0.9 or 0.999
        
        local ntxt = ""
        for i = 1, L do
            local C = Chars[i]

            if math.random() > Chance then
                C = RandSymbols[math.random(1, #RandSymbols)]
            end

            if IsHovered then
                ntxt = ntxt .. utf8.upper(C)
            else
                ntxt = ntxt .. C
            end
        end
            
        if self:GetText() ~= ntxt then
            surface.PlaySound("shitty/tap-resonant.wav")
            self:SetText(ntxt)
        end
        
        self.LastV = v
    end
end

function PANEL:CloseFast()
    self:Remove()
    self:SetKeyboardInputEnabled(false)
    self:SetMouseInputEnabled(false)
end

function PANEL:Close()
    self:AlphaTo( 0, 0.1, 0, function() self:Remove() end)
    self:SetKeyboardInputEnabled(false)
    self:SetMouseInputEnabled(false)
end

vgui.Register( "ZMainMenu", PANEL, "ZFrame")

hook.Add("OnPauseMenuShow","OpenMainMenu",function()
    local run = hook.Run("OnShowZCityPause")
    if run ~= nil then
        return run
    end

    if MainMenu and IsValid(MainMenu) then
        MainMenu:Close()
        MainMenu = nil
        return false
    end

    MainMenu = vgui.Create("ZMainMenu")
    MainMenu:MakePopup()
    return false
end)
