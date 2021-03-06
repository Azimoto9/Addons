local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()

--+ LootAlert Frame

local function miirgui_LootAlertSystem(self)
	if ( self.BGAtlas ) then
		self.BGAtlas:Hide();
		self.Background:Show()
	end	
	if self.SpecIcon then
		self.SpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	end
	if self.PvPBackground then
		self.PvPBackground:Hide()
		self.Background:Show()
	end
	self.RollValue:ClearAllPoints()
	self.RollValue:SetPoint("RIGHT",self.Label,10,0)
	self.RollTypeIcon:ClearAllPoints()
	self.RollTypeIcon:SetPoint("RIGHT",self.RollValue,20,-1)
	self.RollTypeIcon:SetSize(18,18)
	
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	self.Background:SetTexCoord(0,1,1,0)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("LEFT",self.Background,91,0)
	self.Icon:SetSize(44,44)
	self.Icon:SetTexCoord(0.15, 0.85, 0.15, 0.85)
	self.IconBorder:ClearAllPoints()
	self.IconBorder:Hide()
	
	self.Label:ClearAllPoints()
	self.Label:SetPoint("TOP",self.Background,0,-10)
	m_fontify(self.Label,"color")
	self.Label:SetJustifyH("CENTER")
	
	self.ItemName:ClearAllPoints()
	self.ItemName:SetPoint("CENTER",self.Label,0,-20)
	self.ItemName:SetJustifyH("CENTER")
	
	self.glow:ClearAllPoints()
	self:SetHeight(71)
end

hooksecurefunc(LootAlertSystem,"setUpFunction",miirgui_LootAlertSystem)	
hooksecurefunc("LootWonAlertFrame_SetUp",miirgui_LootAlertSystem)

--+ MoneyAlert Frame   

local function miirgui_MoneyWonAlertSystem(self)
	self.Background:ClearAllPoints()	
	self.Background:SetPoint("CENTER",self,0,0.5)
	self.Background:SetSize(512,64)
	self.Background:SetTexCoord(0,1,1,0)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.Icon:ClearAllPoints()	
	self.Icon:SetPoint("LEFT",self.Background,91,0)
	self.Icon:SetSize(44,44)
	self.Icon:SetTexCoord(0.15, 0.85, 0.15, 0.85)
	self.IconBorder:Hide()
	m_fontify(self.Label,"color")
	self.Label:ClearAllPoints()
	self.Label:SetPoint("TOP",self,0,-16)
	self.Label:SetJustifyH("CENTER")
	m_fontify(self.Amount,"white")	
	self.Amount:ClearAllPoints()
	self.Amount:SetPoint("CENTER",self.Label,0,-20)
	self.Amount:SetJustifyH("CENTER")
	self:SetHeight(71)
end

hooksecurefunc(MoneyWonAlertSystem,"setUpFunction",miirgui_MoneyWonAlertSystem)
hooksecurefunc("MoneyWonAlertFrame_SetUp",miirgui_MoneyWonAlertSystem)

--+ AchievementAlert Frame 

local function miirgui_AchievementAlertSystem(self)

	self.Icon:SetFrameStrata("MEDIUM")
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	self.Background:SetTexCoord(0,1,1,0)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.GuildBanner:Hide()
	self.GuildBorder:Hide()
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("LEFT",self.Background,92,-3)
	self.Icon:SetSize(42,42)
	self.Icon.Texture:SetTexCoord(0.15, 0.85, 0.15, 0.85)	
	self.Shield:ClearAllPoints()
	self.Shield:SetPoint("RIGHT",self.Background,-138,-2)
	self.GuildName:Hide()
	self.glow:ClearAllPoints()
	self.shine:ClearAllPoints()
	
	m_fontify(self.Unlocked,"color")
	self.Unlocked:ClearAllPoints()
	self.Unlocked:SetPoint("TOP",self.Background,0,-14)
	self.Unlocked:SetJustifyH("CENTER")
	m_fontify(self.Name,"white")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Unlocked,0,-20)
	self.Name:SetJustifyH("CENTER")
	m_fontify(self.Shield.Points,"white")	
	self.Shield.Points:SetJustifyH("CENTER")
	self:SetHeight(71)
end
		
hooksecurefunc(AchievementAlertSystem,"setUpFunction",miirgui_AchievementAlertSystem)

