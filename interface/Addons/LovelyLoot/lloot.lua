--starting over from scratch!  LL 2.0
local LL = CreateFrame("Frame")
local llmodel = CreateFrame("PlayerModel", nil, LootFrame)
local LSM = LibStub("LibSharedMedia-3.0")
local widgetLists = AceGUIWidgetLSMlists
local frames = {LootFrame, GroupLootFrame1, GroupLootFrame2, GroupLootFrame3, GroupLootFrame4,
				BonusRollLootWonFrame, BonusRollMoneyWonFrame}
local LootFrame = LootFrame
local GLC = GroupLootContainer
local SkinFrames, db, colorR, colorG, colorB, MoveGroupLootFrames, GLCmover
local showMover = false

local defaultValues = {
	lfUnlocked = true,
	bg = "Blizzard Dialog Background",
	border = "Blizzard Dialog",
	borderWidth = 22,
	inset = 5,
	bgColor = {r = 1, g = 1, b = 1, a = 1},
	borderColor = {r = 1, g = 1, b = 1, a = 1},
	sbar = "Blizzard",
	sbarColor = {r = 1, g = 1, b = 0},
	rollAnchor = {
		anch1 = "BOTTOM",
		anch2 = "BOTTOM",
		xpos = 0, ypos = 60},
}

local options = {
	name = "Lovely Loot",
	type = "group",
	args = {
		lfUnlocked = {
			name = "Unlock LootFrame",
			desc = "If checked, the LootFrame is unlocked and you can drag it on your screen.",
			type = "toggle",
			get = function() return db.lfUnlocked end,
			set = function()
						db.lfUnlocked = not db.lfUnlocked
						LootFrame:EnableMouse(db.lfUnlocked)
						LootFrame:SetUserPlaced(true)
					end,
			order = 1,
		},
		GLCmover = {
			name = "Move GroupLoot Frames",
			desc = "If checked, an anchor is shown and you can drag it on your screen. The loot frames will follow suit. (NOTE: Unless using another addon to move them, the achievement popups are anchored to the group loot frames as well.)",
			type = "toggle",
			get = function() return showMover end,
			set = function()
						showMover = not showMover
						MoveGroupLootFrames(showMover)
					end,
			order = 2,
		},
		spacer1 = {
			name = " ",
			type = "description",
			width = "full",
			order = 3,
		},
		divider1 = {
			name = "Appearance",
			type = "header",
			order = 4,
		},
		bg = {
			name = "Background",
			desc = "Texture to use as the background of the loot frames.",
			type = "select",
			dialogControl = "LSM30_Background",
			values = widgetLists.background,
			get = function()
					return db.bg
				end,
			set = function(self, bg)
						db.bg = bg
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 5,
		},
		bgColor = {
			name = "Background Color/Alpha",
			desc = "The background color and transparency.\n\nIf you wish to use a custom background texture and do not want it colored, set this to white.",
			type = "color",
			hasAlpha = true,
			get = function() return db.bgColor.r, db.bgColor.g, db.bgColor.b, db.bgColor.a end,
			set = function(_,r,g,b,a)
						db.bgColor.r = r
						db.bgColor.g = g
						db.bgColor.b = b
						db.bgColor.a = a
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 6,
		},
		border = {
			name = "Border",
			desc = "Texture for the border of the loot frames.",
			type = "select",
			dialogControl = "LSM30_Border",
			values = widgetLists.border,
			get = function()
					return db.border
				end,
			set = function(self, border)
						db.border = border
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 7,
		},
		borderColor = {
			name = "Border Color/Alpha",
			desc = "Color of the border for the loot frames.",
			type = "color",
			hasAlpha = true,
			get = function() return db.borderColor.r, db.borderColor.g, db.borderColor.b, db.borderColor.a end,
			set = function(_,r,g,b,a)
						db.borderColor.r = r
						db.borderColor.g = g
						db.borderColor.b = b
						db.borderColor.a = a
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 8,
		},
		borderWidth = {
			name = "Border Width",
			desc = "Width of the border.",
			type = "range",
			min = 1,
			max = 32,
			step = .5,
			get = function() return db.borderWidth end,
			set = function(_, borderWidth) 
						db.borderWidth = borderWidth
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 9,
		},
		inset = {
			name = "Inset",
			desc = "The inset of the background from the border texture.",
			type = "range",
			min = 0,
			max = 10,
			step = .5,
			get = function() return db.inset end,
			set = function(_, inset) 
						db.inset = inset
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 10,
		},
		sbar = {
			name = "Timer bar texture",
			desc = "Texture to use for the timer bar on the group loot frames.",
			type = "select",
			dialogControl = "LSM30_Statusbar",
			values = widgetLists.statusbar,
			get = function()
					return db.sbar
				end,
			set = function(self, sbar)
						db.sbar = sbar
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 11,
		},
		sbarcolor = {
			name = "Timer bar color",
			desc = "The color of the timer bar for the group loot frames.",
			type = "color",
			hasAlpha = false,
			get = function() return db.sbarColor.r, db.sbarColor.g, db.sbarColor.b end,
			set = function(_,r,g,b)
						db.sbarColor.r = r
						db.sbarColor.g = g
						db.sbarColor.b = b
						for k,v in pairs(frames) do
							SkinFrames(v)
						end
					end,
			order = 12,
		},
		spacer2 = {
			name = " ",
			type = "description",
			width = "full",
			order = 13,
		},
		divider2 = {
			name = "Profile Management",
			type = "header",
			order = 14,
		},
		charSpec = {
			name = "Character specific settings",
			desc = "Have this character use their own profile.  If checked, any changes made will not affect other characters.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!",
			type = "toggle",
			width = "full",
			confirm = true,
			get = function() return LovelyLootPCDB.charSpec end,
			set = function()
						LovelyLootPCDB.charSpec = not LovelyLootPCDB.charSpec
						ReloadUI()
					end,
			order = 15,
		},
		copyProfile = {
			name = "Copy from Default",
			desc = "Copy all settings from the default, global profile to this character's profile.  This will not effect other characters' specific profiles.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!",
			type = "execute",
			confirm = true,
			disabled = function() return not LovelyLootPCDB.charSpec end,
			func = function()
						LovelyLootPCDB = LovelyLootDB
						LovelyLootPCDB.charSpec = true
						ReloadUI()
					end,
			order = 16,
		},
		resetProfile = {
			name = "Profile Reset",
			desc = "Reset this profile back to the out-of-the-box settings.  If you reset the character specific profile, the global profile will be untouched, and vice versa.  This will not effect other character specific profiles.\n\n|c00E30016WARNING:|r Your UI will be reloaded in the process!",
			type = "execute",
			confirm = true,
			func = function()
						if LovelyLootPCDB.charSpec then
							LovelyLootPCDB = {charSpec = true}
						else
							LovelyLootDB = {}
						end
						ReloadUI()
					end,
			order = 17,
		},
	}
}


