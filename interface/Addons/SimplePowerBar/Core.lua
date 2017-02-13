SimplePowerBar = LibStub("AceAddon-3.0"):NewAddon("SimplePowerBar", "AceConsole-3.0");
local PPBA = PlayerPowerBarAlt
local Addon = GetAddOnMetadata("SimplePowerBar", "Title");
local Media = LibStub("LibSharedMedia-3.0");
local db, unit, spb, mover;
local RAID_CLASS_COLORS = _G.RAID_CLASS_COLORS
unit = "player"
local _,Class = UnitClass(unit)

local path = "INTERFACE\\UNITPOWERBARALT\\"
local blizzColors = {
	[path.."STONEGUARDAMETHYST_HORIZONTAL_FILL.BLP"] = {
		r = 0.50,
		g = 0.45,
		b = 0.75,
	},
	[path.."STONEGUARDCOBALT_HORIZONTAL_FILL.BLP"] = {
		r = 0.35,
		g = 0.66,
		b = 0.78,
	},
	[path.."STONEGUARDJADE_HORIZONTAL_FILL.BLP"] = {
		r = 0.48,
		g = 0.75,
		b = 0.47,
	},
	[path.."STONEGUARDJASPER_HORIZONTAL_FILL.BLP"] = {
		r = 0.72,
		g = 0.48,
		b = 0.48,
	}
}


-- Tester Frame -- 
SimplePowerBar.tester = CreateFrame("Frame")
SimplePowerBar.tester.interval = 1
SimplePowerBar.tester.enabled = false
SimplePowerBar.tester.Enable = function()
	SimplePowerBar.tester.enabled = true
	SimplePowerBar.tester:SetScript("OnUpdate", function(self,elapsed)
		SimplePowerBar.tester.interval = SimplePowerBar.tester.interval - elapsed
		if SimplePowerBar.tester.interval < 0 then
			SimplePowerBar:Update()
			SimplePowerBar.tester.interval = 1
		end
	end)
end
SimplePowerBar.tester.Disable = function()
	SimplePowerBar.tester:SetScript("OnUpdate", nil)
	SimplePowerBar.tester.interval = 1
	SimplePowerBar.tester.enabled = false
	SimplePowerBar:Update()
end