--+  AchievementCriteriaAlert Frame
				
local function miirgui_CriteriaAlertSystem(self)		
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("LEFT",self.Background,55,-3)
	self.Icon.Texture:SetSize(44,44)
	self.Icon.Texture:SetTexCoord(0.15, 0.85, 0.15, 0.85)			
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	self.Background:SetTexCoord(0,1,1,0)		
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")	
	m_fontify(self.Unlocked,"color")
	self.Unlocked:ClearAllPoints()
	self.Unlocked:SetPoint("TOP",self,0,-14)	
	self.Unlocked:SetJustifyH("CENTER")
	
	m_fontify(self.Name,"white")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Unlocked,0,-20)
	self.Name:SetJustifyH("CENTER")
	self:SetHeight(71)
end

hooksecurefunc(CriteriaAlertSystem,"setUpFunction",miirgui_CriteriaAlertSystem)
	
-- GuildchallengeAlert Frame
			
local function miirgui_GuildChallengeAlertSystem(self)
	self.EmblemBackground:SetSize(48,48)
	self.EmblemBackground:ClearAllPoints()
	self.EmblemBackground:SetPoint("LEFT",-32,0)	
	self.EmblemIcon:SetSize(44,44)
	self.EmblemIcon:SetPoint("LEFT",-30,0)
	local _,GuildChallengeAlertFrameBackground= self:GetRegions()
	GuildChallengeAlertFrameBackground:ClearAllPoints()
	GuildChallengeAlertFrameBackground:SetParent(self)	
	GuildChallengeAlertFrameBackground:SetPoint("CENTER",0,0.5)
	GuildChallengeAlertFrameBackground:SetSize(512,64)
	GuildChallengeAlertFrameBackground:SetTexCoord(0,1,1,0)
	m_SetTexture(GuildChallengeAlertFrameBackground,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.EmblemBorder:Hide()
	local _,_,_,_,GuildChallengeAlertFrameName = self:GetRegions()	
	
	m_fontify(GuildChallengeAlertFrameName,"color")
	GuildChallengeAlertFrameName:ClearAllPoints()
	GuildChallengeAlertFrameName:SetPoint("TOP",self,0,-17)
	GuildChallengeAlertFrameName:SetJustifyH("CENTER")
	
	m_fontify(self.Type,"white")
	self.Type:ClearAllPoints()
	self.Type:SetPoint("CENTER",GuildChallengeAlertFrameName,0,-20)
	self.Type:SetJustifyH("CENTER")
	
	m_fontify(self.Count,"color")	
	self:SetHeight(71)
end
		
hooksecurefunc(GuildChallengeAlertSystem,"setUpFunction",miirgui_GuildChallengeAlertSystem)
	
-- DungeonCompletionAlert Frame	
	
local function miirgui_DungeonCompletionAlertSystem(self)
	m_fontify(self.instanceName,"white")
	local _,_,_,_,_,_,DungeonCompletionAlertFrameInstanceNamecomplete= self:GetRegions()
	m_fontify(DungeonCompletionAlertFrameInstanceNamecomplete,"color")
end
		
hooksecurefunc(DungeonCompletionAlertSystem,"setUpFunction",miirgui_DungeonCompletionAlertSystem)

local function miirgui_InvasionAlertSystem()
	local self=ScenarioLegionInvasionAlertFrame
	local _,_,ScenarioLegionInvasionAlertFrameCompleted = self:GetRegions()
	local ScenarioLegionInvasionAlertFrameBackground = self:GetRegions()
	ScenarioLegionInvasionAlertFrameBackground:ClearAllPoints()
	ScenarioLegionInvasionAlertFrameBackground:SetParent(self)	
	ScenarioLegionInvasionAlertFrameBackground:SetPoint("CENTER",0,0)
	ScenarioLegionInvasionAlertFrameBackground:SetSize(512,64)
	ScenarioLegionInvasionAlertFrameBackground:SetTexCoord(0,1,1,0)
	m_SetTexture(ScenarioLegionInvasionAlertFrameBackground,"Interface\\Achievementframe\\miirgui_ach.tga")
	m_fontify(ScenarioLegionInvasionAlertFrameCompleted,"color")
	ScenarioLegionInvasionAlertFrameCompleted:ClearAllPoints()
	ScenarioLegionInvasionAlertFrameCompleted:SetPoint("TOP",self,0,-24)
	ScenarioLegionInvasionAlertFrameCompleted:SetJustifyH("CENTER")
	
	self.ZoneName:ClearAllPoints()
	self.ZoneName:SetPoint("CENTER",ScenarioLegionInvasionAlertFrameCompleted,0,-20)
	self.ZoneName:SetJustifyH("CENTER")
	
	local _,icon = self:GetRegions()
	icon:ClearAllPoints()
	icon:SetPoint("LEFT",self,-12,0)
	if self.RewardFrames then
		local numReward = 0
		for key in pairs(self.RewardFrames) do
			self.RewardFrames[key].texture:SetTexCoord(0.15, 0.85, 0.15, 0.85) ;
			numReward = numReward+1	
			if numReward == 1 then
				self.RewardFrames[1]:ClearAllPoints()
				self.RewardFrames[1]:SetPoint("TOP", self,0,6);
			elseif numReward >1 then
				self.RewardFrames[1]:ClearAllPoints()
				self.RewardFrames[1]:SetPoint("TOP", self,-8*numReward,6);
			end
		end
	end
	self:SetHeight(71)
end
	
hooksecurefunc(InvasionAlertSystem,"AddAlert",miirgui_InvasionAlertSystem)
		
--+ DigsiteCompleteAlert Frame
		
local function miirgui_DigsiteCompleteAlertSystem(self)
	self.DigsiteTypeTexture:SetSize(72,72)
	self.DigsiteTypeTexture:ClearAllPoints()
	self.DigsiteTypeTexture:SetPoint("BOTTOM",-127,-7)
	local DigsiteCompleteToastFrameBackground = self:GetRegions()
	
	DigsiteCompleteToastFrameBackground:ClearAllPoints()
	DigsiteCompleteToastFrameBackground:SetParent(self)	
	DigsiteCompleteToastFrameBackground:SetPoint("CENTER",0,0.5)
	DigsiteCompleteToastFrameBackground:SetSize(512,64)
	DigsiteCompleteToastFrameBackground:SetTexCoord(0,1,1,0)
	m_SetTexture(DigsiteCompleteToastFrameBackground,"Interface\\Achievementframe\\miirgui_ach_ship.tga")
	m_fontify(self.DigsiteType,"white")
	self.DigsiteType:ClearAllPoints()
	self.DigsiteType:SetPoint("CENTER",self.Title,0,-20)
	self.DigsiteType:SetJustifyH("CENTER")	
	
	m_fontify(self.Title,"color")
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",DigsiteCompleteToastFrameBackground,0,-14)
	self.Title:SetJustifyH("CENTER")
	self:SetHeight(71)
end
		
hooksecurefunc(DigsiteCompleteAlertSystem,"setUpFunction",miirgui_DigsiteCompleteAlertSystem)
		
--+  NewRecipeLearnedAlert Frame 
		
local function miirgui_NewRecipeLearnedAlertSystem(self, recipeID)	
		local tradeSkillID, _ = C_TradeSkillUI.GetTradeSkillLineForRecipe(recipeID)	
		self.Icon:Hide()
		if not self.recipeIcon then
			self.recipeIcon = CreateFrame("Frame",alertFrame)
			self.recipeIcon:SetSize(44,44)
			local texture = self.recipeIcon:CreateTexture(nil,"BACKGROUND")
			texture:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			texture:SetAllPoints(self.recipeIcon)
			self.recipeIcon.texture =texture
			self.recipeIcon:SetPoint("LEFT",self.Icon,-27,0)
			self.recipeIcon:SetParent(self)
		end
		m_SetTexture(self.recipeIcon.texture,C_TradeSkillUI.GetTradeSkillTexture(tradeSkillID))
		self.Background = self:GetRegions()
		self.Background:ClearAllPoints()
		self.Background:SetParent(self)	
		self.Background:SetPoint("CENTER",0,0.5)
		self.Background:SetSize(512,64)
		self.Background:SetTexCoord(0,1,1,0)
		m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")

		m_fontify(self.Name,"white")
		self.Name:ClearAllPoints()
		self.Name:SetPoint("CENTER",self.Title,0,-20)
		self.Name:SetJustifyH("CENTER")		
			
		m_fontify(self.Title,"color")
		self.Title:ClearAllPoints()
		self.Title:SetPoint("TOP",0,-20)
		self.Title:SetJustifyH("CENTER")	
		self:SetHeight(71)
end
		
hooksecurefunc(NewRecipeLearnedAlertSystem,"setUpFunction",miirgui_NewRecipeLearnedAlertSystem)
		
--+  LootUpgradeAlert Frame
	
local function miirgui_LootUpgradeAlertSystem(self)
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	self.Background:SetTexCoord(0,1,1,0)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")

	self.Icon:ClearAllPoints()
	self.Icon:SetParent(self)	
	self.Icon:SetSize(44,44)
	self.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	self.Icon:SetPoint("LEFT",-27,0)	
			
	self.BaseQualityBorder:ClearAllPoints()
	self.UpgradeQualityBorder:ClearAllPoints()

	self.TitleText:ClearAllPoints()
	self.TitleText:SetPoint("TOP",self,0,-14)
	m_fontify(self.TitleText,"white")
	self.TitleText:SetJustifyH("CENTER")
	
	self.WhiteText:ClearAllPoints()
	self.WhiteText:SetPoint("CENTER",self.TitleText,0,-20)
	self.WhiteText:SetJustifyH("CENTER")
	
	self.WhiteText2:ClearAllPoints()	
	self.WhiteText2:SetPoint("CENTER",self.TitleText,0,-20)
	self.WhiteText2:SetJustifyH("CENTER")

	self.BaseQualityItemName:ClearAllPoints()
	self.BaseQualityItemName:SetPoint("CENTER",self.TitleText,0,-20)
	self.BaseQualityItemName:SetJustifyH("CENTER")
	
	self.UpgradeQualityItemName:ClearAllPoints()
	self.UpgradeQualityItemName:SetPoint("CENTER",self.TitleText,0,-20)
	self.UpgradeQualityItemName:SetJustifyH("CENTER")

	self.BorderGlow:ClearAllPoints()
	self.Sheen:ClearAllPoints()
	self:SetHeight(71)
end
			
hooksecurefunc(LootUpgradeAlertSystem,"setUpFunction",miirgui_LootUpgradeAlertSystem)
	
--+ GarrisonFollowerAlert Frame
		
local function miirgui_GarrisonFollowerAlertSystem(self)
	local _,_,_,_,GarrisonFollowerAlertFrameBackground = self:GetRegions()
	GarrisonFollowerAlertFrameBackground:SetPoint("Center",0,0.5)
	GarrisonFollowerAlertFrameBackground:SetSize(512,64)
	GarrisonFollowerAlertFrameBackground:SetTexCoord(0,1,1,0)
	m_SetTexture(GarrisonFollowerAlertFrameBackground,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.FollowerBG:Hide()
	self.PortraitFrame.PortraitRing:Hide()	
	m_SetTexture(self.PortraitFrame.PortraitRingQuality,"Interface\\ContainerFrame\\quality.blp")
	self.PortraitFrame.PortraitRingQuality:SetSize(52,52)
	self.PortraitFrame.PortraitRingQuality:ClearAllPoints()
	self.PortraitFrame.PortraitRingQuality:SetPoint("CENTER",self.PortraitFrame.Portrait,-1.5,0)
	self.PortraitFrame.LevelBorder:Hide()
	self.PortraitFrame.Portrait:ClearAllPoints()
	self.PortraitFrame.Portrait:SetPoint("LEFT",self,-6,0)
	self.PortraitFrame.Portrait:SetSize(44,44)
	self.PortraitFrame.Portrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
	
	m_fontify(self.Name,"color")	
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Title,0,-20)
	self.Name:SetJustifyH("CENTER")
	
	m_fontify(self.Title,"white")
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",self,0,-20)
	self.Title:SetJustifyH("CENTER")
	
	m_fontify(self.PortraitFrame.Level,"white")
	self.PortraitFrame.Level:ClearAllPoints()
	self.PortraitFrame.Level:SetPoint("BOTTOM",self.PortraitFrame.Portrait, 0,-10)
	self.PortraitFrame.Level:SetJustifyH("CENTER")
	self:SetHeight(71)
end
	
hooksecurefunc(GarrisonFollowerAlertSystem,"setUpFunction",miirgui_GarrisonFollowerAlertSystem)
	
--+ GarrisonShipAlert Frame 
	
local function miirgui_GarrisonShipFollowerAlertSystem(self)
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	self.Background:SetTexCoord(0,1,1,0)
	self.Background:SetTexture("Interface\\Achievementframe\\miirgui_ach.tga")
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.Portrait:ClearAllPoints()
	self.Portrait:SetPoint("LEFT",-6,0)
	self.Portrait:SetSize(44,44)
	self.Portrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	m_SetTexture(self.Portrait,"Interface\\Icons\\INV_Garrison_Cargoship.blp")
	
	m_fontify(self.Name,"color")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Title,0,-10)
	self.Name:SetJustifyH("CENTER")
	m_fontify(self.Title,"white")
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",self,0,-20)
	self.Name:SetJustifyH("CENTER")
	
	m_fontify(self.Class,"white")
	self.Name:SetJustifyH("CENTER")
	self:SetHeight(71)