function SkinFrames(frame)
	frame:SetBackdrop({
		bgFile = LSM:Fetch("background", db.bg),
		edgeFile = LSM:Fetch("border", db.border),
		edgeSize = db.borderWidth,
		insets = {left=db.inset,right=db.inset,top=db.inset,bottom=db.inset}
	})
	frame:SetBackdropColor(db.bgColor.r, db.bgColor.g, db.bgColor.b, db.bgColor.a)
	frame:SetBackdropBorderColor(db.borderColor.r, db.borderColor.g, db.borderColor.b, db.borderColor.a)
	
	if strfind(frame:GetName(), "GroupLootFrame") then
		frame.Timer:SetStatusBarTexture(LSM:Fetch("statusbar", db.sbar))
		frame.Timer:SetStatusBarColor(db.sbarColor.r, db.sbarColor.g, db.sbarColor.b, db.sbarColor.a)
	end
end

--The regular loot frame--
local function LootFrameEdits()
	local bg, titlebg, portrait, portraitframe, trcorner, tlcorner, top, 
		unknowntitle, topstreak, blcorner, brcorner, bottom, left, right, btncornerL,
		btncornerR, btnbottom, portraitoverlay, title, prevtext, nextext = LootFrame:GetRegions()
	
	--hide extras
	bg:Hide()
	titlebg:Hide()
	portrait:Hide()
	portraitframe:Hide()
	trcorner:Hide()
	tlcorner:Hide()
	top:Hide()
	topstreak:Hide()
	blcorner:Hide()
	brcorner:Hide()
	bottom:Hide()
	left:Hide()
	right:Hide()
	portraitoverlay:Hide()
	btncornerL:Hide()
	btncornerR:Hide()
	btnbottom:Hide()
	LootFrameInset:Hide()
	
	--rearrange stuff
	LootFrameUpButton:ClearAllPoints()
	LootFrameUpButton:SetPoint("BOTTOMLEFT", 12, 12)
	LootFrameDownButton:ClearAllPoints()
	LootFrameDownButton:SetPoint("BOTTOMRIGHT", -12, 12)
	prevtext:ClearAllPoints()
	prevtext:SetPoint("LEFT", LootFrameUpButton, "RIGHT", 3, 0)
	nextext:ClearAllPoints()
	nextext:SetPoint("RIGHT", LootFrameDownButton, "LEFT", -3, 0)
	LootFrameCloseButton:ClearAllPoints()
	LootFrameCloseButton:SetPoint("TOPRIGHT", -2, 0)
	title:ClearAllPoints()
	title:SetPoint("TOP", 0, -10)
	LootButton1:ClearAllPoints()
	LootButton1:SetPoint("TOPLEFT", 15, -80)
	for i=1,3 do
		_G["LootButton"..i+1]:ClearAllPoints()
		_G["LootButton"..i+1]:SetPoint("TOP", "LootButton"..i, "BOTTOM", 0, -4)
	end
	
	--resize actual loot frame
	LootFrame:SetSize(179,250)
	LootFrame:SetHitRectInsets(0,0,0,0)

	--make it movable
	LootFrame:EnableMouse(db.lfUnlocked)
	LootFrame:SetUserPlaced(true)
	LootFrame:RegisterForDrag("LeftButton")
	LootFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
	LootFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	--keep it from being moved by frames in the UI
	UIPanelWindows["LootFrame"] = nil
	if not LootFrame:GetPoint() then
		LootFrame:SetPoint("TOPLEFT", 30, -200)
	end
	
	--setup model
	llmodel:SetPoint("TOPLEFT", 15, -30)
	llmodel:SetPoint("TOPRIGHT", -15, -30)
	llmodel:SetHeight(40)
	llmodel:SetBackdrop({
			bgFile = "Interface\\Buttons\\WHITE8x8",
			tile = true,
			tileSize = 8,
		})
	llmodel:SetBackdropColor(.2,.2,.2,.5)
	
	--skin icons with rABS
	if IsAddOnLoaded("rActionButtonStyler") then
		colorR,colorG,colorB = ActionButton1NormalTexture:GetVertexColor()
		for i = 1, 4 do
			_G["LootButton"..i.."NormalTexture"]:SetTexture("Interface\\AddOns\\rActionButtonStyler\\media\\gloss")
			_G["LootButton"..i.."NormalTexture"]:SetAllPoints()
			_G["LootButton"..i.."NormalTexture"]:SetVertexColor(colorR,colorG,colorB)
			_G["LootButton"..i.."NormalTexture"].SetVertexColor = emptyFunc
			_G["LootButton"..i]:SetPushedTexture("Interface\\AddOns\\rActionButtonStyler\\media\\pushed")
			_G["LootButton"..i]:SetHighlightTexture("Interface\\AddOns\\rActionButtonStyler\\media\\hover")
		end
	else
		for i = 1, 4 do
			_G["LootButton"..i]:SetNormalTexture("")
			--_G["LootButton"..i]:SetPushedTexture("")
			_G["LootButton"..i.."IconTexture"]:SetTexCoord(.1,.9,.1,.9)
		end
	end
