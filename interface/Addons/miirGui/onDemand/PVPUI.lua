local function skin_Blizzard_PVPUI()
	HonorFrame.BonusFrame.WorldBattlesTexture:Hide()
	WarGamesFrame.HorizontalBar:Hide()
	local _,wargamesscroll = WarGamesFrameInfoScrollFrameScrollBar:GetRegions()
	wargamesscroll:Hide()
	local wargamesscroll2 = WarGamesFrame:GetRegions()
	wargamesscroll2:Hide()
	local _,ring1,icon1 = PVPQueueFrameCategoryButton1:GetRegions()
	ring1:Hide()
	icon1:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	icon1:SetWidth(46)
	icon1:SetHeight(46)
	local _,ring2,icon2 =PVPQueueFrameCategoryButton2:GetRegions()
	ring2:Hide()
	icon2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	icon2:SetWidth(46)
	icon2:SetHeight(46)
	local _,ring3,icon3 = PVPQueueFrameCategoryButton3:GetRegions()
	ring3:Hide()
	icon3:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	icon3:SetWidth(46)
	icon3:SetHeight(46)
	local _,ring4,icon4 = PVPQueueFrameCategoryButton4:GetRegions()
	ring4:Hide()
	icon4:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	icon4:SetWidth(46)
	icon4:SetHeight(46)
	PVPReadyDialogBackground:Hide()
	ConquestFrame.RoleInset.Background:Hide()
	HonorFrame.BonusFrame.Arena1Button.Reward.Border:Hide()
	HonorFrame.BonusFrame.Arena1Button.Reward.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)		
	HonorFrame.RoleInset.Background:Hide()
	HonorFrame.BonusFrame.RandomBGButton.Reward.Border:Hide()
	HonorFrame.BonusFrame.RandomBGButton.Reward.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
	m_border(PVPQueueFrameCategoryButton1,50,50,"LEFT",10,0,14,"MEDIUM")
	m_fontify(PVPQueueFrameCategoryButton1.Name,"white")
	m_border(PVPQueueFrameCategoryButton2,50,50,"LEFT",10,0,14,"MEDIUM")
	m_fontify(PVPQueueFrameCategoryButton2.Name,"white")
	m_border(PVPQueueFrameCategoryButton3,50,50,"LEFT",10,0,14,"MEDIUM")
	m_fontify(PVPQueueFrameCategoryButton3.Name,"white")
	m_border(PVPQueueFrameCategoryButton4,50,50,"LEFT",10,0,14,"MEDIUM")
	m_fontify(PVPQueueFrameCategoryButton4.Name,"white")
	m_border(HonorFrame,332,240,"CENTER",0,-62,12,"HIGH")
	m_border(HonorFrame.RoleInset,332,64,"CENTER",0,0,14,"HIGH")
	m_border(HonorFrame.BonusFrame.RandomBGButton,38,38,"RIGHT",-10.5,0,14,"HIGH")
	m_border(HonorFrame.BonusFrame.Arena1Button,38,38,"RIGHT",-10.5,0,14,"HIGH")
	m_border(ConquestFrame.RoleInset,332,64,"CENTER",0,0,14,"HIGH")	
	m_border(ConquestFrame,331,266,"CENTER",-0.5,-44,12,"HIGH")
	m_border(WarGamesFrame,334,382,"CENTER",1.5,9,14,"HIGH")
	m_fontify(WarGamesFrameDescription,"white")
	
	PremadeGroupsPvPTutorialAlertBg:SetGradientAlpha("HORIZONTAL", 1, 1, 1, 1, 1, 1, 1, 1)
	PremadeGroupsPvPTutorialAlertBg:SetColorTexture(0.078,0.078,0.078,1)
	m_border(PremadeGroupsPvPTutorialAlert,226,156,"CENTER",0.5,0,14,"DIALOG")		
	m_fontify(PremadeGroupsPvPTutorialAlert.Text,"white")

	ConquestFrame.Arena2v2.Reward.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
	ConquestFrame.Arena2v2.Reward.WeeklyBonus:ClearAllPoints()
	ConquestFrame.Arena2v2.Reward.WeeklyBonus:SetPoint("TOPRIGHT",ConquestFrame.Arena2v2.Reward,-0.5,-2)
	m_border(ConquestFrame.Arena2v2.Reward,36,36,"CENTER",-0.5,0,14,"MEDIUM")
	
	ConquestFrame.Arena3v3.Reward.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
	ConquestFrame.Arena3v3.Reward.WeeklyBonus:ClearAllPoints()
	ConquestFrame.Arena3v3.Reward.WeeklyBonus:SetPoint("TOPRIGHT",ConquestFrame.Arena3v3.Reward,-0.5,-2)
	m_border(ConquestFrame.Arena3v3.Reward,36,36,"CENTER",-0.5,0,14,"MEDIUM")
	
	ConquestFrame.RatedBG.Reward.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
	ConquestFrame.RatedBG.Reward.WeeklyBonus:ClearAllPoints()
	ConquestFrame.RatedBG.Reward.WeeklyBonus:SetPoint("TOPRIGHT",ConquestFrame.RatedBG.Reward,-0.5,-2)
	m_border(ConquestFrame.RatedBG.Reward,36,36,"CENTER",-0.5,0,14,"MEDIUM")
end
	
local catchaddon = CreateFrame("FRAME")
catchaddon:RegisterEvent("ADDON_LOADED")

--function to catch loading addons
local function skinnedOnLoad(_, _, addon)
	if addon == "Blizzard_PVPUI" then
		skin_Blizzard_PVPUI()
	end	
end

--this function decides whether the addon is already loaded or if we need to look out for it!

local function skinnedOnLogin()
	if IsAddOnLoaded("Blizzard_PVPUI") then
		-- Addon is already loaded, procceed to skin!
		skin_Blizzard_PVPUI()
	else
		-- Addon is not loaded yet, procceed to look out for it!
		catchaddon:SetScript("OnEvent", skinnedOnLoad)
	end
end

local HelloWorld = CreateFrame("FRAME")
HelloWorld:RegisterEvent("PLAYER_ENTERING_WORLD")
HelloWorld:SetScript("OnEvent", skinnedOnLogin)