end
	
hooksecurefunc(GarrisonShipFollowerAlertSystem,"setUpFunction",miirgui_GarrisonShipFollowerAlertSystem)
	
--+ Garrison Building Complete Frame

local function miirgui_GarrisonBuildingAlertSystem(self)
	local GarrisonBuildingAlertSystemBackground = self:GetRegions()
	GarrisonBuildingAlertSystemBackground:ClearAllPoints()
	GarrisonBuildingAlertSystemBackground:SetParent(self)	
	GarrisonBuildingAlertSystemBackground:SetPoint("Center",0,0.5)
	GarrisonBuildingAlertSystemBackground:SetSize(512,64)
	GarrisonBuildingAlertSystemBackground:SetTexCoord(0,1,1,0)
	m_SetTexture(GarrisonBuildingAlertSystemBackground,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("LEFT",-6,0)
	self.Icon:SetSize(44,44)
	self.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	
	m_fontify(self.Title,"color")
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",self,0,-22)
	self.Title:SetJustifyH("CENTER")
	
	m_fontify(self.Name,"white")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Title,0,-18)
	self.Name:SetJustifyH("CENTER")
	self:SetHeight(71)
end
		
hooksecurefunc(GarrisonBuildingAlertSystem,"setUpFunction",miirgui_GarrisonBuildingAlertSystem)
	