function SimplePowerBar:OnInitialize()
	local defaults = {
		profile = {
			-- Looks
			StatusTex = "ChiselLight",
			Orientation = "HORIZONTAL",
			border = "Pixel",
			bg = "Solid",
			tile = false,
			tileSize = 0,
			borderSize = 1,
			borderInset = 1,
			frameStrata = "BACKGROUND",
			frameLevel = 1,
			anchor = "CENTER",
			alpha = 1,
			width = 128,
			height = 24,
			x = 0,
			y = -220,
			-- Settings
			amount = true,
			level = true,
			percent = true,
			label = true,
			locked = false,
			test = false,
			useBlizz = false,
			debug = false,
	-- Coloring config
			statusClass = false,
			statusBlizz = true,
			backdropClass = false,
			borderClass = false,
			sbbgMaxEnabled = false,
			sbMaxEnabled = false,
			sbtMaxEnabled = false,
			sbbMaxEnabled = false,
			ltMaxEnabled = false,			
			fade = true,
			StatusBarText = {
				font = "Arial Narrow",
				size = 8,
				align = "CENTER",
				anchor = "CENTER",
				style = "NONE",
				colorClass = false,
				color = {
					r = 1,
					g = 1,
					b = 1,
					a = 1,					
				},
				shadow = {
					r = 0,
					g = 0,
					b = 0,
					a = 1,
				},
				shadowOffset = 1,				
				ofx = 0,
				ofy = 0,
				MaxColor = {
					r = 1,
					g = 0,
					b = 0,
				},
			},
			LabelText = {
				font = "Arial Narrow",
				size = 8,
				align = "BOTTOM",
				anchor = "TOP",
				style = "NONE",
				colorClass = false,
				color = {
					r = 1,
					g = 1,
					b = 1,
					a = 1,					
				},
				shadow = {
					r = 0,
					g = 0,
					b = 0,
					a = 1,
				},
				shadowOffset = 1,
				ofx = 0,
				ofy = 2,
				MaxColor = {
					r = 1,
					g = 0,
					b = 0,
				},				
			},
			StatusColor = {
				r = 0.4,
				g = 0.4,
				b = 0.4,
				a = 1,
				MaxColor = {
					r = 1,
					g = 0,
					b = 0,
				},
			},
			StatusLow = {
				r = 1,
				g = 0,
				b = 0,
			},
			StatusHigh = {
				r = 0,
				g = 1,
				b = 0,
			},
			BorderColor = {
				r = 0,
				g = 0,
				b = 0,
				a = 1,
				MaxColor = {
					r = 1,
					g = 0,
					b = 0,
				},
			},
			BackgroundColor = {
				r = 0.2,
				g = 0.2,
				b = 0.2,
				a = 0.5,
				MaxColor = {
					r = 1,
					g = 0,
					b = 0,
				},
			},
		}
	}
	db = LibStub("AceDB-3.0"):New("SimpPB_DB",defaults,"Default")
	self.db = db
	local RegisterCallback = db.RegisterCallback	
	RegisterCallback(self, "OnProfileChanged", "FullUpdate")
	RegisterCallback(self, "OnProfileCopied", "FullUpdate")
	RegisterCallback(self, "OnProfileReset", "FullUpdate")
	
	db = self.db.profile
	
	self:CreatePowerBar()
	self:CreateBlizzMover()
	self:SetUpInitialOptions()
	self:FullUpdate()
	
	local commands = {}
	commands.lock = function()
		db.locked = not db.locked
		if db.locked then
			print(Addon..": Locked")
		else
			print(Addon..": Unlocked")		
		end
	end
	
	commands.fade = function()
		db.fade = not db.fade
		if db.fade then
			print(Addon..": Color fade enabled.")
		else
			print(Addon..": Color fade disabled.")
		end
	end
	commands.test = function()
		db.test = not db.test
		if db.test then
			self.tester:Enable()
			print(Addon..": Test mode enabled.")
			
		else
			self.tester:Disable()
			print(Addon..": Test mode disabled.")			
		end
	end
	commands.blizz = function()
		db.useBlizz = not db.useBlizz
		if db.useBlizz then
			print(Addon..": Blizzard frames enabled.")
		else
			print(Addon..": Blizzard frames disabled.")
		end
	end
	commands.debug = function()
		db.debug = not db.debug
		if db.debug then
			print(Addon..": Debugging enabled.")
		else
			print(Addon..": Debugging disabled.")
		end
	end

	commands.help = function()
		print(Addon.." Commands available:")
		print("'/spb lock' -- Allows you to drag the frame and place it with the mouse or lock it in place.")
		print("'/spb fade' -- Allows the color to fade according to amount of power.")
		print("'/spb blizz' -- Allows the usage of the default Blizzard frames.")
		print("'/spb test' -- Allows you to test the bar and its looks.")
		print("'/spb debug' -- Allows the debugging mode to be enabled or disabled.")
		print("'/spb about' -- Shows additional information about the addon.")
	end

	commands.about = function()
		print(Addon..": Created by Suicidal Katt, based off of '|cffC495DDSmelly|r Power Bar' by Smelly.")
	end

	local function slashHandler(arg)
		local arg1, arg2, arg3 = strsplit(" ", arg, 3)
		if arg1 then
			if type(commands[arg1]) == "function" then
				commands[arg1](arg2)
				SimplePowerBar:FullUpdate()
			else
				print(Addon..": Type '/spb help' for a list of commands.")
				SimplePowerBar:OpenOptions()
			end
		end
	end
	SLASH_SIMPPB1 = "/spb"
	SlashCmdList["SIMPPB"] = slashHandler
end

