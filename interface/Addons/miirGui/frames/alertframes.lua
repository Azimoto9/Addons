	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()
		
		--[[  AchievementAlert Frame  ]]--
		
		local ach1 = CreateFrame("Frame","miirgui_ach1_border")	
		ach1:SetBackdrop({bgFile = "Interface\\Achievementframe\\miirgui_ach.tga",})
		ach1:SetBackdropColor(1, 1, 1, 1)
		ach1:SetSize(512,64)	
		ach1:SetAlpha(0)
				
		local ach2 = CreateFrame("Frame","miirgui_ach2_border")	
		ach2:SetBackdrop({bgFile = "Interface\\Achievementframe\\miirgui_ach.tga",})
		ach2:SetBackdropColor(1, 1, 1, 1)
		ach2:SetSize(512,64)	
		ach2:SetAlpha(0)	
				
		local function miirgui_AchievementAlertFrame_ShowAlert()
			if(AchievementAlertFrame1) then
				AchievementAlertFrame1:SetFrameStrata("TOOLTIP")
				AchievementAlertFrame1Icon:SetFrameStrata("MEDIUM")
				AchievementAlertFrame1ShieldIcon:SetTexture("Interface\\Achievementframe\\miirgui_shield.blp")
				AchievementAlertFrame1GuildBanner:Hide()
				AchievementAlertFrame1GuildBorder:Hide()
				AchievementAlertFrame1Background:Hide()

				ach1:SetParent("AchievementAlertFrame1Icon")	
				ach1:SetPoint("LEFT",-51,3)
				ach1:SetFrameStrata("HIGH")
				ach1:SetAlpha(1)					

				AchievementAlertFrame1ShieldPoints:SetTextColor(1,1,1,1)
				AchievementAlertFrame1ShieldPoints:SetFont(unpack(miirgui.medium))
				AchievementAlertFrame1ShieldPoints:SetShadowColor(0,0,0,0)
				AchievementAlertFrame1Unlocked:SetTextColor(unpack(miirgui.Color))
				AchievementAlertFrame1Unlocked:SetFont(unpack(miirgui.small))
				AchievementAlertFrame1Unlocked:SetShadowColor(0,0,0,0)
				AchievementAlertFrame1Name:SetTextColor(1,1,1,1)
				AchievementAlertFrame1Name:SetFont(unpack(miirgui.medium))
				AchievementAlertFrame1Name:SetShadowColor(0,0,0,0)
				AchievementAlertFrame1GuildName:SetTextColor(1,1,1,1)
				AchievementAlertFrame1GuildName:SetFont(unpack(miirgui.medium))
				AchievementAlertFrame1GuildName:SetShadowColor(0,0,0,0)
			end
			if (AchievementAlertFrame2) then 
				AchievementAlertFrame2:SetFrameStrata("TOOLTIP")
				AchievementAlertFrame2Icon:SetFrameStrata("MEDIUM")
				AchievementAlertFrame2ShieldIcon:SetTexture("Interface\\Achievementframe\\miirgui_shield.blp")
				AchievementAlertFrame2GuildBanner:Hide()
				AchievementAlertFrame2GuildBorder:Hide()
				AchievementAlertFrame2Background:Hide()

				ach2:SetParent("AchievementAlertFrame2Icon")	
				ach2:SetPoint("LEFT",-51,3)
				ach2:SetFrameStrata("HIGH")
				ach2:SetAlpha(1)	
				
				AchievementAlertFrame2ShieldPoints:SetTextColor(1,1,1,1)
				AchievementAlertFrame2ShieldPoints:SetFont(unpack(miirgui.medium))
				AchievementAlertFrame2ShieldPoints:SetShadowColor(0,0,0,0)
				AchievementAlertFrame2Unlocked:SetTextColor(unpack(miirgui.Color))
				AchievementAlertFrame2Unlocked:SetFont(unpack(miirgui.small))
				AchievementAlertFrame2Unlocked:SetShadowColor(0,0,0,0)
				AchievementAlertFrame2Name:SetTextColor(1,1,1,1)
				AchievementAlertFrame2Name:SetFont(unpack(miirgui.medium))
				AchievementAlertFrame2Name:SetShadowColor(0,0,0,0)
				AchievementAlertFrame2GuildName:SetTextColor(1,1,1,1)
				AchievementAlertFrame2GuildName:SetFont(unpack(miirgui.medium))
				AchievementAlertFrame2GuildName:SetShadowColor(0,0,0,0)		
			end
		end

		hooksecurefunc("AchievementAlertFrame_ShowAlert",miirgui_AchievementAlertFrame_ShowAlert)	

		--[[  Guild ChallengeAlert Frame  ]]--
	
		local function miirgui_GuildChallengeAlertFrame_ShowAlert()
			if(GuildChallengeAlertFrame) then
				chabg= select(3,GuildChallengeAlertFrame:GetRegions() )
				chabg:Hide()
				
				chabg= select(1,GuildChallengeAlertFrame:GetRegions() )
				chabg:SetWidth(42)
				chabg:SetHeight(42)
				
				Icon= select(4,GuildChallengeAlertFrame:GetRegions() )
				Icon:SetWidth(42)
				Icon:SetHeight(42)
				
				chabg= select(2,GuildChallengeAlertFrame:GetRegions() )
				chabg:Hide()
				
				m_border(GuildChallengeAlertFrame,46,46,"Left",12,0,12,"TOOLTIP")
				
				local cha1 = CreateFrame("Frame", "nil",GuildChallengeAlertFrame)
				cha1:SetFrameStrata("HIGH")
				cha1:SetPoint("TOPLEFT",GuildChallengeAlertFrame,14,-15)
				cha1:SetPoint("BOTTOMRIGHT",GuildChallengeAlertFrame,-15,15)
				cha1:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
				cha1:SetBackdropColor(1, 1, 1, 1)
				cha1:SetBackdropBorderColor(1, 1, 1,1)

				GuildChallengeAlertFrameCount:SetFont(unpack(miirgui.medium))
				GuildChallengeAlertFrameCount:SetShadowColor(0,0,0,0)
				GuildChallengeAlertFrameCount:SetTextColor(1, 1, 1,1)
				GuildChallengeAlertFrameType:SetFont(unpack(miirgui.small))
				GuildChallengeAlertFrameType:SetShadowColor(0,0,0,0)
				GuildChallengeAlertFrameType:SetTextColor(1, 1, 1,1)
				ChallengeTitle= select(5,GuildChallengeAlertFrame:GetRegions() )
				ChallengeTitle:SetFont(unpack(miirgui.medium))
				ChallengeTitle:SetShadowColor(0,0,0,0)
				ChallengeTitle:SetTextColor(unpack(miirgui.Color))
			end
		end

		hooksecurefunc("GuildChallengeAlertFrame_ShowAlert",miirgui_GuildChallengeAlertFrame_ShowAlert)

		--[[  ChallengeModeAlert Frame  ]]--

		local function miirgui_ChallengeModeAlertFrame_ShowAlert()	
				bg= select(1,ChallengeModeAlertFrame1:GetRegions() )
				bg:SetTexture("Interface\\Achievementframe\\miirgui_ach.tga")
				bg:ClearAllPoints()
				bg:SetPoint("CENTER",30,0)

				ChallengeModeAlertFrame1DungeonTexture:SetSize(49,49)
				ChallengeModeAlertFrame1DungeonTexture:ClearAllPoints()
				ChallengeModeAlertFrame1DungeonTexture:SetPoint("LEFT",18,0)		
				
				complete= select(4,ChallengeModeAlertFrame1:GetRegions() )
				complete:SetFont(unpack(miirgui.small))
				complete:SetShadowColor(0,0,0,0)
				complete:SetTextColor(unpack(miirgui.Color))
				time= select(5,ChallengeModeAlertFrame1:GetRegions() )
				time:SetFont(unpack(miirgui.medium))
				time:SetShadowColor(0,0,0,0)
				time:SetTextColor(1, 1, 1,1)
		end

		hooksecurefunc("ChallengeModeAlertFrame_ShowAlert",miirgui_ChallengeModeAlertFrame_ShowAlert)

		--[[  Achievement CriteriaAlert Frame  ]]--

		local function miirgui_CriteriaAlertFrame_ShowAlert(achievementID, criteriaID)
			if(CriteriaAlertFrame1) then
				CriteriaAlertFrame1:SetFrameStrata("TOOLTIP")
				CriteriaAlertFrame1Background:SetTexture("Interface\\Achievementframe\\miirgui_ach.tga")
				CriteriaAlertFrame1Background:ClearAllPoints()
				CriteriaAlertFrame1Background:SetPoint("CENTER",30,3)
				
				CriteriaAlertFrame1Icon:SetSize(48,48)
				CriteriaAlertFrame1Icon:ClearAllPoints()
				CriteriaAlertFrame1Icon:SetPoint("LEFT",-9,0)
				CriteriaAlertFrame1Icon:SetFrameStrata("HIGH")

				CriteriaAlertFrame1Unlocked:SetTextColor(unpack(miirgui.Color))
				CriteriaAlertFrame1Unlocked:SetFont(unpack(miirgui.medium))
				CriteriaAlertFrame1Unlocked:SetShadowColor(0,0,0,0)
				CriteriaAlertFrame1Name:SetTextColor(1,1,1,1)
				CriteriaAlertFrame1Name:SetFont(unpack(miirgui.small))
				CriteriaAlertFrame1Name:SetShadowColor(0,0,0,0)
			end
			if(CriteriaAlertFrame2) then
				CriteriaAlertFrame2:SetFrameStrata("TOOLTIP")
				CriteriaAlertFrame2Background:SetTexture("Interface\\Achievementframe\\miirgui_ach.tga")
				CriteriaAlertFrame2Background:ClearAllPoints()
				CriteriaAlertFrame2Background:SetPoint("CENTER",30,3)
				
				CriteriaAlertFrame2Icon:SetSize(48,48)
				CriteriaAlertFrame2Icon:ClearAllPoints()
				CriteriaAlertFrame2Icon:SetPoint("LEFT",-9,0)
				CriteriaAlertFrame2Icon:SetFrameStrata("HIGH")

				CriteriaAlertFrame2Unlocked:SetTextColor(unpack(miirgui.Color))
				CriteriaAlertFrame2Unlocked:SetFont(unpack(miirgui.medium))
				CriteriaAlertFrame2Unlocked:SetShadowColor(0,0,0,0)
				CriteriaAlertFrame2Name:SetTextColor(1,1,1,1)
				CriteriaAlertFrame2Name:SetFont(unpack(miirgui.small))
				CriteriaAlertFrame2Name:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc("CriteriaAlertFrame_ShowAlert",miirgui_CriteriaAlertFrame_ShowAlert)

		--[[  Digsite Alert Frame  ]]--

		local dig = CreateFrame("Frame", "miirgui_dig_bg")
		dig:SetFrameStrata("HIGH")
		dig:SetSize(220,58)
		dig:SetBackdrop({
		bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 12,insets = { left = 2, right = 2, top =2, bottom = 2 }})
		dig:SetBackdropColor(1, 1, 1, 1)
		dig:SetBackdropBorderColor(1, 1, 1,1)
		
		local function miirgui_DigsiteCompleteToastFrame_ShowAlert(researchBranchID)
			DigsiteCompleteToastFrame.DigsiteTypeTexture:SetSize(82,82)
			DigsiteCompleteToastFrame.DigsiteTypeTexture:ClearAllPoints()
			DigsiteCompleteToastFrame.DigsiteTypeTexture:SetPoint("LEFT",14,-14)
			bg = select(1,DigsiteCompleteToastFrame:GetRegions());
			bg:Hide()
				
			dig:SetParent("DigsiteCompleteToastFrame")	
			dig:SetPoint("CENTER")
			dig:SetFrameStrata("HIGH")
			dig:Show()
			
			race = select(2,DigsiteCompleteToastFrame:GetRegions());
			race:SetTextColor(1, 1, 1,1)
			race:SetShadowColor(0,0,0,0)
			race:SetFont(unpack(miirgui.medium))
			complete = select(3,DigsiteCompleteToastFrame:GetRegions());
			complete:SetTextColor(unpack(miirgui.Color))
			complete:SetShadowColor(0,0,0,0)
			complete:SetFont(unpack(miirgui.small))
		end

		hooksecurefunc("DigsiteCompleteToastFrame_ShowAlert",miirgui_DigsiteCompleteToastFrame_ShowAlert)

		--[[  Garrison Mission Alert Frame  ]]--

		
		local mis1 = CreateFrame("Frame","miirgui_mission_border")	
		mis1:SetBackdrop({bgFile = "Interface\\Achievementframe\\miirgui_ach.tga",})
		mis1:SetBackdropColor(1, 1, 1, 1)
		mis1:SetSize(512,64)	
		mis1:Hide()
				
		local mis2 = CreateFrame("Frame","miirgui_mission_border")	
		mis2:SetBackdrop({bgFile = "Interface\\Achievementframe\\miirgui_ach.tga",})
		mis2:SetBackdropColor(1, 1, 1, 1)
		mis2:SetSize(512,64)	
		mis2:Hide()	
		
		local mis3 = CreateFrame("Frame","miirgui_mission_border")	
		mis3:SetBackdrop({bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",})
		mis3:SetBackdropColor(1, 1, 1, 1)
		mis3:SetSize(44,44)	
		mis3:Hide()	
		
		local function miirgui_GarrisonMissionAlertFrame_ShowAlert(missionID)
			if(GarrisonMissionAlertFrame) then
			GarrisonMissionAlertFrame.Background:Hide()	
			GarrisonMissionAlertFrame.IconBG:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
			GarrisonMissionAlertFrame.IconBG:ClearAllPoints()
			GarrisonMissionAlertFrame.IconBG:SetSize(44,44)
			GarrisonMissionAlertFrame.IconBG:SetPoint("CENTER",-123,8)		
			GarrisonMissionAlertFrame.MissionType:ClearAllPoints()
			GarrisonMissionAlertFrame.MissionType:SetPoint("CENTER",-121,8)
			GarrisonMissionAlertFrame.MissionType:SetSize(50,50)
			
			mis1:SetParent("GarrisonMissionAlertFrame")	
			mis1:SetPoint("CENTER",20,8)
			mis1:SetFrameStrata("HIGH")
			mis1:Show()	

			GarrisonMissionAlertFrame.Title:SetTextColor(unpack(miirgui.Color))
			GarrisonMissionAlertFrame.Title:SetFont(unpack(miirgui.medium))
			GarrisonMissionAlertFrame.Title:SetShadowColor(0,0,0,0)
			
			GarrisonMissionAlertFrame.Name:SetTextColor(1, 1, 1,1)
			GarrisonMissionAlertFrame.Name:SetShadowColor(0,0,0,0)
			GarrisonMissionAlertFrame.Name:SetFont(unpack(miirgui.small))
			end
			
			if (GarrisonShipMissionAlertFrame) then
			GarrisonShipMissionAlertFrame.Background:Hide()
			
			GarrisonShipMissionAlertFrame.Name:SetTextColor(1, 1, 1,1)
			GarrisonShipMissionAlertFrame.Name:SetFont(unpack(miirgui.small))
			GarrisonShipMissionAlertFrame.Name:SetShadowColor(0,0,0,0)		
			
			GarrisonShipMissionAlertFrame.Title:SetTextColor(unpack(miirgui.Color))
			GarrisonShipMissionAlertFrame.Title:SetShadowColor(0,0,0,0)
			GarrisonShipMissionAlertFrame.Title:SetFont(unpack(miirgui.medium))
			
			GarrisonShipMissionAlertFrame.MissionType:ClearAllPoints()
			GarrisonShipMissionAlertFrame.MissionType:SetPoint("CENTER",-122,8)
			GarrisonShipMissionAlertFrame.MissionType:SetSize(50,50)
			
			mis2:SetParent("GarrisonShipMissionAlertFrame")	
			mis2:SetPoint("CENTER",20,8)
			mis2:SetFrameStrata("HIGH")
			mis2:Show()	
			
			mis3:SetParent("GarrisonShipMissionAlertFrame")	
			mis3:SetPoint("CENTER",-123,8)
			mis3:SetFrameStrata("HIGH")
			mis3:Show()	
			
			end
		end

		hooksecurefunc("GarrisonMissionAlertFrame_ShowAlert",miirgui_GarrisonMissionAlertFrame_ShowAlert)

		--[[  Follower Gained Alert Frame ]]--

		local fwl = CreateFrame("Frame","miirgui_fwl_border")	
		fwl:SetBackdrop({bgFile = "Interface\\Achievementframe\\miirgui_ach.tga",})
		fwl:SetBackdropColor(1, 1, 1, 1)
		fwl:SetSize(512,64)	
		fwl:Hide()
		
		local function miirgui_GarrisonFollowerAlertFrame_ShowAlert(followerID, name, displayID, level, quality, isUpgraded)
				bg=select(5,GarrisonFollowerAlertFrame:GetRegions())
				bg:Hide()		
				GarrisonFollowerAlertFrame.FollowerBG:Hide()
				
				
				fwl:SetParent("GarrisonFollowerAlertFrame")	
				fwl:SetPoint("CENTER",1,5)
				fwl:SetFrameStrata("HIGH")
				fwl:Show()		
			
				GarrisonFollowerAlertFrame.Name:SetTextColor(unpack(miirgui.Color))
				GarrisonFollowerAlertFrame.Name:SetFont(unpack(miirgui.medium))
				GarrisonFollowerAlertFrame.Name:SetShadowColor(0,0,0,0)

				GarrisonFollowerAlertFrame.Title:SetTextColor(1, 1, 1,1)
				GarrisonFollowerAlertFrame.Title:SetShadowColor(0,0,0,0)
				GarrisonFollowerAlertFrame.Title:SetFont(unpack(miirgui.small))
				
				portraitborder=select(1,GarrisonFollowerAlertFrame.PortraitFrame:GetRegions())
				portraitborder:Hide()
		
				portraitborder1=select(3,GarrisonFollowerAlertFrame.PortraitFrame:GetRegions())
				portraitborder1:SetTexture("Interface\\ContainerFrame\\quality.blp")
				portraitborder1:SetHeight(51)
				portraitborder1:SetWidth(51)
				portraitborder1:ClearAllPoints()
				portraitborder1:SetPoint("CENTER",-32,2)
				
				levelbg=select(4,GarrisonFollowerAlertFrame.PortraitFrame:GetRegions())
				levelbg:Hide()
				
				portrait=select(2,GarrisonFollowerAlertFrame.PortraitFrame:GetRegions())
				portrait:ClearAllPoints()
				portrait:SetPoint("LEFT",-28,2)
				portrait:SetSize(44,44)
				portrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				
				level=select(5,GarrisonFollowerAlertFrame.PortraitFrame:GetRegions())
				level:SetTextColor(1, 1, 1,1)
				level:SetShadowColor(0,0,0,0)
				level:SetFont(unpack(miirgui.small))
				level:ClearAllPoints()
				level:SetPoint("CENTER", 0,-18)
		end

		hooksecurefunc("GarrisonFollowerAlertFrame_ShowAlert",miirgui_GarrisonFollowerAlertFrame_ShowAlert)

		fwl2 = CreateFrame("Frame", "miirgui_dig_bg")
		fwl2:SetFrameStrata("HIGH")
		fwl2:SetSize(300,64)
		fwl2:SetBackdrop({
		bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 12,insets = { left = 2, right = 2, top =2, bottom = 2 }})
		fwl2:SetBackdropColor(1, 1, 1, 1)
		fwl2:SetBackdropBorderColor(1, 1, 1,1)
		
		--[[  Ship Gained Alert Frame ]]--		

		local function miirgui_GarrisonShipFollowerAlertFrame_ShowAlert(followerID, name, class, texPrefix, level, quality, isUpgraded)		
			GarrisonShipFollowerAlertFrame.Background:Hide()
			--GarrisonShipFollowerAlertFrame.Name:SetTextColor(unpack(miirgui.Color))
			GarrisonShipFollowerAlertFrame.Name:SetFont(unpack(miirgui.medium))
			GarrisonShipFollowerAlertFrame.Name:SetShadowColor(0,0,0,0)

			GarrisonShipFollowerAlertFrame.Title:SetTextColor(1, 1, 1,1)
			GarrisonShipFollowerAlertFrame.Title:SetShadowColor(0,0,0,0)
			GarrisonShipFollowerAlertFrame.Title:SetFont(unpack(miirgui.small))
			
			
			GarrisonShipFollowerAlertFrame.Class:SetTextColor(1, 1, 1,1)
			GarrisonShipFollowerAlertFrame.Class:SetShadowColor(0,0,0,0)
			GarrisonShipFollowerAlertFrame.Class:SetFont(unpack(miirgui.small))
			
			fwl2:SetParent("GarrisonShipFollowerAlertFrame")	
			fwl2:SetPoint("CENTER",0,5)
			fwl2:SetFrameStrata("HIGH")
			fwl2:Show()	
		end
		
		hooksecurefunc("GarrisonShipFollowerAlertFrame_ShowAlert",miirgui_GarrisonShipFollowerAlertFrame_ShowAlert)
		
		--[[  Loot UpgradeFrame ]]--
		
		local function miirgui_LootUpgradeFrame_SetUp(self, itemLink, quantity, specID, baseQuality)
			local itemName, itemHyperLink, itemRarity, _, _, _, _, _, _, itemTexture = GetItemInfo(itemLink)
			local baseQualityColor = ITEM_QUALITY_COLORS[baseQuality]
			local upgradeQualityColor = ITEM_QUALITY_COLORS[itemRarity]

			local lwt = CreateFrame("Frame", "nil",self)
			lwt:SetFrameStrata("HIGH")
			lwt:SetSize(220,49)
			lwt:SetBackdrop({
			bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 12,insets = { left = 3, right = 3, top =3, bottom = 3 }})
			lwt:SetBackdropColor(1, 1, 1, 1)
			lwt:SetBackdropBorderColor(1, 1, 1,1)
			
			lwt:SetParent(self)	
			lwt:SetPoint("CENTER",41,-1)
			lwt:SetFrameStrata("HIGH")
			lwt:Show()		
			
			bg=select(1,self:GetRegions())
			bg:Hide()

			self.BaseQualityItemName:SetTextColor(baseQualityColor.r, baseQualityColor.g, baseQualityColor.b);
			self.BaseQualityItemName:SetFont(unpack(miirgui.small))
			self.BaseQualityItemName:SetPoint("CENTER",20,-8)

			self.UpgradeQualityItemName:SetTextColor(upgradeQualityColor.r, upgradeQualityColor.g, upgradeQualityColor.b);
			self.UpgradeQualityItemName:SetFont(unpack(miirgui.small))
			self.UpgradeQualityItemName:SetPoint("CENTER",20,-8)

			self.TitleText:SetFont(unpack(miirgui.small))
			self.TitleText:SetTextColor(1,1,1,1)
			self.TitleText:ClearAllPoints()
			self.TitleText:SetPoint("CENTER",40,12)

			local baseTexture = LOOTUPGRADEFRAME_QUALITY_TEXTURES[baseQuality] or LOOTUPGRADEFRAME_QUALITY_TEXTURES[LE_ITEM_QUALITY_UNCOMMON];
			local upgradeTexture = LOOTUPGRADEFRAME_QUALITY_TEXTURES[itemRarity] or LOOTUPGRADEFRAME_QUALITY_TEXTURES[LE_ITEM_QUALITY_UNCOMMON];

			self.BaseQualityBorder:SetTexture("Interface\\LootFrame\\quality.blp")
			self.BaseQualityBorder:SetVertexColor(baseQualityColor.r, baseQualityColor.g, baseQualityColor.b)

			self.UpgradeQualityBorder:SetTexture("Interface\\LootFrame\\quality.blp")
			self.UpgradeQualityBorder:SetVertexColor(upgradeQualityColor.r, upgradeQualityColor.g, upgradeQualityColor.b)
		end

		hooksecurefunc("LootUpgradeFrame_SetUp",miirgui_LootUpgradeFrame_SetUp)
		
		--[[  New Mission Received Frame ]]--
		
		local nmf = CreateFrame("Frame","miirgui_nmf_border")	
		nmf:SetBackdrop({bgFile = "Interface\\Achievementframe\\miirgui_ach.tga",})
		nmf:SetBackdropColor(1, 1, 1, 1)
		nmf:SetSize(512,64)	
		nmf:Hide()
		
		local function miirgui_GarrisonRandomMissionAlertFrame_ShowAlert(missionID)
			GarrisonRandomMissionAlertFrame.Level:SetTextColor(unpack(miirgui.Color))
			GarrisonRandomMissionAlertFrame.Level:SetFont(unpack(miirgui.huge))	
			GarrisonRandomMissionAlertFrame.ItemLevel:SetTextColor(1,1,1,1)
			GarrisonRandomMissionAlertFrame.ItemLevel:SetFont(unpack(miirgui.medium))
			GarrisonRandomMissionAlertFrame.IconBG:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
			GarrisonRandomMissionAlertFrame.IconBG:ClearAllPoints()
			GarrisonRandomMissionAlertFrame.IconBG:SetSize(44,44)
			GarrisonRandomMissionAlertFrame.IconBG:SetPoint("LEFT",20,5)
			GarrisonRandomMissionAlertFrame.MissionType:Hide()

			text1=select(5,GarrisonRandomMissionAlertFrame:GetRegions())
			text1:SetTextColor(1,1,1,1)
			text1:SetFont(unpack(miirgui.huge))
			text1=select(6,GarrisonRandomMissionAlertFrame:GetRegions())
			text1:SetTextColor(1,1,1,1)
			text1:SetFont(unpack(miirgui.huge))
			
			GarrisonRandomMissionAlertFrame.Background:Hide()
			GarrisonRandomMissionAlertFrame.Blank:Hide()
			fwl:SetParent("GarrisonRandomMissionAlertFrame")	
			fwl:SetPoint("CENTER",26,5)
			fwl:SetFrameStrata("HIGH")
			fwl:Show()	
			
		end
		
		hooksecurefunc("GarrisonRandomMissionAlertFrame_ShowAlert",miirgui_GarrisonRandomMissionAlertFrame_ShowAlert)
		
		--[[ Garrison Building Complete Frame  ]]--

		bg=select(1,GarrisonBuildingAlertFrame:GetRegions())
		bg:Hide()

		title=select(3,GarrisonBuildingAlertFrame:GetRegions())
		title:ClearAllPoints()
		title:SetPoint("CENTER",GarrisonBuildingAlertFrame,10,14)
		title:SetTextColor(unpack(miirgui.Color))
		title:SetFont(unpack(miirgui.small))
		title:SetShadowColor(0,0,0,0)
		
		building=select(4,GarrisonBuildingAlertFrame:GetRegions())
		building:SetFont(unpack(miirgui.medium))
		building:SetShadowColor(0,0,0,0)

		m_border(GarrisonBuildingAlertFrame,44,44,"Left",18,2,14,"TOOLTIP")
		local ididit = CreateFrame("Frame", "nil",GarrisonBuildingAlertFrame)
		ididit:SetFrameStrata("HIGH")
		ididit:SetPoint("TOPLEFT",GarrisonBuildingAlertFrame,20,-18)
		ididit:SetPoint("BOTTOMRIGHT",GarrisonBuildingAlertFrame,-25,22)
		ididit:SetBackdrop({
		bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
		ididit:SetBackdropColor(1, 1, 1, 1)
		ididit:SetBackdropBorderColor(1, 1, 1,1)

	end)