--+ Garrison Mission Alert Frame
		
local function miirgui_GarrisonMissionAlertSystem(self)
	m_fontify(self.Name,"white")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Title,0,-20)
	self.Name:SetJustifyH("CENTER")
	m_fontify(self.Title,"color")
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",self,0,-22)
	self.Title:SetJustifyH("CENTER")
	m_SetTexture(self.IconBG,"Interface\\FrameGeneral\\UI-Background-Rock.blp")
	self.IconBG:SetSize(44,44)
	self.IconBG:ClearAllPoints()
	self.IconBG:SetPoint("LEFT",-6,0)				
	self.MissionType:SetSize(48,48)
	self.MissionType:ClearAllPoints()
	self.MissionType:SetPoint("LEFT",-6,0)
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	self:SetHeight(71)
end

hooksecurefunc(GarrisonMissionAlertSystem,"setUpFunction",miirgui_GarrisonMissionAlertSystem)	
	
local function miirgui_GarrisonShipMissionAlertSystem(self)
	m_fontify(self.Name,"white")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("CENTER",self.Title,0,-22)
	self.Name:SetJustifyH("CENTER")
	m_fontify(self.Title,"color")		
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",self,0,-20)
	self.Title:SetJustifyH("CENTER")
	self.MissionType:SetSize(48,48)
	self.MissionType:ClearAllPoints()
	self.MissionType:SetPoint("LEFT",-8,0)
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0)
	self.Background:SetSize(512,64)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach_ship.tga")
	self:SetHeight(71)