-- Create Statusbar Frame
function SimplePowerBar:CreatePowerBar()
	db = self.db.profile
	
	spb = CreateFrame("Frame", "SPB_APB", UIParent)
	
	spb:SetBackdrop({
		bgFile = Media:Fetch("background",db.bg), 
		edgeFile = Media:Fetch("border",db.border),
		tile = db.tile, tileSize = db.tileSize, edgeSize = db.borderSize, 
		insets = { left = db.borderInset, right = db.borderInset, top = db.borderInset, bottom = db.borderInset}
	})
	spb:SetHeight(db.height)
	spb:SetWidth(db.width)
	spb:SetPoint("CENTER",UIParent,"CENTER", db.x, db.y)
	
	spb:SetFrameStrata(db.frameStrata)
	spb:SetFrameLevel(db.frameLevel)
	
	spb:SetMovable(true)
	spb:SetClampedToScreen(true)
	spb:SetUserPlaced(true)
		
	spb.lock = spb:CreateTexture(nil,"OVERLAY")
	spb.lock:SetTexture("Interface\\GLUES\\CharacterSelect\\Glues-AddOn-Icons")
	spb.lock:SetWidth(8)
	spb.lock:SetHeight(8)
	spb.lock:SetTexCoord(0.25,0.48,0,1)
	spb.lock:SetPoint("CENTER", spb, "TOPRIGHT")
	
	spb.Unlock = function()
		spb:Show()
		spb.lock:Show()		
		spb:EnableMouse(true)
		spb:RegisterForDrag("LeftButton")
		spb:SetScript("OnDragStart", spb.StartMoving)
		spb:SetScript("OnDragStop", function()
			spb:StopMovingOrSizing()
			db.anchor,_,_,db.x,db.y = spb:GetPoint()
			self:FullUpdate()
		end)
	end
	
	spb.Lock = function ()
		spb:EnableMouse(false)
		spb.lock:Hide()
		spb:SetScript("OnDragStart", nil)
		spb:SetScript("OnDragStop", nil)
	end
	
	
	spb.power = spb:CreateFontString(nil, "OVERLAY")
	spb.power:SetFont(Media:Fetch("font", db.StatusBarText.font), db.StatusBarText.size, db.StatusBarText.style)
	
	spb.label = spb:CreateFontString(nil, "OVERLAY")
	spb.label:SetFont(Media:Fetch("font", db.LabelText.font), db.LabelText.size, db.LabelText.style)
	
	spb.bar = CreateFrame("StatusBar", nil, spb)
	spb.bar:SetPoint("TOPLEFT", spb, "TOPLEFT", db.borderInset, -db.borderInset)
	spb.bar:SetPoint("BOTTOMRIGHT", spb, "BOTTOMRIGHT", -db.borderInset, db.borderInset)
	spb.bar:SetFrameStrata(spb:GetFrameStrata())
	spb.bar:SetFrameLevel(spb:GetFrameLevel())
	
	spb.max = false -- Used for 'if max then' coloring.
end

-- Create Blizzard Mover

function SimplePowerBar:CreateBlizzMover()
	db = self.db.profile
	
	mover = CreateFrame("Frame", "SPB_MOVER", UIParent)
	mover:SetSize(128, 20)
	mover:SetPoint("CENTER",UIParent,"CENTER", db.x, db.y)
	mover:SetFrameStrata("BACKGROUND")
	mover:SetMovable(true)
	mover:SetClampedToScreen(true)
	mover:SetUserPlaced(true)

	local overlay = CreateFrame("Frame",nil,mover)
	overlay:SetPoint("CENTER",mover,"CENTER")
	overlay:SetSize(mover:GetSize())	
	overlay:SetFrameStrata("HIGH")
	overlay:SetFrameLevel(5)
	
	overlay.bg = overlay:CreateTexture(nil,"HIGH")
	overlay.bg:SetTexture(0.36,0.7,1,1)
	overlay.bg:SetAllPoints(overlay)	
	
	overlay.texture = overlay:CreateTexture(nil,"OVERLAY")
	overlay.texture:SetTexture("Interface\\AddOns\\SimplePowerBar\\Textures\\Statusbar")
	overlay.texture:SetVertexColor(0.3,0.3,0.3,1)
	overlay.texture:SetPoint("TOPLEFT", overlay, "TOPLEFT", 1, -1)
	overlay.texture:SetPoint("BOTTOMRIGHT", overlay, "BOTTOMRIGHT", -1, 1)
	
	overlay.text = overlay:CreateFontString(nil,"OVERLAY")
	overlay.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
	overlay.text:SetPoint("CENTER",overlay.texture,"CENTER")
	overlay.text:SetText("Drag me!")
	
	mover.Unlock = function()
		mover:Show()
		overlay:Show()
		mover:EnableMouse(true)
		mover:RegisterForDrag("LeftButton")
		mover:SetScript("OnDragStart", mover.StartMoving)
		mover:SetScript("OnDragStop", function()
			mover:StopMovingOrSizing()
			db.anchor,_,_,db.x,db.y = mover:GetPoint()
			self:FullUpdate()			
		end)
	end
	mover.Lock = function()
		overlay:Hide()
		mover:EnableMouse(false)
		mover:SetScript("OnDragStart", nil)
		mover:SetScript("OnDragStop", nil)
	end
	
	PPBA:ClearAllPoints()
	PPBA:SetPoint("CENTER", mover, "CENTER")
	PPBA:SetParent(mover)
	PPBA:EnableMouse(false)
	local hook = function()
		PPBA:SetPoint("CENTER", mover, "CENTER")
	end
	PPBA.ignoreFramePositionManager = true
