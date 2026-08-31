local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudCrosshair"] = true,
	["CHudDamageIndicator"] = true,
	["CHudGeiger"] = true,
	["CHudSquadStatus"] = true,
	["CHudTrain"] = true,
	["CHudZoom"] = true,
	["CHudSuitPower"] = true,
	["CHUDQuickInfo"] = true,
	["CHudHistoryResource"] = true,
}

local gordon_hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudCrosshair"] = true,
	["CHudSuitPower"] = true,
}

hook.Add("HUDShouldDraw", "homigrad", function(name)
    if not lply or not IsValid(lply) then return end
    
	if hide[name] or lply.PlayerClassName and lply.PlayerClassName == "Gordon" and gordon_hide[name] then
		return false
	end
end)
hook.Add("HUDDrawTargetID", "homigrad", function()
	return false
end)

hook.Add("DrawDeathNotice", "homigrad", function()
	return false
end)

hook.Add("HUDWeaponPickedUp", "HidePickedStuff", function(wep)
	--if not IsValid(lply) or not lply:Alive() then return end
	if IsValid(lply) and lply.PlayerClassName and lply.PlayerClassName == "Gordon" then
		return
	end

	--[[if not IsValid(wep) then return end
	if not wep.GetPrintName then return end
	
	lply:Notify("+ " .. wep:GetPrintName(), 0)]]

	return false
end)

hook.Add("HUDAmmoPickedUp", "HidePickedStuff", function(ammoname, amt)
	if IsValid(lply) and lply.PlayerClassName and lply.PlayerClassName == "Gordon" then
		return
	end

	return false
end)

hook.Add("HUDItemPickedUp", "HidePickedStuff", function(itemname)
	if IsValid(lply) and lply.PlayerClassName and lply.PlayerClassName == "Gordon" then
		return
	end

	return false
end)

hook.Add("HUDDrawPickupHistory", "HidePickedStuff", function()
	if IsValid(lply) and lply.PlayerClassName and lply.PlayerClassName == "Gordon" then
		return
	end

	return false
end)

--local hg_coolvetica = ConVarExists("hg_coolvetica") and GetConVar("hg_coolvetica") or CreateClientConVar("hg_coolvetica", "0", true, false, "changes every text to coolvetica because its good", 0, 1)
local hg_font = ConVarExists("hg_font") and GetConVar("hg_font") or CreateClientConVar("hg_font", "Bahnschrift", true, false, "Change UI text font")
local font = function() -- hg_coolvetica:GetBool() and "Coolvetica" or "Bahnschrift"
    local usefont = "Bahnschrift"

    if hg_font:GetString() ~= "" then
        usefont = hg_font:GetString()
    end

    return usefont
end

--atlaschat.coolvetica
surface.CreateFont("HomigradFont", {
	font = font(),
	size = ScreenScale(10),
	weight = 1100,
	outline = false
})

surface.CreateFont("ScoreboardPlayer", {
	font = font(),
	size = ScreenScale(7),
	weight = 1100,
	outline = false
})

surface.CreateFont("HomigradFontBig", {
	font = font(),
	size = ScreenScale(12),
	weight = 1100,
	outline = false,
	shadow = true
})

surface.CreateFont("HomigradFontMedium", {
	font = font(),
	size = ScreenScale(8),
	weight = 1100,
	outline = false,
})

surface.CreateFont("HomigradFontLarge", {
	font = font(),
	size = ScreenScale(15),
	weight = 1100,
	outline = false
})

surface.CreateFont("HomigradFontGigantoNormous", {
	font = font(),
	size = ScreenScale(25),
	weight = 1100,
	outline = false,
	shadow = false
})

surface.CreateFont("HomigradFontSmall", {
	font = font(),
	size = 17,
	weight = 1100,
	outline = false
})

surface.CreateFont("HomigradFontVSmall", {
	font = font(),
	size = 12,
	weight = 400,
	outline = false
})