end

hooksecurefunc(GarrisonShipMissionAlertSystem,"setUpFunction",miirgui_GarrisonShipMissionAlertSystem)

--+ Garrison Random Mission Alert Frame 
				
local function miirgui_GarrisonRandomMissionAlertSystem(self)
	m_fontify(self.Level,"white")
	m_fontify(self.ItemLevel,"white")
	self.Rare:ClearAllPoints()
	self.Rare:SetPoint("BOTTOM",self.MissionType,0,-4)
	m_fontify(self.Rare,"color")

	local _,_,_,_,GarrisonRandomMissionAlertFrameNewMission,GarrisonRandomMissionAlertFrameNewMission2=self:GetRegions()
	m_fontify(GarrisonRandomMissionAlertFrameNewMission,"color")
	GarrisonRandomMissionAlertFrameNewMission:ClearAllPoints()
	GarrisonRandomMissionAlertFrameNewMission:SetPoint("TOP",0,-20)
	
	m_fontify(GarrisonRandomMissionAlertFrameNewMission2,"color")
	self.IconBG:Hide()
	GarrisonRandomMissionAlertFrameNewMission2:ClearAllPoints()
	GarrisonRandomMissionAlertFrameNewMission2:SetPoint("CENTER",0,-6)
	
	m_SetTexture(self.MissionType,"Interface\\Icons\\achievement_raregarrisonquests_x.blp")
	self.MissionType:ClearAllPoints()
	self.MissionType:SetPoint("LEFT",-6,0)
	self.MissionType:SetSize(44,44)
	self.MissionType:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	self.IconBG:Hide()
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0)
	self.Background:SetSize(512,64)
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.Blank:Hide()
	self:SetHeight(71)