end

--Group Loot frames--
local function GroupLootFrames()
	--place our frames
	GLC:ClearAllPoints()
	GLC:SetPoint(db.rollAnchor.anch1, UIParent, db.rollAnchor.anch2, db.rollAnchor.xpos, db.rollAnchor.ypos)
	
	for i=1,4 do
		
		local frame = _G["GroupLootFrame"..i]
		frame:SetWidth(335)
		frame:SetHeight(67)
		frame.Border:Hide()
		frame.Background:Hide()
		
		frame.IconFrame:ClearAllPoints()
		frame.IconFrame:SetPoint("LEFT", frame, 15, 0)
		frame.IconFrame.Icon:ClearAllPoints()
		frame.IconFrame.Icon:SetPoint("CENTER")
		frame.IconFrame.Icon:SetSize(40,40)
		frame.IconFrame.Icon:SetTexCoord(.07,.93,.07,.93)
		frame.IconFrame.Border:SetTexture("Interface\\AddOns\\LovelyLoot\\ButtonHilight-Square")
		frame.IconFrame.Border:SetTexCoord(0,1,0,1)
		frame.IconFrame.Border.SetTexCoord = function() end

		frame.Name:ClearAllPoints()
		frame.Name:SetPoint("LEFT", frame.IconFrame, "RIGHT", 10, 0)
		frame.Name:SetWidth(115)

		frame.PassButton:ClearAllPoints()
		frame.PassButton:SetPoint("TOPRIGHT", -25, -14)
		frame.PassButton:SetHeight(25)
		frame.PassButton:SetWidth(25)
		
		frame.DisenchantButton:ClearAllPoints()
		frame.DisenchantButton:SetPoint("TOPRIGHT", -55, -14)
		frame.DisenchantButton:SetHeight(26)
		frame.DisenchantButton:SetWidth(26)
		
		frame.GreedButton:ClearAllPoints()
		frame.GreedButton:SetPoint("RIGHT", frame.DisenchantButton, "LEFT", -7, -3)
		frame.GreedButton:SetHeight(26)
		frame.GreedButton:SetWidth(26)
		
		frame.NeedButton:ClearAllPoints()
		frame.NeedButton:SetPoint("RIGHT", frame.GreedButton, "LEFT", -7, 1)
		frame.NeedButton:SetHeight(26)
		frame.NeedButton:SetWidth(26)
		
		frame.Timer:ClearAllPoints()
		frame.Timer:SetPoint("BOTTOMRIGHT", -15, 15)
		frame.Timer:SetWidth(147)
	end