local w, h

hook.Add("HUDPaint", "homigrad-dev", function()
	if engine.ActiveGamemode() ~= "sandbox" then return end
	w, h = ScrW(), ScrH()
end)

--draw.SimpleText(lply:Health(),"HomigradFontBig",100,h - 50,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
function draw.CirclePart(x, y, radius, seg, parts, pos)
	local cir = {}
	table.insert(cir, {
		x = x,
		y = y,
		u = 0.5,
		v = 0.5
	})

	for i = 0, seg do
		local a = math.rad((i / seg) * -360 / parts - pos * 360 / parts) + math.pi
		table.insert(cir, {
			x = x + math.sin(a) * radius,
			y = y + math.cos(a) * radius,
			u = math.sin(a) / 2 + 0.5,
			v = math.cos(a) / 2 + 0.5
		})
		--draw.DrawText("asd","HomigradFontBig",x + math.sin(a) * radius,y + math.cos(a) * radius)
	end

	--local a = math.rad(0)
	--table.insert(cir, {x = x + math.sin(a) * radius, y = y + math.cos(a) * radius, u = math.sin(a) / 2 + 0.5, v = math.cos(a) / 2 + 0.5})
	render.PushFilterMin(TEXFILTER.ANISOTROPIC)
	surface.DrawPoly(cir)
	render.PopFilterMin()
end

if IsValid(MENUPANELHUYHUY) then
	MENUPANELHUYHUY:Remove()
	MENUPANELHUYHUY = nil
end

hg.radialOptions = hg.radialOptions or {}
local colBlack = Color(0, 0, 0, 152)
local colOption = Color(40, 0, 55, 152)
local colWhite = Color(255, 255, 255, 255)
local colWhiteTransparent = Color(176, 40, 40, 100)
local colTransparent = Color(0, 0, 0, 0)
local matHuy = Material("vgui/white")
local vecXY = Vector(0, 0)
local vecDown = Vector(0, 1)
local isMouseIntersecting = false
local isMouseOnRadial = false
local current_option = 1
local current_option_select = 1
local hook_Run = hook.Run

local incoentCol = Color(128,0,0)
local taitorCol = Color(155,0,0)

local menuPanel

local colBack = Color(0,0,0)
local function CreateRadialMenu(options_arg, bAutoClose)
	local sizeX, sizeY = ScrW(), ScrH()
	hg.radialOptions = {}
	local paining = lply.organism and lply.organism.pain and (lply.organism.pain > 100 or lply.organism.brain > 0.2) or false
	
	if not options_arg then
		local functions = hook.GetTable()["radialOptions"]
		for i, func in SortedPairs(functions) do
			func()
		end
	end

	local options1 = options_arg or hg.radialOptions

	hg.radialOptions = options1
	
	if IsValid(MENUPANELHUYHUY) then
		MENUPANELHUYHUY:Remove()
		MENUPANELHUYHUY = nil
	end

	local scrH, scrW = ScrH(), ScrW()

	MENUPANELHUYHUY = vgui.Create("DPanel")
	menuPanel = MENUPANELHUYHUY
	menuPanel:SetPos(scrW / 2 - sizeX / 2, scrH / 2 - sizeY / 2)
	menuPanel:SetSize(sizeX, sizeY)
	menuPanel:MakePopup()
	menuPanel:SetKeyBoardInputEnabled(false)
	menuPanel:SetAlpha(0)
	menuPanel:AlphaTo(255,0.2)
	menuPanel.bAutoClose = bAutoClose
	if not options_arg then input.SetCursorPos(sizeX / 2, sizeY / 2) end

	function menuPanel:Close()
		if not IsValid(menuPanel) then return end
		menuPanel:AlphaTo(0,0.1,0,function()
			if IsValid(menuPanel) then
				menuPanel:Remove()
				menuPanel = nil
			end
		end)
	end

	local thinkwait = 0
	if not options_arg then
		menuPanel.Think = function()
			if menuPanel:GetAlpha() < 255 then return end
			if thinkwait > CurTime() then return end
			thinkwait = CurTime() + 0.25
			table.Empty(hg.radialOptions)
			local functions = hook.GetTable()["radialOptions"]
			
			for i, func in SortedPairs(functions) do
				func()
			end
		end
	end
	
	local sizePan = 0
	local optionSelected = {}
	menuPanel.Paint = function(self, w, h)
		local x, y = input.GetCursorPos()
		x = x - sizeX / 2
		y = y - sizeY / 2
		vecXY.x = x
		vecXY.y = y
		local deg = (vecXY:GetNormalized() - vecDown):Angle()
		deg = math.NormalizeAngle((deg[2] - 180) * 2) + 180
		
		local options = {}
		if paining then
			options[#options + 1] = {function() RunConsoleCommand("hg_phrase") end, ""}
		else
			options = options1
		end

		sizePan = LerpFT( menuPanel:GetAlpha() > 100 and 0.05 or 0.25,sizePan,(menuPanel:GetAlpha()/255))
		local viewLerp = Lerp(math.ease.OutExpo(sizePan),0,1)
		for num, option in ipairs(options) do
			local num = num - 1

			local r = scrH * (options_arg ~= nil and 0.4 or 0.45) * viewLerp
			local partDeg = 360 / #options
			local sqrt = math.sqrt(x ^ 2 + y ^ 2)
			isMouseOnRadial = sqrt <= r and sqrt > 4
			isMouseIntersecting = isMouseOnRadial and deg > num * partDeg and deg < (num + 1) * partDeg
			if isMouseIntersecting then current_option = num + 1 end
			if sqrt > 0 and current_option > 0 and num and not intersect_xyPartDeg then return end

			optionSelected[num] = optionSelected[num] or 0
			optionSelected[num] = LerpFT(0.1, optionSelected[num], isMouseIntersecting and 1 or 0)

			if option[3] then
				surface.SetMaterial(matHuy)
				surface.SetDrawColor(isMouseIntersecting and colBlack or colBlack)
				draw.CirclePart(w / 2, h / 2, r, 40, #options, num)
				local count = #option[4]
				
				local selectedPart = count - (math.floor((r - sqrt) / (r / count)))
				
				current_option_select = selectedPart
				for i, opt in pairs(option[4]) do
					local selected = selectedPart == i
					surface.SetMaterial(matHuy)
					surface.SetDrawColor((selected and isMouseIntersecting) and colWhiteTransparent or colTransparent)
					draw.CirclePart(w / 2, h / 2, r * (i / count), 40, #options, num)
					local a = -partDeg * num - partDeg / 2
					a = math.rad(a) + math.pi

					if paining then
						math.randomseed(math.Round(CurTime() / 5 + num + i, 0))
						opt = ""//hg.get_status_message(ply)
						math.randomseed(os.time())
					end

					draw.DrawText(opt, "HomigradFont", scrW / 2 + math.sin(a) * r * (i / count - 0.5 / count), scrH / 2 + math.cos(a) * r * (i / count - 0.5 / count), colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

				continue
			end
			
			surface.SetMaterial(matHuy)
			if option[6] and IsColor(option[6]) then
				if option[7] and IsColor(option[7]) then
					surface.SetDrawColor(option[7]:Lerp(option[6], 1 - optionSelected[num]))
				else
					surface.SetDrawColor(colWhiteTransparent:Lerp(option[6], 1 - optionSelected[num]))
				end
			else
				if option[7] and IsColor(option[7]) then
					surface.SetDrawColor(option[7]:Lerp(options_arg ~= nil and colOption or colBlack, 1 - optionSelected[num]))
				else
					surface.SetDrawColor(colWhiteTransparent:Lerp(options_arg ~= nil and colOption or colBlack, 1 - optionSelected[num]))
				end
			end

			draw.CirclePart(w / 2, h / 2, r * (1 + 0.1 * optionSelected[num]), 30, #options, num)
			local a = -partDeg * num - partDeg / 2
			a = math.rad(a) + math.pi

			if option[5] then
				local a = -partDeg * num - partDeg / 2
				a = math.rad(a) + math.pi

				surface.SetMaterial(option[5])
				surface.SetDrawColor(color_white)
				local sizeW = scrW / 2.25 + math.sin(a) * r * 0.7
				local sizeH = scrH / 2.2 + math.cos(a) * r * 0.7
		
				surface.DrawTexturedRect(sizeW, sizeH, scrW * 0.1, scrH * 0.1)
			else
				local txt = option[2]
				if txt and not options_old then return end
				if paining then
					math.randomseed(math.Round(CurTime() / 5 + num, 0))
					txt = hg.get_status_message(ply)
					math.randomseed(os.time())
				end
				draw.DrawText(txt, "HomigradFont", scrW / 2 + math.sin(a) * r * 0.75, scrH / 2 + math.cos(a) * r * 0.75, colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		if not paining then
			draw.SimpleText(lply:GetPlayerName(),"HomigradFontGigantoNormous",scrW * 0.0215* viewLerp,scrH * 0.042, colBack, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText( ( (lply.role and lply.role.name) or ""),"HomigradFontGigantoNormous" ,scrW * 0.0215 * viewLerp,scrH * 0.098, colBack, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

			local col = lply:GetPlayerColor():ToColor()
			draw.SimpleText(lply:GetPlayerName(),"HomigradFontGigantoNormous",scrW * 0.02 * viewLerp,scrH * 0.04, col, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText( ( (lply.role and lply.role.name) or ""),"HomigradFontGigantoNormous" ,scrW * 0.02 * viewLerp,scrH * 0.095, lply.role and lply.role.color or incoentCol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
	end
end

local function PressRadialMenu(mouseClick)
	local options = hg.radialOptions

	hook_Run("RadialMenuPressed")

	local needed_mouseclick
	if IsValid(menuPanel) and options[current_option] and isMouseOnRadial then
		local func = options[current_option][1]
		if isfunction(func) then needed_mouseclick = func(mouseClick, current_option_select) end
	end

	if needed_mouseclick ~= -1 and IsValid(menuPanel) and mouseClick ~= (needed_mouseclick or 2) and not menuPanel.bAutoClose then
		menuPanel:Close()
	end
end

hg.CreateRadialMenu = CreateRadialMenu
hg.PressRadialMenu = PressRadialMenu

local firstTime  = true
local firstTime2 = true
local firstTime3 = true
local firstTime4 = true
local firstTime5 = true
local firstTime6 = true

hook.Add("HG_OnOtrub", "resetshit", function(ply)
	if ply == lply then
		hook_Run("RadialMenuPressed")

		if IsValid(menuPanel) then
			menuPanel:Close()
		end
	end
end)

hook.Add("PlayerBindPress", "PlayerBindPressExample2huy", function( ply, bind, pressed )
	if string.find(bind, "+menu") then

		if (lply.organism and lply.organism.otrub) then
			return (bind == "+menu") or nil
		end

		if (bind == "+menu") then
			if pressed and not IsValid(MENUPANELHUYHUY) then
				CreateRadialMenu()
			else
				PressRadialMenu(1)
			end
		else
			if lply:IsAdmin() then return end
		end

		return true
	end
end)

hook.Add("Think", "hg-radial-menu", function()
	if (lply.organism and lply.organism.otrub) then

		if IsValid(menuPanel) then
			hook_Run("RadialMenuPressed")
			menuPanel:Close()
		end

		return
	end
	
	if (engine.ActiveGamemode() ~= "sandbox" and input.IsKeyDown(KEY_Q)) or (engine.ActiveGamemode() == "sandbox" and input.IsKeyDown(KEY_C)) then
		if firstTime then
			firstTime = false
		end

		firstTime4 = true
	else
		if firstTime4 then
			firstTime4 = false
		end

		firstTime = true
	end

	if input.IsMouseDown(MOUSE_LEFT) then
		if firstTime2 then
			firstTime2 = false
		end

		firstTime3 = true
	else
		if firstTime3 then
			firstTime3 = false
			PressRadialMenu(1)
		end

		firstTime2 = true
	end

	if input.IsMouseDown(MOUSE_RIGHT) then
		if firstTime5 then
			firstTime5 = false
		end

		firstTime6 = true
	else
		if firstTime6 then
			firstTime6 = false
			PressRadialMenu(2)
		end

		firstTime5 = true
	end
end)

local function dropWeapon()
	RunConsoleCommand("drop")
end

hook.Add("radialOptions", "77", function()
	local organism = lply.organism or {}
	if not organism.otrub and IsValid(lply:GetActiveWeapon()) and lply:GetActiveWeapon():GetClass() ~= "weapon_hands_sh" then
		local tbl = {dropWeapon, "Выбросить"}
		hg.radialOptions[#hg.radialOptions + 1] = tbl
	end
end)

local RandomGestures = {
    {"wave", nil, "Помахать"},
    {"salute", nil, "Отдать честь"},
    {"halt", nil, "Кулак вверх"},
    {"group", nil, "Группируемся"},
    {"forward", nil, "Вперёд!"},
    {"disagree", nil, "Отказ"},
    {"agree", nil, "Согласие"},
    {"dance", nil, "Танцевать"},
    {"becon", nil, "Ко мне"},
    {"muscle", nil, "Стриптиз"},
    {"robot", nil, "Робот"},
    {"laugh", nil, "Смех"},
    {"bow", nil, "Поклон"},
    {"cheer", nil, "Радость"},
    {"zombie", nil, "Напугать"},
	{"point", function() RunConsoleCommand("hg_hand_gesture", "point") end, "Указать"},
    {"thumb_up", function() RunConsoleCommand("hg_hand_gesture" , "thumb_up") end, "Палец вверх"},
	{"fuck you", function() RunConsoleCommand("hg_hand_gesture", "fuckyou") end, "Фак"},
}

hook.Add("radialOptions", "7", function()
    local ply = LocalPlayer()
    local organism = ply.organism or {}

    if ply:Alive() and not organism.otrub and hg.GetCurrentCharacter(ply) == ply then
        if ply.GetPlayerClass and ply:GetPlayerClass() and ply:GetPlayerClass().CanUseGestures ~= nil and not ply:GetPlayerClass().CanUseGestures then return end
		local tbl = {function(mouseClick)
			if mouseClick == 1 then
                local Selected = RandomGestures[math.random(#RandomGestures)]
                if Selected[2] then
                    Selected[2]()
                else
                    RunConsoleCommand("act", Selected[1])
                end
                    
				if (ply.NextFoley or 0) < CurTime() then
					ply:EmitSound("player/clothes_generic_foley_0" .. math.random(5) .. ".wav", 55)
					ply.NextFoley = CurTime() + 1
				end
			else
				local commands = {}
				for i, Gesture in ipairs(RandomGestures) do
					commands[i] = {
						[1] = function()
							if Gesture[2] then
								Gesture[2]()
							else
								RunConsoleCommand("act", Gesture[1])
								if (ply.NextFoley or 0) < CurTime() then
									ply:EmitSound("player/clothes_generic_foley_0" .. math.random(5) .. ".wav", 55)
									ply.NextFoley = CurTime() + 1
								end
							end
						end,
						[2] = Gesture[3]
					}
				end
				CreateRadialMenu(commands)
			end
		end, "Эмоции\nПКМ - Список"}
        hg.radialOptions[#hg.radialOptions + 1] = tbl
    end
end)

local font_size = 50
surface.CreateFont("HG_font", {
	font = "Arial",
	extended = false,
	size = font_size,
	weight = 500,
	outline = true
})

hook.Add("HUDPaint","Identifier",function()
	if lply.organism and lply.organism.otrub then return end
	if not lply:Alive() then return end
	if lply:GetNetVar("disappearance", nil) then return end 
	
	local trace = hg.eyeTrace(lply)
	
	if not trace then return end

	local Size = math.max(math.min(1 - trace.Fraction, 1), 0.1)
	local x, y = trace.HitPos:ToScreen().x, trace.HitPos:ToScreen().y

	if trace.Hit and (trace.Entity:IsRagdoll() or trace.Entity:IsPlayer()) then
		if trace.Entity.PlayerClassName == "sc_infiltrator" then return end
		if trace.Entity:GetNetVar("disappearance", nil) then return end

		draw.NoTexture()

		local col = trace.Entity:GetPlayerColor():ToColor()
		col.a = 255 * Size * 1.5

		local coloutline = (col.r < 50 and col.g < 50 and col.b < 50) and Color(100,100,100) or Color(0,0,0)
		coloutline.a = 255 * Size * 1

		draw.DrawText(trace.Entity:GetPlayerName() or "", "HomigradFontLarge", x + 1, y + 31, coloutline, TEXT_ALIGN_CENTER)

		draw.DrawText(trace.Entity:GetPlayerName() or "", "HomigradFontLarge", x, y + 30, col, TEXT_ALIGN_CENTER)
	end
end)

local hint
local hg_hints = ConVarExists("hg_hints") and GetConVar("hg_hints") or CreateClientConVar("hg_hints", "1", true, false, "Toggle UI hints")

local HintBackgroundColor = Color( 0, 0, 0, 200 )

hook.Add("HUDPaint","EntHints",function()
	if not hg_hints:GetBool() then return end 
	if lply.organism and lply.organism.otrub then return end
	if not lply:Alive() then return end
	
	local trace = hg.eyeTrace(lply)

	if not trace then return end

	HintBackgroundColor.a = LerpFT(0.1, HintBackgroundColor.a, (IsValid(trace.Entity) and trace.Entity.HudHintMarkup) and 200 or 0)

	hg.BasicHudHint(trace.Entity, trace, hint)
end)

function hg.BasicHudHint(ent, trace)
	hint = (IsValid(ent) and ent.HudHintMarkup) or hint

	if not hint then return end

	local x, y = trace.HitPos:ToScreen().x, trace.HitPos:ToScreen().y
	y = y + 145 + -45

	draw.RoundedBox(2, x - hint:GetWidth() / 2 - 2.5, y - 2.5, hint:GetWidth() + 5, hint:GetHeight() + 5, HintBackgroundColor)
	
	hint:Draw(x, y, TEXT_ALIGN_CENTER, nil, 175 * (HintBackgroundColor.a / 200), TEXT_ALIGN_CENTER)

	if ent.AdditionalInfoFunc then
		local str = ent.AdditionalInfoFunc()

		local w, h = surface.GetTextSize(str)
		surface.SetFont("ZCity_Tiny")
		surface.SetTextColor(color_white)
		surface.SetTextPos(x - w * 0.5, y + hint:GetHeight() + h)
		surface.DrawText(str)
	end
end

if game.SinglePlayer() then
	hook.Add("HUDPaint","Exit the singleplayer",function()
		draw.SimpleTextOutlined("Эта срань работает нормально только в мультиплеере!!!", "HomigradFontSmall", ScrW() / 2, ScrH() - 45, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 5, Color(0, 0, 0, 255))
		draw.SimpleTextOutlined("Прошу... УМОЛЯЮ ВАС!!! запустите мультиплеер..."      , "HomigradFontSmall", ScrW() / 2, ScrH() - 20, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 5, Color(0, 0, 0, 255))
	end)
end