end
		
hooksecurefunc(GarrisonRandomMissionAlertSystem,"setUpFunction",miirgui_GarrisonRandomMissionAlertSystem)
		
--+ LegendaryItemAlert Frame
		
local function miirgui_LegendaryItemAlertSystem(self)

	local _,_,_,_,_,_,_,_,_,LegendaryItemAlertFrameLegendaryItem = self:GetRegions()
	
	m_fontify(LegendaryItemAlertFrameLegendaryItem,"color")
	LegendaryItemAlertFrameLegendaryItem:ClearAllPoints()
	LegendaryItemAlertFrameLegendaryItem:SetPoint("TOP",self,0,-13)
	LegendaryItemAlertFrameLegendaryItem:SetJustifyH("CENTER")
	self.shine:ClearAllPoints()
	self.glow:ClearAllPoints()
	self.ItemName:ClearAllPoints()
	self.ItemName:SetPoint("CENTER",LegendaryItemAlertFrameLegendaryItem,0,-20)
	self.ItemName:SetJustifyH("CENTER")
	
	self.Background:ClearAllPoints()
	self.Background:SetParent(self)	
	self.Background:SetPoint("CENTER",0,0.5)
	self.Background:SetSize(512,64)
	
	m_SetTexture(self.Background,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.Icon:ClearAllPoints()
	self.Icon:SetParent(self)	
	self.Icon:SetPoint("Left",-14,1)
	self.Icon:SetSize(46,46)
	self.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	self.Background2:Hide()
	self.Background3:Hide()
	self.Starglow:Hide()
	self.Particles1:Hide()
	self.Particles2:Hide()
	self.Particles3:Hide()
	self.Ring1:Hide()
	self.glow:Hide()
	self:SetHeight(71)
end

hooksecurefunc(LegendaryItemAlertSystem,"setUpFunction",miirgui_LegendaryItemAlertSystem)
		
--+ WorldQuestCompleteAlert Frame

local function miirgui_WorldQuestCompleteAlertSystem(self)	
	local _,_,_,_,_,WorldQuestCompleteAlertFrameCompleted = self:GetRegions()
	m_fontify(WorldQuestCompleteAlertFrameCompleted,"color")	
	WorldQuestCompleteAlertFrameCompleted:ClearAllPoints()
	WorldQuestCompleteAlertFrameCompleted:SetPoint("TOP",self,0,-24)
	WorldQuestCompleteAlertFrameCompleted:SetJustifyH("CENTER")
	self.QuestName:ClearAllPoints()
	self.QuestName:SetPoint("CENTER",WorldQuestCompleteAlertFrameCompleted,0,-16)
	m_fontify(self.QuestName,"white")
	self.QuestName:SetJustifyH("CENTER")
	
	local _,hideit,hideit2,hideit3=self:GetRegions()
	hideit:Hide()
	hideit2:Hide()
	hideit3:Hide()
	
	local _,_,_,_,WorldQuestCompleteAlertFrameBackground = self:GetRegions()
	WorldQuestCompleteAlertFrameBackground:ClearAllPoints()
	WorldQuestCompleteAlertFrameBackground:SetParent(self)	
	WorldQuestCompleteAlertFrameBackground:SetPoint("CENTER",0,0.5)
	WorldQuestCompleteAlertFrameBackground:SetSize(512,64)
	WorldQuestCompleteAlertFrameBackground:SetTexCoord(0,1,1,0)
	m_SetTexture(WorldQuestCompleteAlertFrameBackground,"Interface\\Achievementframe\\miirgui_ach.tga")
	self.QuestTexture:ClearAllPoints()
	self.QuestTexture:SetParent(self)	
	self.QuestTexture:SetPoint("LEFT",-11,1)
	self.QuestTexture:SetSize(46,46)
	self.QuestTexture:SetTexCoord(0.15, 0.85, 0.15, 0.85)	
	self:SetHeight(71)
end

hooksecurefunc(WorldQuestCompleteAlertSystem,"setUpFunction",miirgui_WorldQuestCompleteAlertSystem)	

hooksecurefunc("StandardRewardAlertFrame_AdjustRewardAnchors",function(frame)
	if frame.RewardFrames then
		local numReward = 0
		for key in pairs(frame.RewardFrames) do
			frame.RewardFrames[key].texture:SetTexCoord(0.15, 0.85, 0.15, 0.85) ;
			numReward = numReward+1	
			if numReward == 1 then
				frame.RewardFrames[1]:ClearAllPoints()
				frame.RewardFrames[1]:SetPoint("TOP", frame,0,6);
			elseif numReward >1 then
				frame.RewardFrames[1]:ClearAllPoints()
				frame.RewardFrames[1]:SetPoint("TOP", frame,-8*numReward,6);
			end
		end
	end	
end)

--+ Garison Talent AlertFrame

local function miirgui_GarrisonTalentAlertSystem(self)
	m_fontify(self.Title,"color")
	self.Title:ClearAllPoints()
	self.Title:SetPoint("TOP",self,0,-22)
	self.Title:SetJustifyH("CENTER")
	
	m_fontify(self.Name,"white")
	self.Name:ClearAllPoints()
	self.Name:SetPoint("BOTTOM",self.Title,0,-20)
	self.Name:SetJustifyH("CENTER")
	
	local GarrisonTalentAlertFrameBackground = self:GetRegions()
	m_SetTexture(GarrisonTalentAlertFrameBackground,"Interface\\Achievementframe\\miirgui_ach.tga")
	GarrisonTalentAlertFrameBackground:ClearAllPoints()
	GarrisonTalentAlertFrameBackground:SetParent(self)	
	GarrisonTalentAlertFrameBackground:SetPoint("CENTER",0,0.5)
	GarrisonTalentAlertFrameBackground:SetSize(512,64)
	GarrisonTalentAlertFrameBackground:SetTexCoord(0,1,1,0)	
	self.Icon:ClearAllPoints()
	self.Icon:SetParent(self)	
	self.Icon:SetPoint("Left",-8,1)
	self.Icon:SetSize(46,46)
	self.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	self:SetHeight(71)
end

hooksecurefunc(GarrisonTalentAlertSystem,"setUpFunction",miirgui_GarrisonTalentAlertSystem)	

-- Talent Points to spent
TalentMicroButtonAlertBg:SetGradientAlpha("HORIZONTAL", 1, 1, 1, 1, 1, 1, 1, 1)
TalentMicroButtonAlertBg:SetColorTexture(0.078,0.078,0.078,1)
m_border(TalentMicroButtonAlert,226,76,"CENTER",0,0,14,"DIALOG")
m_border_TalentMicroButtonAlert:SetPoint("TOPLEFT","TalentMicroButtonAlert",-3,3)
m_border_TalentMicroButtonAlert:SetPoint("BOTTOMRIGHT","TalentMicroButtonAlert",3,-3)
m_fontify(TalentMicroButtonAlert.Text,"white")
-- Collectionsalert
CollectionsMicroButtonAlertBg:SetGradientAlpha("HORIZONTAL", 1, 1, 1, 1, 1, 1, 1, 1)
CollectionsMicroButtonAlertBg:SetColorTexture(0.078,0.078,0.078,1)
m_border(CollectionsMicroButtonAlert,226,76,"CENTER",0,0,14,"DIALOG")
m_fontify(CollectionsMicroButtonAlert.Text,"white")

end)
