		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		function frame:OnEvent(event, arg1)
			if event == "ADDON_LOADED" and arg1 == "Blizzard_GarrisonUI" then

			--Hiding Textures at GarrisonShipyardFrame
			
			GarrisonShipyardFrame.BackgroundTile:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				
			topborder=select(11,GarrisonShipyardFrame.BorderFrame:GetRegions())
			topborder:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")			
				
			for i = 12,18 do
				hideit=select(i,GarrisonShipyardFrame.BorderFrame:GetRegions())
				hideit:Hide()
			end
			
			GarrisonShipyardFrameFollowersListScrollFrameScrollBarBG:Hide()
		
			--Hide Textures on mission details frame
			
			for i=1,12 do
				hideit=select(i,GarrisonShipyardFrame.MissionTab.MissionPage:GetRegions())
				hideit:Hide()
			end
				
			for i=13,16 do
				hideit=select(i,GarrisonShipyardFrame.MissionTab.MissionPage:GetRegions())
				hideit:Hide()
			end
				
			for i=18,20 do
				hideit=select(i,GarrisonShipyardFrame.MissionTab.MissionPage:GetRegions())
				hideit:Hide()
			end
			
			buffbg=select(1,GarrisonShipyardFrame.MissionTab.MissionPage.BuffsFrame:GetRegions())
			buffbg:SetAlpha(0)
			bufftext=select(2,GarrisonShipyardFrame.MissionTab.MissionPage.BuffsFrame:GetRegions())
			bufftext:SetTextColor(1, 1, 1,1)
			bufftext:SetFont(unpack(miirgui.medium))
			bufftext:SetShadowColor(0,0,0,0)
			
			-- Hide unwanted rewardframe textures

			for i=1,10 do
				hideit=select(i,GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame:GetRegions())
				hideit:Hide()
			end

			hideit=select(1,GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward1:GetRegions())
			hideit:Hide()
			hideit=select(1,GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward2:GetRegions())
			hideit:Hide()
			
			--Change the rewards-font

			rewards=select(12,GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame:GetRegions())
			rewards:SetFont(unpack(miirgui.huge))
			rewards:SetShadowColor(0,0,0,0)

			reward=select(4,GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward1:GetRegions())
			reward:SetFont(unpack(miirgui.medium))
			reward:SetShadowColor(0,0,0,0)

			--Add borders to the reward frame

			m_border(GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward1,100,46,"Center",20,0,14,"MEDIUM")
			m_border(GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward1,46,46,"LEFT",-1,0,14,"MEDIUM")

			m_border(GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward2,100,46,"Center",20,0,14,"MEDIUM")
			m_border(GarrisonShipyardFrame.MissionTab.MissionPage.RewardsFrame.Reward2,46,46,"LEFT",-1,0,14,"MEDIUM")
			
			--Hide unnecessary FrameFollowers parchements
	
			for i = 1,21 do
				hideit=select(i,GarrisonShipyardFrameFollowers:GetRegions()) 
				hideit:Hide()
			end
	
			currencyborder2=select(1,GarrisonShipyardFrameFollowers.MaterialFrame:GetRegions())
			currencyborder2:Hide()

			-- Applying border

			m_border(GarrisonShipyardFrameFollowers,310,570,"Center",0,-16,12,"MEDIUM")
			m_border(GarrisonShipyardFrameFollowers.MaterialFrame,300,26,"Center",0,0,14,"MEDIUM")
			m_border(GarrisonShipyardFrame.MissionTab.MissionPage.Stage,558,238,"Center",0,0,14,"MEDIUM")	
			
			--[[		Ship Details Frame		]]--

			GarrisonShipyardFrame.FollowerTab.NumFollowers:SetTextColor(1, 1, 1,1)
			GarrisonShipyardFrame.FollowerTab.NumFollowers:SetFont(unpack(miirgui.huge))
			GarrisonShipyardFrame.FollowerTab.NumFollowers:SetShadowColor(0,0,0,0)
			GarrisonShipyardFrame.FollowerTab.HeaderBG:Hide()	
			GarrisonShipyardFrame.FollowerTab.Quality:Hide()
			
			GarrisonShipyardFrame.FollowerTab.Trait1.Border:Hide()
			GarrisonShipyardFrame.FollowerTab.Trait2.Border:Hide()
			
			GarrisonShipyardFrame.FollowerTab.EquipmentFrame.Equipment1.Border:Hide()
			GarrisonShipyardFrame.FollowerTab.EquipmentFrame.Equipment2.Border:Hide()

			
			for i = 1,21 do
				hideit=select(i,GarrisonShipyardFrame.FollowerTab:GetRegions()) 
				hideit:Hide()
			end
				
			xpleft=select(2,GarrisonShipyardFrame.FollowerTab.XPBar:GetRegions())
			xpleft:Hide()
			xpright=select(3,GarrisonShipyardFrame.FollowerTab.XPBar:GetRegions())
			xpright:Hide()
			xpmiddle=select(4,GarrisonShipyardFrame.FollowerTab.XPBar:GetRegions())
			xpmiddle:Hide()
			xptext=select(6,GarrisonShipyardFrame.FollowerTab.XPBar:GetRegions())
			xptext:SetTextColor(1, 1, 1,1)
			xptext:SetFont(unpack(miirgui.small))
			xptext:SetShadowColor(0,0,0,0)
			
				
			-- Adds borders to the ship's equipment frame as well as xp bar

			m_border(GarrisonShipyardFrame.FollowerTab.XPBar,524,16,"Center",0,0,12,"MEDIUM")				
			m_border(GarrisonShipyardFrame.FollowerTab.EquipmentFrame.Equipment1,64,64,"Center",0,0,14,"MEDIUM")
			m_border(GarrisonShipyardFrame.FollowerTab.EquipmentFrame.Equipment2,64,64,"Center",0,0,14,"MEDIUM")
		
			--Ship Follower List template
					
			local function miirgui_UpdateData(self)
			local mainFrame = self:GetParent();
			local followers = self.followers;
			local followersList = self.followersList;
			local numFollowers = #followersList;
			local scrollFrame = self.listScroll;
			local offset = HybridScrollFrame_GetOffset(scrollFrame);
			local buttons = scrollFrame.buttons;
			local numButtons = #buttons;	
			for i = 1, numButtons do
				local button = buttons[i];
				local index = offset + i; -- adjust index
				if ( index <= numFollowers) then
					local follower = followers[followersList[index]];
					button.isCollected = true;
					button.id = follower.followerID;
					button.info = follower;
							
					button.Portrait:SetPoint("CENTER",button)
					
					button.BG:SetTexture("Interface\\Garrison\\ship.blp")
					button.BG:SetSize(256,76)
					button:SetHighlightTexture("Interface\\Garrison\\shiphover.blp")
					button.Selection:SetVertexColor(unpack(miirgui.Color))
					button.Selection:SetTexture("Interface\\Garrison\\shiphover.blp")
					button.Selection:SetAlpha(0.2)

					if (follower.quality == LE_ITEM_QUALITY_EPIC) then
						button.Quality:Hide() --hide quality
					elseif (follower.quality == LE_ITEM_QUALITY_RARE) then

						button.Quality:Hide() --hide quality
					else
						button.Quality:Hide() --hide quality
					end
					
					if (follower.status) then
						button.BusyFrame:Show();
						button.BusyFrame.Texture:SetTexture("Interface\\Garrison\\shiphover.blp");
						button.BusyFrame.Texture:SetAlpha(0.2)
						button.BusyFrame.Texture:SetSize(256,76)
						button.BusyFrame.Texture:ClearAllPoints()
						button.BusyFrame.Texture:SetPoint("TOP",button,0,0)
					else
						button.BusyFrame:Hide();
					end
			
					button.XPBar:ClearAllPoints()
					button.XPBar:SetPoint("BOTTOMLEFT",button.BG,2,4)
				else
					button:Hide();
				end
			end
			end
	
			hooksecurefunc(GarrisonShipyardFrameFollowers,"UpdateData",miirgui_UpdateData)
			
			hooksecurefunc(GarrisonLandingPage.ShipFollowerList,"UpdateData",miirgui_UpdateData)
			
			--mission complete popup
			
			GarrisonShipyardFrame.MissionComplete.NextMissionButton:ClearAllPoints()
			GarrisonShipyardFrame.MissionComplete.NextMissionButton:SetPoint("CENTER",0,-276)	
			
			for i=2,12 do
				hideit=select(i,GarrisonShipyardFrame.MissionComplete:GetRegions())
				hideit:Hide()
			end
			
			bg=select(1,GarrisonShipyardFrame.MissionComplete:GetRegions())
			bg:Show()
			bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
			
			for i =1,10 do --rewards
				hideit=select(i,GarrisonShipyardFrame.MissionComplete.BonusRewards:GetRegions())
				hideit:SetAlpha(0)
			end

			for i=1,6 do
				hideit=select(i,GarrisonShipyardFrame.MissionComplete.Stage.MissionInfo:GetRegions())
				hideit:Hide()
			end
			
			for i=8,10 do
				hideit=select(i,GarrisonShipyardFrame.MissionComplete.Stage.MissionInfo:GetRegions())
				hideit:Hide()
			end
			
			GarrisonShipyardFrame.MissionComplete.BonusRewards.Saturated:ClearAllPoints()
			
			-- Modify the completed/failed text
			
			completeorfailglow=select(1,GarrisonShipyardFrame.MissionComplete.ChanceFrame:GetRegions())
			completeorfailglow:Hide()
			completeorfailglow2=select(3,GarrisonShipyardFrame.MissionComplete.ChanceFrame:GetRegions())
			completeorfailglow2:Hide()
			completeorfail=select(5,GarrisonShipyardFrame.MissionComplete.ChanceFrame:GetRegions())
			completeorfail:SetFont(unpack(miirgui.huge))
			
			m_border(GarrisonShipyardFrame.MissionComplete,558,289,"Center",0,148,14,"HIGH")
			m_border(GarrisonShipyardFrame.MissionComplete,558,590,"Center",0,-2,14,"HIGH")
			
			--Change the rewards-font

			rewards=select(11,GarrisonShipyardFrame.MissionComplete.BonusRewards:GetRegions())
			rewards:SetFont(unpack(miirgui.huge))
			rewards:SetShadowColor(0,0,0,0)
			rewards:SetTextColor(1,1,1,1)
			
			--Landing Page Fleet Tab
			
			xpleft=select(2,GarrisonLandingPage.ShipFollowerTab.XPBar:GetRegions())
			xpleft:Hide()
			xpright=select(3,GarrisonLandingPage.ShipFollowerTab.XPBar:GetRegions())
			xpright:Hide()
			xpmiddle=select(4,GarrisonLandingPage.ShipFollowerTab.XPBar:GetRegions())
			xpmiddle:Hide()
			xptext=select(6,GarrisonLandingPage.ShipFollowerTab.XPBar:GetRegions())
			xptext:SetTextColor(1, 1, 1,1)
			xptext:SetFont(unpack(miirgui.small))
			xptext:SetShadowColor(0,0,0,0)
			
			GarrisonLandingPage.ShipFollowerTab.NumFollowers:SetTextColor(1, 1, 1,1)
			GarrisonLandingPage.ShipFollowerTab.NumFollowers:SetFont(unpack(miirgui.huge))
			GarrisonLandingPage.ShipFollowerTab.NumFollowers:SetShadowColor(0,0,0,0)
			GarrisonLandingPage.ShipFollowerTab.Quality:Hide()
			GarrisonLandingPage.ShipFollowerTab.Trait1.Border:Hide()
			GarrisonLandingPage.ShipFollowerTab.Trait2.Border:Hide()
			GarrisonLandingPage.ShipFollowerTab.EquipmentFrame.Equipment1.Border:Hide()
			GarrisonLandingPage.ShipFollowerTab.EquipmentFrame.Equipment2.Border:Hide()
			
			for i = 1,4 do
				hideit=select(i,GarrisonLandingPage.ShipFollowerList:GetRegions()) 
				hideit:Hide()
			end	
			
			m_border(GarrisonLandingPage.ShipFollowerTab.XPBar,374,16,"Center",0,0,12,"MEDIUM")				
			m_border(GarrisonLandingPage.ShipFollowerTab.EquipmentFrame.Equipment1,52,52,"Center",0,0,14,"MEDIUM")
			m_border(GarrisonLandingPage.ShipFollowerTab.EquipmentFrame.Equipment2,52,52,"Center",0,0,14,"MEDIUM")		
			m_border(GarrisonLandingPage.ShipFollowerTab.Trait1,52,52,"Center",0,0,14,"MEDIUM")	
			m_border(GarrisonLandingPage.ShipFollowerTab.Trait2,52,52,"Center",0,0,14,"MEDIUM")	

			local function miirgui_Ship_Expand(self,button, followerListFrame)
					local bility = #button.info.abilities
						if bility == 1 then
							button.AbilitiesBG:SetTexture("Interface\\Garrison\\bility1.blp")
							button.AbilitiesBG:SetWidth(256)
							button.AbilitiesBG:SetHeight(64)
						elseif bility == 2 then
							button.AbilitiesBG:SetTexture("Interface\\Garrison\\bility2.blp")
							button.AbilitiesBG:SetWidth(256)
							button.AbilitiesBG:SetHeight(64)
						elseif bility == 3 then
							button.AbilitiesBG:SetTexture("Interface\\Garrison\\bility3.blp")
							button.AbilitiesBG:SetWidth(256)
							button.AbilitiesBG:SetHeight(128)
						elseif bility == 4 then
							button.AbilitiesBG:SetTexture("Interface\\Garrison\\bility4.blp")
							button.AbilitiesBG:SetWidth(256)
							button.AbilitiesBG:SetHeight(128)
						elseif bility == 5 then
							button.AbilitiesBG:SetTexture("Interface\\Garrison\\bility5.blp")
							button.AbilitiesBG:SetWidth(256)
							button.AbilitiesBG:SetHeight(128)
						end	
					end
				
			hooksecurefunc(GarrisonShipyardFrameFollowers,"ExpandButton",miirgui_Ship_Expand)
			
			local function miirgui_GarrisonShipyardMapMission_SetTooltip(info, inProgress)
				local tooltipFrame = GarrisonShipyardMapMissionTooltip;
					if (inProgress) then
					else
						local timeString = NORMAL_FONT_COLOR_CODE .. TIME_LABEL .. FONT_COLOR_CODE_CLOSE .. " ";
						timeString = timeString .. HIGHLIGHT_FONT_COLOR_CODE .. info.duration .. FONT_COLOR_CODE_CLOSE;
						if not (info.isRare) then
							GarrisonShipyardMapMission_AnchorToBottomWidget(tooltipFrame.MissionExpires, 0, -tooltipFrame.MissionExpires.yspacing);
							tooltipFrame.MissionExpires:Show();
							tooltipFrame.TimeRemaining:SetText(info.offerTimeRemaining);
							tooltipFrame.TimeRemaining:Show();
							GarrisonShipyardMapMission_SetBottomWidget(tooltipFrame.TimeRemaining);
						end
					end
				GarrisonShipyardMapMission_UpdateTooltipSize(tooltipFrame);
				tooltipFrame:Show();
			end
			
			hooksecurefunc("GarrisonShipyardMapMission_SetTooltip",miirgui_GarrisonShipyardMapMission_SetTooltip)
			
			end	
		end
		
		frame:SetScript("OnEvent", frame.OnEvent);
