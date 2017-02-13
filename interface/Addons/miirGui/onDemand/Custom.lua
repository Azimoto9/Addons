local addonsToSkin = {
	["Ackis Recipe List"] = function()
			local arlListener = CreateFrame("FRAME")
			arlListener:SetScript("OnUpdate",function()	
				if ARL_MainPanel then
					ARL_ProfessionButtonPortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
					arlListener:SetScript("OnUpdate",function()end)
				end
			end)
			arlListener:SetScript("OnEvent", arlListener.OnEvent)
		end,
	["BetterArchaeologyUI"] = function()
			ArchaeologyFrameSummaryPage:HookScript("OnShow",function()
				for i=1,18 do
					local race = _G["ArchaeologyFrameSummaryPageRace"..i]
					if race then 
						m_fontify(race.raceName,"white")
					end
				end

			end)
		end,
	["Classic Quest Log"] = function()
			m_icon(ClassicQuestLog, "quest", -8, 9, "MEDIUM")
			ClassicQuestLogScrollFrame.BG:Hide()
			ClassicQuestLogDetailScrollFrame.DetailBG:Hide()
			m_border(ClassicQuestLog,0,0,"CENTER",0,0,14,"HIGH")		
			m_border_ClassicQuestLog:SetPoint("TOPLEFT","ClassicQuestLog",2,-58)
			m_border_ClassicQuestLog:SetPoint("BOTTOMRIGHT","ClassicQuestLog",-4,24)
		end,
	["Clique"] = function()
			hooksecurefunc("ToggleSpellBook",function()
				if (CliqueSpellTab) then
					local CliqueIcon = select(6,CliqueSpellTab:GetRegions())
					CliqueIcon:SetTexCoord(0.13, 0.83, 0.13, 0.83)
					CliqueConfigPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				end
			end)
		end,
	["Combuctor"] = function()
			CombuctorFrameinventoryPortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				local hideit=select(i,CombuctorFrameinventory:GetRegions())
				hideit:Hide()
			end
		end,
	["Inventorian"] = function()
			InventorianBagFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			InventorianBankFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				local hideit=select(i,InventorianBagFrame:GetRegions())
				hideit:Hide()
				local hideitalso=select(i,InventorianBankFrame:GetRegions())
				hideitalso:Hide()
			end
		end,
	["mOnArs_WardrobeHelper"] = function()
			mOnWD_MainFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		end,
}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(_, event, addon)
		if event == "ADDON_LOADED" then	
			if addonsToSkin[addon] then
				addonsToSkin[addon]()
				addonsToSkin[addon] = nil	
			end
		else	
			for addon, func in pairs(addonsToSkin) do
				if IsAddOnLoaded(addon) then
					func()
				end
			end
		end
	end)