end

function MoveGroupLootFrames(showMover)
	if not GLCmover then
		GLCmover = GLC:CreateTexture()
		GLCmover:SetAllPoints(GLC)
		GLC:SetSize(335, 20)	--make wider for new GroupLoot frames and taller for dragging
		GLC:EnableMouse(true)
		GLC:SetMovable(true)
		GLC:RegisterForDrag("LeftButton")
		GLC:SetScript("OnDragStart", function(self) self:StartMoving() end)
		GLC:SetScript("OnDragStop", function(self)
				self:StopMovingOrSizing()
				db.rollAnchor.anch1, _, db.rollAnchor.anch2, db.rollAnchor.xpos, db.rollAnchor.ypos = self:GetPoint()
			end)
	end
	if showMover then
		GLCmover:SetTexture(1,1,1,1)
		GLC:Show()
	else
		GLCmover:SetTexture(0,0,0,0)
		GLC:Hide()
	end
end

--LootWon & MoneyWon frames--
local function BonusRollFrames()
	BonusRollLootWonFrame.IconBorder:SetTexture("Interface\\AddOns\\LovelyLoot\\ButtonHilight-Square")
	BonusRollLootWonFrame.IconBorder:SetTexCoord(0,1,0,1)
	BonusRollLootWonFrame.IconBorder.SetTexCoord = function() end
	BonusRollLootWonFrame.Icon:SetTexCoord(.07,.93,.07,.93)
	BonusRollLootWonFrame.Background:Hide()
	
	BonusRollMoneyWonFrame.IconBorder:SetTexture("Interface\\AddOns\\LovelyLoot\\ButtonHilight-Square")
	BonusRollMoneyWonFrame.IconBorder:SetTexCoord(0,1,0,1)
	BonusRollMoneyWonFrame.IconBorder.SetTexCoord = function() end
	BonusRollMoneyWonFrame.Icon:SetTexCoord(.07,.93,.07,.93)
	BonusRollMoneyWonFrame.Background:Hide()
end

local function SetUpDB()
	if LovelyLootPCDB.charSpec then
		--set defaults if new charSpec DB
		for k,v in pairs(defaultValues) do
			if type(LovelyLootPCDB[k]) == "nil" then
				LovelyLootPCDB[k] = v
			end
		end
		db = LovelyLootPCDB
	else
		db = LovelyLootDB
	end
end

local function Initialize()
	LovelyLootDB = LovelyLootDB or {}
	LovelyLootPCDB = LovelyLootPCDB or {}
		if LovelyLootPCDB.charSpec == nil then
			LovelyLootPCDB.charSpec = false
		end
	for k,v in pairs(defaultValues) do
	    if type(LovelyLootDB[k]) == "nil" then
	        LovelyLootDB[k] = v
	    end
	end
	SetUpDB()
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Lovely Loot", options)
	LL.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Lovely Loot", "Lovely Loot")
	SlashCmdList["LOVELYLOOT"] = function() InterfaceOptionsFrame_OpenToCategory("Lovely Loot") end
	SLASH_LOVELYLOOT1 = "/lovelyloot"
	SLASH_LOVELYLOOT2 = "/ll"

	LootFrameEdits()
	GroupLootFrames()
	BonusRollFrames()
	for k,v in pairs(frames) do
		SkinFrames(v)
	end
	
	--clean up after myself
	LL:UnregisterEvent("PLAYER_ENTERING_WORLD")
	Initialize = nil
	LootFrameEdits = nil
	GroupLootFrames = nil
	BonusRollFrames = nil
end

LL:RegisterEvent("PLAYER_ENTERING_WORLD")
LL:RegisterEvent("LOOT_OPENED")
LL:SetScript("OnEvent", function(self,event, id)
		if event == "LOOT_OPENED" then
			if UnitExists("target") then
				llmodel:SetUnit("target")
				--llmodel:SetCamera(0)
			else
				llmodel:ClearModel()
				llmodel:SetModel("PARTICLES\\Lootfx_green.m2")
			end
		else
			Initialize()
		end
	end)