end	
-- Locking
function SimplePowerBar:Unlock()
	db = self.db.profile
	if db.useBlizz then
		mover:Unlock()
	else
		spb:Unlock()
	end
end
	
function SimplePowerBar:Lock()
	db = self.db.profile
	if db.useBlizz then
		mover:Lock()
	else
		spb:Lock()
	end
	if not unit or unit ~= PPBA.unit then
		unit = PPBA.unit
	end
	if not UnitAlternatePowerInfo(unit) then mover:Hide();spb:Hide() end
end
-- Updaters
function SimplePowerBar:Update()
	db = self.db.profile
	if not PPBA:IsShown() then PPBA:Show() end -- Here we're going to make sure the frame is properly parented to the mover
	
	if not unit or unit ~= PPBA.unit then
		unit = PPBA.unit
	end
	if UnitAlternatePowerInfo(unit) then -- If no power watched hide, if still unlocked the unlock function will reshow the correct frame.
		if db.useBlizz then	
			if spb:IsShown() then spb:Hide(); end
			if not mover:IsShown() then	mover:Show(); end
		else
			if not spb:IsShown() then spb:Show(); end 
			if mover:IsShown() then mover:Hide(); end
		end
	else
		spb:Hide();
		mover:Hide();
	end	
	if db.test then
		if not SimplePowerBar.tester.enabled then SimplePowerBar.tester:Enable() end
		self.label = "Test Mode Enabled!"
		self.power = random(35,100)
		self.mpower = 100
	else
		if SimplePowerBar.tester.enabled then SimplePowerBar.tester:Disable() end
		self.label = select(10,UnitAlternatePowerInfo(unit)) or ""
		self.power, self.mpower = UnitPower(unit, ALTERNATE_POWER_INDEX), UnitPowerMax(unit, ALTERNATE_POWER_INDEX)
	end
	if self.power == self.mpower then
		self.max = true
	else
		self.max = false
	end
	self:LabelTextUpdate(self.label)
	self:ValueTextUpdate(self.power,self.mpower)
	self:StatusBarUpdate(self.power,self.mpower)
	-- Reshow unlocked frame.
	if db.locked then
		self:Lock()
	else
		self:Unlock()
	end
end

function SimplePowerBar:FullUpdate()
	db = self.db.profile
	-- Update for lock changes
	self:Update()
	-- SPB
	spb:SetBackdrop({
		bgFile = Media:Fetch("background",db.bg), 
		edgeFile = Media:Fetch("border",db.border),
		tile = db.tile, tileSize = db.tileSize, edgeSize = db.borderSize, 
		insets = { left = db.borderInset, right = db.borderInset, top = db.borderInset, bottom = db.borderInset}
	})
	if db.backdropClass then
		local color = RAID_CLASS_COLORS[Class]
		spb:SetBackdropColor(color.r,color.g,color.b,db.BackgroundColor.a)
	else
		spb:SetBackdropColor(db.BackgroundColor.r,db.BackgroundColor.g,db.BackgroundColor.b,db.BackgroundColor.a)
	end
	if db.borderClass then
		local color = RAID_CLASS_COLORS[Class]
		spb:SetBackdropBorderColor(color.r,color.g,color.b,db.BorderColor.a)
	else
		spb:SetBackdropBorderColor(db.BorderColor.r,db.BorderColor.g,db.BorderColor.b,db.BorderColor.a)
	end
	spb:SetHeight(db.height)
	spb:SetWidth(db.width)
	spb:ClearAllPoints()
	spb:SetPoint(db.anchor,UIParent,db.anchor, db.x, db.y)
	spb:SetFrameStrata(db.frameStrata)
	spb:SetFrameLevel(db.frameLevel)
	-- Mover
	mover:ClearAllPoints()
	mover:SetPoint(db.anchor,UIParent,db.anchor, db.x, db.y)
	-- StatusBar
	spb.bar:SetStatusBarTexture(Media:Fetch("statusbar",db.StatusTex))
	spb.bar:SetPoint("TOPLEFT", spb, "TOPLEFT", db.borderInset, -db.borderInset)
	spb.bar:SetPoint("BOTTOMRIGHT", spb, "BOTTOMRIGHT", -db.borderInset, db.borderInset)
	spb.bar:SetOrientation(db.Orientation)
	spb.bar:SetFrameStrata(spb:GetFrameStrata())
	spb.bar:SetFrameLevel(spb:GetFrameLevel())
	-- BarText
	spb.power:SetFont(Media:Fetch("font", db.StatusBarText.font), db.StatusBarText.size, db.StatusBarText.style)
	spb.power:ClearAllPoints()
	spb.power:SetPoint(db.StatusBarText.align, spb, db.StatusBarText.anchor, db.StatusBarText.ofx, db.StatusBarText.ofy)
	spb.power:SetShadowColor(db.StatusBarText.shadow.r,db.StatusBarText.shadow.g,db.StatusBarText.shadow.b,db.StatusBarText.shadow.a)
	if db.StatusBarText.colorClass then
		local color = RAID_CLASS_COLORS[Class]
		spb.power:SetTextColor(color.r,color.g,color.b,db.StatusBarText.color.a)
	else
		spb.power:SetTextColor(db.StatusBarText.color.r,db.StatusBarText.color.g,db.StatusBarText.color.b,db.StatusBarText.color.a)
	end
	spb.power:SetShadowOffset(db.StatusBarText.shadowOffset,-(db.StatusBarText.shadowOffset))
	-- Label
	spb.label:SetFont(Media:Fetch("font", db.LabelText.font), db.LabelText.size, db.LabelText.style)
	spb.label:ClearAllPoints()
	spb.label:SetPoint(db.LabelText.align, spb, db.LabelText.anchor, db.LabelText.ofx, db.LabelText.ofy)
	spb.label:SetShadowColor(db.LabelText.shadow.r,db.LabelText.shadow.g,db.LabelText.shadow.b,db.LabelText.shadow.a)
	if db.LabelText.colorClass then
		local color = RAID_CLASS_COLORS[Class]
		spb.label:SetTextColor(color.r,color.g,color.b,db.LabelText.color.a)
	else
		spb.label:SetTextColor(db.LabelText.color.r,db.LabelText.color.g,db.LabelText.color.b,db.LabelText.color.a)
	end
	-- Coloring
	if self.max then
		
	else
	
	end
	spb.label:SetShadowOffset(db.LabelText.shadowOffset,-(db.LabelText.shadowOffset))
end

local CS = CreateFrame("ColorSelect")
function CS:GetSmudgeColorRGB(colorA, colorB, perc)
	self:SetColorRGB(colorA.r,colorA.g,colorA.b)
	local h1, s1, v1 = self:GetColorHSV()
	self:SetColorRGB(colorB.r,colorB.g,colorB.b)
	local h2, s2, v2 = self:GetColorHSV()
	local h3 = floor(h1-(h1-h2)*perc)
	if abs(h1-h2) > 180 then
        local radius = (360-abs(h1-h2))*perc/100
		if h1 < h2 then
			h3 = floor(h1-radius)
			if h3 < 0 then
				h3 = 360+h3
			end
        else
			h3 = floor(h1+radius)
			if h3 > 360 then
				h3 = h3-360
			end
        end
    end  
    local s3 = s1-(s1-s2)*perc
    local v3 = v1-(v1-v2)*perc
    self:SetColorHSV(h3, s3, v3)
    local r,g,b = self:GetColorRGB()
    return r,g,b
end

function SimplePowerBar:StatusBarUpdate(power,mpower)
	local r,g,b,a
	db = self.db.profile
	spb.bar:SetMinMaxValues(0, mpower)
	spb.bar:SetValue(power)
	local perc = mpower > 0 and power/mpower or 0
	if power == mpower and db.sbMaxEnabled then
		local s = db.StatusColor.MaxColor
		r,g,b = s.r,s.g,s.b
	else
		if db.fade then
			r,g,b = CS:GetSmudgeColorRGB(db.StatusLow,db.StatusHigh,perc)
		else
			local c = {}
			if db.statusClass then
				c = RAID_CLASS_COLORS[Class]
			elseif not db.statusClass and db.statusBlizz then
				local texture, r, g, b = UnitAlternatePowerTextureInfo(unit,2,0) -- 0 Here indicates the current displayed bar.
				if blizzColors[texture] then
					c = blizzColors[texture]
				else
					c.r,c.g,c.b = r,g,b
				end
			else
				c = db.StatusColor
			end
			r,g,b = c.r,c.g,c.b
		end
	end
	a = db.StatusColor.a
	spb.bar:SetStatusBarColor(r,g,b,a)
end

function SimplePowerBar:LabelTextUpdate(text)
	db = self.db.profile
	if text and db.label then
		spb.label:SetText(text)
	else
		spb.label:SetText("")
	end
end

function SimplePowerBar:ValueTextUpdate(power,mpower)
	db = self.db.profile
	local text, level, percent
	local perc = mpower > 0 and floor(power/mpower*100) or 0
	if db.amount then
		if db.level then
			level = power.."/"..mpower
		else
			level = ""
		end
		if db.percent and mpower > 0 then
			if db.level then
				percent = " - "..perc.."%"
			else
				percent = perc.."%"
			end
		else
			percent = ""
		end
		text = format("%s%s",level,percent)
	else
		text = ""
	end
	spb.power:SetText(text)
end

-- Event Handling

local EventHandler = CreateFrame("frame")
EventHandler:RegisterEvent("ADDON_LOADED")
EventHandler:SetScript("OnEvent", function(self,event,...)
	local arg1,arg2,arg3,arg4 = ...
	db = SimplePowerBar.db.profile
	if event == "ADDON_LOADED" and arg1 == "SimplePowerBar" then
		self:UnregisterEvent("ADDON_LOADED")
		self:RegisterEvent("UNIT_POWER_BAR_TIMER_UPDATE")
		self:RegisterEvent("UNIT_POWER_BAR_SHOW")
		self:RegisterEvent("UNIT_POWER_BAR_HIDE")
		self:RegisterEvent("UNIT_POWER")
		self:RegisterEvent("UNIT_MAXPOWER")
		self:RegisterEvent("PLAYER_REGEN_DISABLED")
		self:RegisterEvent("PLAYER_REGEN_ENABLED")				
	elseif (event == "UNIT_POWER" or event == "UNIT_MAXPOWER") and arg2 == "ALTERNATE" then
		if not unit or unit ~= PPBA.unit then
			unit = PPBA.unit
		end		
		if unit == arg1 then
			SimplePowerBar:Update()
		end		
	elseif event == "UNIT_POWER_BAR_SHOW" then
		self:RegisterEvent("UNIT_POWER")
		self:RegisterEvent("UNIT_MAXPOWER")
		
		SimplePowerBar:Update()
		
	elseif event == "UNIT_POWER_BAR_HIDE" then
		self:UnregisterEvent("UNIT_POWER")
		self:UnregisterEvent("UNIT_MAXPOWER")
		
		SimplePowerBar:Update()
		
	elseif event == "UNIT_POWER_BAR_TIMER_UPDATE" then
		--[[if arg1 == "player" then
			local index = 1
			local duration, expiration, barID, auraID = UnitPowerBarTimerInfo("player", index);
			while barID do
				local barType, minPower, startInset, endInset, smooth, hideFromOthers, showOnRaid, opaqueSpark, opaqueFlash, powerName, powerTooltip, costString = GetAlternatePowerInfoByID(barID);
				if barType and barType ~= 4 then
					print("BarID: "..barID.." BarType: "..barType.." AuraID: "..auraID)
				end	
				index = index + 1
				duration, expiration, barID, auraID = UnitPowerBarTimerInfo("player", index);
			end
		end]]--
	elseif event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED" then		
		
		SimplePowerBar:Update()
		
	end
	if db.debug then
		if arg2 then
			print(event.." "..arg1.." "..arg2)
		elseif arg1 and not arg2 then
			print(event.." "..arg1)
		elseif not arg1 and not arg2 then
			print(event)
		end
	end
end)
SimplePowerBar.EventHandler = EventHandler