		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		function frame:OnEvent(event, arg1)
			if event == "ADDON_LOADED" and arg1 == "Blizzard_GarrisonUI" then

				--[[		BuildingsFrame		]]--

				--Set Up Borders

				m_border(GarrisonBuildingFrame.BuildingList.MaterialFrame,280,26,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.TownHallBox,640,164,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.InfoBox,640,164,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.BuildingList,288,570,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.BuildingList.Tab1,90,22,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.BuildingList.Tab2,90,22,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.BuildingList.Tab3,90,22,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonBuildingFrame.InfoBox.AddFollowerButton,48,48,"Center",0,4,14,"MEDIUM")
				m_border(GarrisonBuildingFrameFollowers,270,560,"Center",-6,6,12,"HIGH")
				
				-- Buildinglist

				local function miirgui_GarrisonBuildingList_SelectTab(tab)
					local list = GarrisonBuildingFrame.BuildingList;
					GarrisonBuildingFrame.selectedTab = tab;
					local currButton, prevButton;
					for i=1, #tab.buildings do
						local building = tab.buildings[i];
						currButton = list.Buttons[i];
						if (building.needsPlan) then
							currButton.Name:SetVertexColor(1,1,1,1);
							currButton.Name:SetFont(unpack(miirgui.medium))
							currButton.Name:SetShadowColor(0,0,0,0)
							currButton.Name:ClearAllPoints()
							currButton.Name:SetPoint("LEFT",60,0)
							currButton.Plans:ClearAllPoints()
							currButton.Plans:SetPoint("RIGHT",-20,0)
							bg=select(1,currButton:GetRegions() )
							bg:SetTexture("Interface\\Garrison\\building.blp")
							bg:SetWidth(256)
							bg:SetHeight(64)
							bg:ClearAllPoints()
							bg:SetPoint("Left",22,1)
							bg:SetDesaturated(true)
							
							selected=select(2,currButton:GetRegions() )
							selected:SetTexture("Interface\\Garrison\\selected.blp")
							selected:SetWidth(256)
							selected:SetHeight(64)
							selected:ClearAllPoints()
							selected:SetPoint("Left",22,1)
							
							hover=select(6,currButton:GetRegions() )
							hover:SetTexture("Interface\\Garrison\\selected.blp")
							hover:SetWidth(256)
							hover:SetHeight(64)
							hover:ClearAllPoints()
							hover:SetPoint("Left",22,1)
						else
							currButton.Name:SetVertexColor(1,1,1,1);
							currButton.Name:SetFont(unpack(miirgui.medium))
							currButton.Name:SetShadowColor(0,0,0,0)
							currButton.Name:ClearAllPoints()
							currButton.Name:SetPoint("LEFT",60,0)
							
							bg=select(1,currButton:GetRegions() )
							bg:SetTexture("Interface\\Garrison\\building.blp")
							bg:SetWidth(256)
							bg:SetHeight(64)
							bg:ClearAllPoints()
							bg:SetPoint("Left",22,1)
							
							selected=select(2,currButton:GetRegions() )
							selected:SetTexture("Interface\\Garrison\\selected.blp")
							selected:SetWidth(256)
							selected:SetHeight(64)
							selected:ClearAllPoints()
							selected:SetPoint("Left",22,1)
							
							hover=select(6,currButton:GetRegions() )
							hover:SetTexture("Interface\\Garrison\\selected.blp")
							hover:SetWidth(256)
							hover:SetHeight(64)
							hover:ClearAllPoints()
							hover:SetPoint("Left",22,1)
						end
						currButton:Show();
						prevButton = list.Buttons[i];
					end
				end

				hooksecurefunc("GarrisonBuildingList_SelectTab",miirgui_GarrisonBuildingList_SelectTab)

				--BuildingTabs

				hideit=select(2,GarrisonBuildingFrame.BuildingList.Tab1:GetRegions())
				hideit:SetAlpha(0)
				hover=select(3,GarrisonBuildingFrame.BuildingList.Tab1:GetRegions())
				hover:ClearAllPoints()
				hover:SetPoint("CENTER")
				hover:SetHeight(20)
				hover:SetWidth(88)

				hideit=select(2,GarrisonBuildingFrame.BuildingList.Tab2:GetRegions() )
				hideit:SetAlpha(0)
				hover=select(3,GarrisonBuildingFrame.BuildingList.Tab2:GetRegions() )
				hover:ClearAllPoints()
				hover:SetPoint("CENTER")
				hover:SetHeight(20)
				hover:SetWidth(88)

				hideit=select(2,GarrisonBuildingFrame.BuildingList.Tab3:GetRegions() )
				hideit:SetAlpha(0)
				hover=select(3,GarrisonBuildingFrame.BuildingList.Tab3:GetRegions() )
				hover:ClearAllPoints()
				hover:SetPoint("CENTER")
				hover:SetHeight(20)
				hover:SetWidth(88)

				--Building Info Box

				bname=select(27,GarrisonBuildingFrame.InfoBox:GetRegions() )
				bname:SetVertexColor(unpack(miirgui.Color));
				bname:SetFont(unpack(miirgui.huge))
				bname:SetShadowColor(0,0,0,0)
				
				info=select(28,GarrisonBuildingFrame.InfoBox:GetRegions() )
				info:SetVertexColor(1,1,1,1);
				info:SetFont(unpack(miirgui.medium))
				info:SetShadowColor(0,0,0,0)

				costs=select(1,GarrisonBuildingFrame.InfoBox.UpgradeCostBar:GetRegions() )
				costs:SetVertexColor(1,1,1,1)
				costs:SetFont(unpack(miirgui.medium))
				costs:SetShadowColor(0,0,0,0)
				
				costs2=select(2,GarrisonBuildingFrame.InfoBox.UpgradeCostBar:GetRegions() )
				costs2:SetVertexColor(unpack(miirgui.Color))
				costs2:SetFont(unpack(miirgui.medium))
				costs2:SetShadowColor(0,0,0,0)

				costs3=select(3,GarrisonBuildingFrame.InfoBox.UpgradeCostBar:GetRegions() )
				costs3:SetVertexColor(1,1,1,1)
				costs3:SetFont(unpack(miirgui.medium))
				costs3:SetShadowColor(0,0,0,0)

				btime=select(4,GarrisonBuildingFrame.InfoBox.UpgradeCostBar:GetRegions() )
				btime:SetVertexColor(unpack(miirgui.Color))
				btime:SetFont(unpack(miirgui.medium))
				btime:SetShadowColor(0,0,0,0)

				btime=select(5,GarrisonBuildingFrame.InfoBox.UpgradeCostBar:GetRegions() )
				btime:SetVertexColor(1,1,1,1)
				btime:SetFont(unpack(miirgui.medium))
				btime:SetShadowColor(0,0,0,0)

				--Info Box Follower

				border=select(3,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				border:Hide() 
				
				portrait=select(2,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
				portrait:ClearAllPoints()
				portrait:SetPoint("CENTER",0,2)

				quality=select(1,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				quality:SetTexture("Interface\\Garrison\\qual.blp")
				quality:SetHeight(64)
				quality:SetWidth(64)
				quality:ClearAllPoints()
				quality:SetPoint("CENTER",0,-4)
				
				levelborder=select(4,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				levelborder:Hide()

				leveltext=select(5,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				leveltext:SetTextColor(1, 1, 1,1)
				leveltext:SetFont(unpack(miirgui.small))
				leveltext:SetShadowColor(0,0,0,0)
				
				fname=select(7,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				fname:SetVertexColor(unpack(miirgui.Color))
				fname:SetFont(unpack(miirgui.medium))
				fname:SetShadowColor(0,0,0,0)

				fname2=select(8,GarrisonBuildingFrame.InfoBox.FollowerPortrait:GetRegions())
				fname2:SetVertexColor(1,1,1,1)
				fname2:SetFont(unpack(miirgui.small))
				fname2:SetShadowColor(0,0,0,0)

				--Info Box Add Follower

				border=select(1,GarrisonBuildingFrame.InfoBox.AddFollowerButton:GetRegions())
				border:Hide()
				borderhover=select(3,GarrisonBuildingFrame.InfoBox.AddFollowerButton:GetRegions())
				borderhover:SetTexture("Interface\\Containerframe\\quality.blp") 
				--borderhover:SetVertexColor(unpack(miirgui.Color))
				borderhover:ClearAllPoints()
				borderhover:SetPoint("CENTER",0,4)
				borderhover:SetHeight(44)
				borderhover:SetWidth(44)

				asign=select(4,GarrisonBuildingFrame.InfoBox.AddFollowerButton:GetRegions())
				asign:SetTextColor(1, 1, 1,1)
				asign:SetFont(unpack(miirgui.medium))
				asign:SetShadowColor(0,0,0,0)

				--Assign a follower to a building

				for i=1,21 do 
					hideit=select(i,GarrisonBuildingFrameFollowers:GetRegions())
					hideit:SetAlpha(0)
				end

				GarrisonBuildingFrameFollowersListScrollFrameScrollBarBG:Hide()

				-- Hide parchements

				for i =12,18 do
					hideit=select(i,GarrisonBuildingFrame:GetRegions())
					hideit:Hide()
				end
				
				for i =1,21 do
					hideit=select(i,GarrisonBuildingFrame.BuildingList:GetRegions())
					hideit:Hide()
				end
				
				for i =1,25 do
					hideit=select(i,GarrisonBuildingFrame.TownHallBox:GetRegions())
					hideit:Hide()
				end
				
				for i =1,25 do
					hideit=select(i,GarrisonBuildingFrame.InfoBox:GetRegions())
					hideit:Hide()
				end

				--[[		WORK ORDER FRAME		]]--

				--Set Up Borders

				m_border(GarrisonCapacitiveDisplayFrame,332,342,"Center",0,-16,14,"MEDIUM")
				m_border(GarrisonCapacitiveDisplayFrame.CapacitiveDisplay,254,44,"Center",27,134,14,"HIGH")
				m_border(GarrisonCapacitiveDisplayFrame.CapacitiveDisplay,44,44,"TOPLEFT",10,-10,14,"HIGH")
				
				hideit=select(1,GarrisonCapacitiveDisplayFrame.CapacitiveDisplay:GetRegions() )
				hideit:Hide()

				GarrisonCapacitiveDisplayFramePortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
				GarrisonBuildingFrameTutorialButton:Hide()
				Background=select(10,GarrisonBuildingFrame:GetRegions()) 
				Background:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				Topbar=select(11,GarrisonBuildingFrame:GetRegions())
				Topbar:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")

					
				GarrisonCapacitiveDisplayFrame:HookScript("OnShow", function(self, button)		
					local display = self.CapacitiveDisplay;
					local reagents = display.Reagents;
					if reagents[2] == nil then
						local reagent = reagents[1]
						bg=select(2,reagent:GetRegions())
						bg:SetTexture("Interface\\AuctionFrame\\UI-AuctionItemNameFrame.blp")
						--m_border(reagent,40,40,"LEFT",-1,1,12,"HIGH")
						--m_border(reagent,180,40,"Center",56,1,12,"HIGH")					
					else
						for i = 1, 2 do
							local reagent = reagents[i];
							bg=select(2,reagent:GetRegions())
							bg:SetTexture("Interface\\AuctionFrame\\UI-AuctionItemNameFrame.blp")
							--m_border(reagent,40,40,"LEFT",-1,1,12,"HIGH")
							--m_border(reagent,180,40,"Center",56,1,12,"HIGH")
						end		
					end
				end)
				
				
				--[[RECRUITERFRAME]]--

				GarrisonRecruiterFramePortrait=select(22,GarrisonRecruiterFrame:GetRegions())
				GarrisonRecruiterFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
				GarrisonRecruiterFramePortrait:SetPoint("TOPLEFT",-6,7)
				
				--[[GARRISONRECRUITSELECTFRAME]]--

				--Set Up borders

				m_border(GarrisonRecruitSelectFrame.FollowerList,310,570,"Center",0,0,12,"MEDIUM")
				m_border(GarrisonRecruitSelectFrame.FollowerSelection.Recruit1,190,570,"Center",0,4,14,"MEDIUM")
				m_border(GarrisonRecruitSelectFrame.FollowerSelection.Recruit2,190,570,"Center",0,4,14,"MEDIUM")
				m_border(GarrisonRecruitSelectFrame.FollowerSelection.Recruit3,190,570,"Center",0,4,14,"MEDIUM")
				m_border(GarrisonRecruiterFrame,330,342,"Center",0,-16,14,"MEDIUM")
				
				--Hide parchement

				GarrisonRecruitSelectFrameListScrollFrameScrollBarBG:Hide()
				bg=select(18,GarrisonRecruiterFrame:GetRegions())
				bg:Hide()

				for i = 11,18 do 
					hideit=select(i,GarrisonRecruitSelectFrame:GetRegions()) 
					hideit:Hide()
				end

				-- Modify the possible recruits portraits

				hooksecurefunc("GarrisonRecruitSelectFrame_UpdateRecruits",function()
					local recruitFrame = GarrisonRecruitSelectFrame.FollowerSelection;

					local followers = C_Garrison.GetAvailableRecruits();
					for i=1, 3 do
						local follower = followers[i];
						local frame = recruitFrame["Recruit"..i];
						if(follower)then
							frame:Show();

							bla=select(1,frame.PortraitFrame:GetRegions())
							bla:Hide()
							
							portrait=select(2,frame.PortraitFrame:GetRegions())
							portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

							quality=select(3,frame.PortraitFrame:GetRegions())
							quality:SetTexture("Interface\\Garrison\\qual.blp")
							quality:SetHeight(64)
							quality:SetWidth(64)

							levelborder=select(4,frame.PortraitFrame:GetRegions())
							levelborder:Hide()

							levelborder=select(4,frame.PortraitFrame:GetRegions())
							levelborder:Hide()

							leveltext=select(5,frame.PortraitFrame:GetRegions())
							leveltext:SetTextColor(1, 1, 1,1)
							leveltext:SetFont(unpack(miirgui.small))
							leveltext:SetShadowColor(0,0,0,0)
						end
					end

				
				end)

				--Hide scroll list parchement

				for i=1,20 do 
					hideit=select(i,GarrisonRecruitSelectFrame.FollowerList:GetRegions())
					hideit:Hide()
				end

				--Hide Followerselection parchement

				for i=1,22 do 
					hideit=select(i,GarrisonRecruitSelectFrame.FollowerSelection:GetRegions())
					hideit:Hide()
				end

				--Set Up new background

				bg=select(10,GarrisonRecruitSelectFrame:GetRegions()) 
				bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")

				currencyborder2=select(1,GarrisonBuildingFrame.BuildingList.MaterialFrame:GetRegions())
				currencyborder2:Hide()
				
				--[[		MISSIONFRAME		]]--
				
				-- Applying border
				
				m_border(GarrisonMissionFrameMissionsListScrollFrame,900,570,"Center",0,-2	,14,"MEDIUM")
				m_border(GarrisonMissionFrameFollowers,310,570,"Center",0,-16,12,"MEDIUM")
				m_border(GarrisonMissionFrame.FollowerTab,580,570,"Center",0,0,12,"MEDIUM")
				m_border(GarrisonMissionFrameMissions.MaterialFrame,300,26,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonMissionFrameFollowers.MaterialFrame,300,26,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.MissionComplete,558,289,"Center",0,148,14,"HIGH")
				m_border(GarrisonMissionFrame.MissionComplete,558,590,"Center",0,-2,14,"HIGH")
				m_border(GarrisonMissionFrame.MissionTab.MissionPage.Stage,558,238,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonMissionFrameMissionsTab2,180,24,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonMissionFrameMissionsTab1,180,24,"Center",0,0,14,"MEDIUM")

				--[[		MISSIONLISTFRAME		]]--

				--Hides unwanted parchement in the mission frame

				Background=select(10,GarrisonMissionFrame:GetRegions())
				Background:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")

				GarrisonMissionFrameMissionsListScrollFrameScrollBarBG:Hide()
				GarrisonMissionFrameFollowersListScrollFrameScrollBarBG:Hide()

				for i = 11,18 do
					hideit=select(i,GarrisonMissionFrame:GetRegions())
					hideit:Hide()
				end

				--Hides unwanted textures in the mission scrollframe

				for i = 1,18 do
					hideit=select(i,GarrisonMissionFrameMissions:GetRegions()) 
					hideit:Hide()
				end

				--Hide the texture behind the available/completed tab

				for i = 1,6 do
					hideit=select(i,GarrisonMissionFrameMissionsTab1:GetRegions()) 
					hideit:SetAlpha(0)
				end

				for i = 1,6 do
					hideit=select(i,GarrisonMissionFrameMissionsTab2:GetRegions()) 
					hideit:SetAlpha(0)
				end

				--Change the TEXT of the available/completed tab

				available=select(7,GarrisonMissionFrameMissionsTab1:GetRegions())
				available:SetTextColor(1, 1, 1,1)
				available:SetFont(unpack(miirgui.huge))
				available:SetShadowColor(0,0,0,0)

				progress=select(7,GarrisonMissionFrameMissionsTab2:GetRegions())
				progress:SetTextColor(1, 1, 1,1)
				progress:SetFont(unpack(miirgui.huge))
				progress:SetShadowColor(0,0,0,0)

				-- Changes to the mission scrolllist-buttons

				for x=1,8 do
					border=select(1,_G["GarrisonMissionFrameMissionsListScrollFrameButton"..x]:GetRegions())
					border:SetTexture("Interface\\Garrison\\mission.blp")
					border:SetWidth(1024)
					border:SetHeight(128)
					border:ClearAllPoints()
					border:SetPoint("CENTER")

					for i = 2,12 do
						hideit=select(i,_G["GarrisonMissionFrameMissionsListScrollFrameButton"..x]:GetRegions())
						hideit:Hide()
					end

					for i = 21,26 do
						hideit=select(i,_G["GarrisonMissionFrameMissionsListScrollFrameButton"..x]:GetRegions())
						hideit:Hide()
					end

					level=select(16,_G["GarrisonMissionFrameMissionsListScrollFrameButton"..x]:GetRegions())
					level:SetTextColor(1, 1, 1,1)
					level:SetFont(unpack(miirgui.superhuge))
					level:SetShadowColor(0,0,0,0)
					name=select(19,_G["GarrisonMissionFrameMissionsListScrollFrameButton"..x]:GetRegions())
					name:SetTextColor(1, 1, 1,1)
					name:SetFont(unpack(miirgui.superhuge))
					name:SetShadowColor(0,0,0,0)
					gtime=select(20,_G["GarrisonMissionFrameMissionsListScrollFrameButton"..x]:GetRegions())
					gtime:SetTextColor(1, 1, 1,1)
					gtime:SetFont(unpack(miirgui.huge))
					gtime:SetShadowColor(0,0,0,0)
				end

				-- Hide the blue rare overlay

				local function miirgui_GarrisonMissionList_Update()
					local self = GarrisonMissionFrame.MissionTab.MissionList;
					local scrollFrame = self.listScroll;
					local buttons = scrollFrame.buttons;
					local numButtons = #buttons;
					for i = 1, numButtons do
						local button = buttons[i];
						button.RareOverlay:SetAlpha(0);
					end
				end

				miirgui_GarrisonMissionList_Update()

				-- Hide the garrison ressources background

				currencyborder=select(1,GarrisonMissionFrameMissions.MaterialFrame:GetRegions())
				currencyborder:Hide()

				currencyborder2=select(1,GarrisonMissionFrameFollowers.MaterialFrame:GetRegions())
				currencyborder2:Hide()

				-- Modifies the mission complete popup

				missionc = CreateFrame("Frame","test",nil)
				missionc:SetFrameStrata("HIGH")
				missionc:SetHeight(60)
				missionc:SetWidth(260)
				missionc:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				insets = { left = 4, right = 4, top = 4, bottom = 4},
				edgeSize = 14})
				missionc:SetBackdropColor(1, 1, 1, 1)
				missionc:SetBackdropBorderColor(1, 1, 1,1)
				missionc.text = missionc:CreateFontString(nil, "HIGH", "GameFontNormal")

				
				
				local function miirgui_CheckCompleteMissions(self,onShow)
					--local self = GarrisonMissionFrame;
					self.MissionComplete.completeMissions = C_Garrison.GetCompleteMissions();
					if ( #self.MissionComplete.completeMissions > 0 ) then
						missionc:SetParent(self.MissionTab.MissionList.CompleteDialog)
						missionc.text:SetFormattedText(GARRISON_NUM_COMPLETED_MISSIONS, #self.MissionComplete.completeMissions)
						missionc.text:SetTextColor(unpack(miirgui.Color))
						missionc.text:SetFont(unpack(miirgui.huge))
						missionc.text:SetShadowColor(0,0,0,0)
						missionc.text:SetPoint("CENTER",0,14)
						missionc:SetPoint("CENTER", 0, 0)
						self.MissionTab.MissionList.CompleteDialog.BorderFrame.Model:Hide()
						self.MissionTab.MissionList.CompleteDialog.BorderFrame.Stage:Hide()

						for i=1,13 do
							bla=select(i,self.MissionTab.MissionList.CompleteDialog.BorderFrame:GetRegions())
							bla:Hide()
						end
						GarrisonMissionFrameMissions.CompleteDialog.BorderFrame.ViewButton:ClearAllPoints()
						GarrisonMissionFrameMissions.CompleteDialog.BorderFrame.ViewButton:SetPoint("CENTER",0,-10)
						GarrisonShipyardFrame.MissionTab.MissionList.CompleteDialog.BorderFrame.ViewButton:ClearAllPoints()
						GarrisonShipyardFrame.MissionTab.MissionList.CompleteDialog.BorderFrame.ViewButton:SetPoint("CENTER",0,-10)
					end

				end
				
				hooksecurefunc(GarrisonMission,"CheckCompleteMissions",miirgui_CheckCompleteMissions)
				

				--[[		MISSIONDETAILSFRAME		]]--

				-- Hide unwanted textures in the Mission Details Frame

				for i=1,12 do
					hideit=select(i,GarrisonMissionFrame.MissionTab.MissionPage:GetRegions())
					hideit:Hide()
				end

				for i=13,16 do
					hideit=select(i,GarrisonMissionFrame.MissionTab.MissionPage:GetRegions())
					hideit:Hide()
				end
				
				for i=18,20 do
					hideit=select(i,GarrisonMissionFrame.MissionTab.MissionPage:GetRegions())
					hideit:Hide()
				end

				-- Hide the party buff bg and changed font
				
				buffbg=select(1,GarrisonMissionFrame.MissionTab.MissionPage.BuffsFrame:GetRegions())
				buffbg:SetAlpha(0)
				bufftext=select(2,GarrisonMissionFrame.MissionTab.MissionPage.BuffsFrame:GetRegions())
				bufftext:SetTextColor(1, 1, 1,1)
				bufftext:SetFont(unpack(miirgui.medium))
				bufftext:SetShadowColor(0,0,0,0)

				-- Changed the drag followers here TEXT

				GarrisonMissionFrame.MissionTab.MissionPage.EmptyString:SetTextColor(1, 1, 1,1)
				GarrisonMissionFrame.MissionTab.MissionPage.EmptyString:SetFont(unpack(miirgui.huge))
				GarrisonMissionFrame.MissionTab.MissionPage.EmptyString:SetShadowColor(0,0,0,0)

				--Modify Mission Stages TEXT's

				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Level:SetTextColor(1, 1, 1,1)
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Level:SetFont(unpack(miirgui.superhuge))
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Level:SetShadowColor(0,0,0,0)
				
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.ItemLevel:SetTextColor(1, 1, 1,1)
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.ItemLevel:SetFont(unpack(miirgui.medium))
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.ItemLevel:SetShadowColor(0,0,0,0)

				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Location:SetTextColor(1, 1, 1,1)
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Location:SetFont(unpack(miirgui.medium))
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Location:SetShadowColor(0,0,0,0)
				
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Title:SetTextColor(1, 1, 1,1)
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Title:SetFont(unpack(miirgui.superhuge))
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.Title:SetShadowColor(0,0,0,0)
				
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.MissionDescription:SetTextColor(1, 1, 1,1)
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.MissionDescription:SetFont(unpack(miirgui.medium))
				GarrisonMissionFrame.MissionTab.MissionPage.Stage.MissionDescription:SetShadowColor(0,0,0,0)

				-- Skin open Follower Slots

				local function miirgui_SetPartySize(self,frame,size, numEnemies)
					MISSION_PAGE_FRAME = GarrisonMissionFrame.MissionTab.MissionPage;
					for i = 1, #MISSION_PAGE_FRAME.Followers do
						if ( i <= size ) then
							MISSION_PAGE_FRAME.Followers[i]:Show();
							
							border=select(1,GarrisonMissionFrame.MissionTab.MissionPage.Follower1:GetRegions())
							border:SetAlpha(0)
							class=select(2,GarrisonMissionFrame.MissionTab.MissionPage.Follower1:GetRegions())
							class:SetAlpha(0)
							border=select(1,GarrisonMissionFrame.MissionTab.MissionPage.Follower2:GetRegions())
							border:SetAlpha(0)
							class=select(2,GarrisonMissionFrame.MissionTab.MissionPage.Follower2:GetRegions())
							class:SetAlpha(0)
							border=select(1,GarrisonMissionFrame.MissionTab.MissionPage.Follower3:GetRegions())
							border:SetAlpha(0)
							class=select(2,GarrisonMissionFrame.MissionTab.MissionPage.Follower3:GetRegions())
							class:SetAlpha(0)
							
							
							portraitframe=select(1,MISSION_PAGE_FRAME.Followers[i]:GetChildren())
							border=select(1,portraitframe:GetRegions())
							border:Hide()
							portrait=select(2,portraitframe:GetRegions())
							portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
							
							quality=select(3,portraitframe:GetRegions())
							quality:SetTexture("Interface\\Garrison\\qual.blp")
							quality:SetHeight(64)
							quality:SetWidth(64)
							
							levelborder=select(4,portraitframe:GetRegions())
							levelborder:Hide()
							
							leveltext=select(5,portraitframe:GetRegions())
							leveltext:SetTextColor(1, 1, 1,1)
							leveltext:SetFont(unpack(miirgui.small))
							leveltext:SetShadowColor(0,0,0,0)
							
							glow=select(7,portraitframe:GetRegions())
							glow:SetTexture("Interface\\Garrison\\quality.blp")
							glow:SetHeight(128)
							glow:SetWidth(128)
							glow=select(8,portraitframe:GetRegions())
							glow:Hide()

						end
					end
				end	
				
				hooksecurefunc(GarrisonMission,"SetPartySize",miirgui_SetPartySize)
		
				-- Hide unwanted rewardframe textures

				for i=1,10 do
					hideit=select(i,GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame:GetRegions())
					hideit:Hide()
				end

				hideit=select(1,GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward1:GetRegions())
				hideit:Hide()
				hideit=select(1,GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward2:GetRegions())
				hideit:Hide()

				--Change the rewards-font

				rewards=select(12,GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame:GetRegions())
				rewards:SetFont(unpack(miirgui.huge))
				rewards:SetShadowColor(0,0,0,0)

				reward=select(4,GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward1:GetRegions())
				reward:SetFont(unpack(miirgui.medium))
				reward:SetShadowColor(0,0,0,0)

				--Add borders to the reward frame

				m_border(GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward1,100,46,"Center",20,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward1,46,46,"LEFT",-1,0,14,"MEDIUM")

				m_border(GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward2,100,46,"Center",20,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.MissionTab.MissionPage.RewardsFrame.Reward2,46,46,"LEFT",-1,0,14,"MEDIUM")

				--[[		FOLLOWERLISTFRAME		]]--

				--Hide unnecessary parchements

				for i = 1,20 do
					hideit=select(i,GarrisonMissionFrameFollowers:GetRegions()) 
					hideit:Hide()
				end

				-- Changes the follower list template

				function miirgui_UpdateData(self)
				local followerFrame = self:GetParent();
				local followers = self.followers;
				local followersList = self.followersList;
				local numFollowers = #followersList;
				local scrollFrame = self.listScroll;
				local offset = HybridScrollFrame_GetOffset(scrollFrame);
				local buttons = scrollFrame.buttons;
				local numButtons = #buttons;
				local showCounters = self.showCounters;
				local canExpand = self.canExpand;
				local mentorLevel = GarrisonMissionFrame and GarrisonMissionFrame.MissionTab.MissionPage.mentorLevel or 0;
				local mentorItemLevel = GarrisonMissionFrame and GarrisonMissionFrame.MissionTab.MissionPage.mentorItemLevel or 0;
								
				for i = 1, numButtons do
					local button = buttons[i];
					local index = offset + i; -- adjust index
					if ( index <= numFollowers ) then
						local follower = followers[followersList[index]];
							button.id = follower.followerID;
							button.info = follower;
							button.Class:Hide()
							if follower.classAtlas == "GarrMission_ClassIcon-Mage" then
								classcolor = {0.41,0.80,0.94,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Warrior" then
								classcolor = {0.78,0.61,0.43,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Rogue" then
								classcolor = {1.00,0.96,0.41,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Druid" then
								classcolor = {1.00,0.49,0.04,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Priest" then
								classcolor = {1,1,1,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Paladin" then
								classcolor = {0.96,0.55,0.73,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Hunter" then
								classcolor = {0.67,0.83,0.45,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Warlock" then
								classcolor = {0.58,0.51,0.79 ,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Monk" then
								classcolor = {0.33,0.54,0.52,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-Shaman" then
								classcolor = {0.0,0.44,0.87,1}
							elseif follower.classAtlas == "GarrMission_ClassIcon-DeathKnight" then
								classcolor = {0.77,0.12,0.23,1}
							end

							button.Name:SetText(follower.name);
							button.Name:SetTextColor(unpack(classcolor))
							button.Name:SetFont(unpack(miirgui.small))
							button.Name:SetShadowColor(0,0,0,0)

							local color = ITEM_QUALITY_COLORS[follower.quality];
							button.PortraitFrame.LevelBorder:Hide()
							button.PortraitFrame.Level:SetText(follower.level);
							button.PortraitFrame.Level:SetTextColor(1, 1, 1,1)
							button.PortraitFrame.Level:SetFont(unpack(miirgui.small))
							button.PortraitFrame.Level:SetShadowColor(0,0,0,0)
							if ( follower.isCollected ) then
								-- have this follower
								button.isCollected = true;
								mover=select(9,button:GetRegions())
								mover:SetTexture("Interface\\Garrison\\followerhover.blp")
								mover:SetVertexColor(unpack(miirgui.Color))
								mover:SetAlpha(0.2)
								mover:ClearAllPoints()
								mover:SetPoint("CENTER",button.PortraitFrame,130,0)
								mover:SetWidth(256)
								mover:SetHeight(64)

								selected=select(8,button:GetRegions())
								selected:SetVertexColor(unpack(miirgui.Color))
								selected:SetTexture("Interface\\Garrison\\followerhover.blp")
								selected:SetAlpha(0.2)
								selected:SetHeight(64)
								selected:SetWidth(256)
								selected:ClearAllPoints()
								selected:SetPoint("CENTER",button.PortraitFrame,130,0)

								border=select(1,button:GetRegions())
								border:SetTexture("Interface\\Garrison\\follower.blp")
								border:ClearAllPoints()
								border:SetPoint("CENTER",button.PortraitFrame,130,0)
								border:SetWidth(256)
								border:SetHeight(64)
								border:SetDesaturated(false)

								levelborder=select(1,button.PortraitFrame:GetRegions())
								levelborder:SetAlpha(0)
								
								button.PortraitFrame.Level:Show()
								button.PortraitFrame.PortraitRingCover:Hide();
								button.PortraitFrame.Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
								button.PortraitFrame.PortraitRingQuality:Show();
								button.PortraitFrame.PortraitRingQuality:SetTexture("Interface\\Garrison\\qual.blp")
								button.PortraitFrame.PortraitRingQuality:SetHeight(64)
								button.PortraitFrame.PortraitRingQuality:SetWidth(64)
								button.PortraitFrame.PortraitRingQuality:SetVertexColor(color.r, color.g, color.b);
								button.PortraitFrame.Portrait:SetDesaturated(false);

								if ( follower.status == GARRISON_FOLLOWER_INACTIVE ) then
									button.PortraitFrame.PortraitRingCover:Hide();
									border:SetDesaturated(true)
									buzzy=select(1,button.BusyFrame:GetRegions())
									buzzy:SetTexture("Interface\\Garrison\\followerhover.blp")
									buzzy:SetAlpha(0.5)
									buzzy:ClearAllPoints()
									buzzy:SetPoint("CENTER",button.PortraitFrame,131,1)
									buzzy:SetWidth(256)
									buzzy:SetHeight(64)
									button.BusyFrame.Texture:SetVertexColor(unpack(GARRISON_FOLLOWER_INACTIVE_COLOR));								
								elseif ( follower.status ) then
									button.PortraitFrame.PortraitRingCover:Hide();
									border:SetDesaturated(true)
									buzzy=select(1,button.BusyFrame:GetRegions())
									buzzy:SetTexture("Interface\\Garrison\\followerhover.blp")
									buzzy:SetAlpha(0.5)
									buzzy:ClearAllPoints()
									buzzy:SetPoint("CENTER",button.PortraitFrame,131,1)
									buzzy:SetWidth(256)
									buzzy:SetHeight(64)
									button.BusyFrame.Texture:SetVertexColor(unpack(GARRISON_FOLLOWER_INACTIVE_COLOR));
								else
									button.PortraitFrame.PortraitRingCover:Hide();
									button.BusyFrame:Hide();
								end
								if ( canExpand ) then
									button.DownArrow:SetAlpha(0);
								else
									button.DownArrow:SetAlpha(0);
								end

								if (follower.level == GARRISON_FOLLOWER_MAX_LEVEL) then
									button.ILevel:SetText(ITEM_LEVEL_ABBR.." "..follower.iLevel);
									button.ILevel:SetFont(unpack(miirgui.small))
									button.ILevel:SetShadowColor(0,0,0,0)
									button.Status:SetPoint("TOPLEFT", button.ILevel, "TOPRIGHT", 4, 0);
								else
				
								end
								if (follower.xp == 0 or follower.levelXP == 0) then 
									button.XPBar:Hide();
								else
									button.XPBar:Show();
									button.XPBar:SetWidth((follower.xp/follower.levelXP) * GARRISON_FOLLOWER_LIST_BUTTON_FULL_XP_WIDTH);
									button.XPBar:ClearAllPoints()
									button.XPBar:SetPoint("Left",button.PortraitFrame,58,-22)
								end
							else

								-- don't have this follower

								mover=select(9,button:GetRegions())
								mover:SetTexture("Interface\\Garrison\\followerhover.blp")
								mover:SetAlpha(0.2)
								mover:ClearAllPoints()
								mover:SetPoint("CENTER",button.PortraitFrame,130,0)
								mover:SetWidth(256)
								mover:SetHeight(64)

								selected=select(8,button:GetRegions())
								selected:SetAlpha(0.2)
								selected:SetTexture("Interface\\Garrison\\followerhover.blp")
								selected:SetHeight(64)
								selected:SetWidth(256)
								selected:ClearAllPoints()
								selected:SetPoint("CENTER",button.PortraitFrame,130,0)

								button.Name:SetTextColor(1,1,1,1);
								button.Name:SetFont(unpack(miirgui.small))
								button.Name:SetShadowColor(0,0,0,0)

								border=select(1,button:GetRegions())
								border:SetTexture("Interface\\Garrison\\follower.blp")
								border:ClearAllPoints()
								border:SetPoint("CENTER",button.PortraitFrame,130,0)
								border:SetWidth(256)
								border:SetHeight(64)
								border:SetDesaturated(true)
				
								levelborder=select(1,button.PortraitFrame:GetRegions())
								levelborder:SetAlpha(0)

								button.PortraitFrame.Level:Hide()

								button.PortraitFrame.Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
								button.PortraitFrame.Portrait:SetDesaturated(true);
								
								button.PortraitFrame.PortraitRingQuality:Show();
								button.PortraitFrame.PortraitRingQuality:SetTexture("Interface\\Garrison\\qual.blp")
								button.PortraitFrame.PortraitRingQuality:SetHeight(64)
								button.PortraitFrame.PortraitRingQuality:SetWidth(64)
								button.PortraitFrame.PortraitRingQuality:SetVertexColor(0,0,0,1);
								
								button.PortraitFrame.PortraitRingCover:Hide()
								button.BusyFrame:Hide();
							end
						end
					end
				end

				hooksecurefunc(GarrisonMissionFrameFollowers,"UpdateData",miirgui_UpdateData)
				
				hooksecurefunc(GarrisonLandingPage.FollowerList,"UpdateData",miirgui_UpdateData)
				
				hooksecurefunc(GarrisonRecruitSelectFrame.FollowerList,"UpdateData",miirgui_UpdateData)

				hooksecurefunc(GarrisonBuildingFrameFollowers,"UpdateData",miirgui_UpdateData)

				--Modify  the expand bg when expanding a follower's skills

				local function miirgui_Expand(self,button, followerListFrame)
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
							button.AbilitiesBG:SetHeight(64)
						elseif bility == 5 then
							button.AbilitiesBG:SetTexture("Interface\\Garrison\\bility5.blp")
							button.AbilitiesBG:SetWidth(256)
							button.AbilitiesBG:SetHeight(128)
						end
						
						button.UpArrow:ClearAllPoints()
						button.UpArrow:SetPoint("TOPRIGHT",-10,-46)
					end

				hooksecurefunc(GarrisonMissionFrameFollowers,"ExpandButton",miirgui_Expand)
				hooksecurefunc(GarrisonRecruitSelectFrame.FollowerList,"ExpandButton",miirgui_Expand)

				--[[		FOLLOWERDETAILSFRAME		]]--

				--Change the active follower numbers color

				followernumber=select(20,GarrisonMissionFrame.FollowerTab:GetRegions()) 
				followernumber:SetTextColor(1, 1, 1,1)
				followernumber:SetFont(unpack(miirgui.huge))
				followernumber:SetShadowColor(0,0,0,0)

				--Hides unwanted textures in the Follower details frame

				for i = 1,19 do
					hideit=select(i,GarrisonMissionFrame.FollowerTab:GetRegions()) 
					hideit:Hide()
				end

				--Change the loayout of the Followerstab

				border=select(1,GarrisonMissionFrame.FollowerTab.PortraitFrame:GetRegions())
				border:Hide() 
				portrait=select(2,GarrisonMissionFrame.FollowerTab.PortraitFrame:GetRegions())
				portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

				quality=select(3,GarrisonMissionFrame.FollowerTab.PortraitFrame:GetRegions())
				quality:SetTexture("Interface\\Garrison\\qual.blp")
				quality:SetHeight(64)
				quality:SetWidth(64)

				levelborder=select(4,GarrisonMissionFrame.FollowerTab.PortraitFrame:GetRegions())
				levelborder:Hide()

				leveltext=select(5,GarrisonMissionFrame.FollowerTab.PortraitFrame:GetRegions())
				leveltext:SetTextColor(1, 1, 1,1)
				leveltext:SetFont(unpack(miirgui.small))
				leveltext:SetShadowColor(0,0,0,0)

				xpleft=select(2,GarrisonMissionFrame.FollowerTab.XPBar:GetRegions())
				xpleft:Hide()
				xpright=select(3,GarrisonMissionFrame.FollowerTab.XPBar:GetRegions())
				xpright:Hide()
				xpmiddle=select(4,GarrisonMissionFrame.FollowerTab.XPBar:GetRegions())
				xpmiddle:Hide()

				xptext=select(6,GarrisonMissionFrame.FollowerTab.XPBar:GetRegions())
				xptext:SetTextColor(1, 1, 1,1)
				xptext:SetFont(unpack(miirgui.small))
				xptext:SetShadowColor(0,0,0,0)

				weapon=select(2,GarrisonMissionFrame.FollowerTab.ItemWeapon:GetRegions())
				weapon:Hide()

				armor=select(2,GarrisonMissionFrame.FollowerTab.ItemArmor:GetRegions())
				armor:Hide()

				-- Adds borders to the follower's armor and weapon frame as well as xp bar

				m_border(GarrisonMissionFrame.FollowerTab.ItemArmor,140,44,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.FollowerTab.ItemArmor,44,44,"LEFT",-1,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.FollowerTab.ItemWeapon,140,44,"Center",0,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.FollowerTab.ItemWeapon,44,44,"LEFT",-1,0,14,"MEDIUM")
				m_border(GarrisonMissionFrame.FollowerTab.XPBar,504,16,"Center",0,0,12,"MEDIUM")

				--[[		MISSIONSCOMPLETEFRAME		]]--

				--Set up the background

				bg=select(1,GarrisonMissionFrame.MissionComplete:GetRegions())
				bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")

				-- Hide the golden glow animation at the Reward-frame

				GarrisonMissionFrame.MissionComplete.BonusRewards.Saturated:ClearAllPoints()
						
				local function miirgui_ShowRewards(self)	
					local bonusRewards = self.BonusRewards;
					self.NextMissionButton:Enable();
					if ( not bonusRewards.success and not self.skipAnimations ) then
						return;
					end

					local currentMission = self.currentMission;

					local numRewards = currentMission.numRewards;
					local index = 1;
					for id, reward in pairs(currentMission.rewards) do
						if (not bonusRewards.Rewards[index]) then
							bonusRewards.Rewards[index] = CreateFrame("Frame", nil, bonusRewards, "GarrisonMissionRewardEffectsTemplate");
							bonusRewards.Rewards[index]:SetPoint("RIGHT", bonusRewards.Rewards[index-1], "LEFT", -9, 0);
						end
						local Reward = bonusRewards.Rewards[index];
										Reward.BG:Hide();
										m_border(Reward,100,46,"Center",20,0,14,"HIGH")
										m_border(Reward,46,46,"Left",-1,0,14,"HIGH")
										index = index + 1;

					end
				end	


				hooksecurefunc(GarrisonMissionFrame.MissionComplete,"ShowRewards",miirgui_ShowRewards)
				
				hooksecurefunc(GarrisonShipyardFrame.MissionComplete,"ShowRewards",miirgui_ShowRewards)

				--Modifies next button's position
				
				GarrisonMissionFrame.MissionComplete.NextMissionButton:ClearAllPoints()
				GarrisonMissionFrame.MissionComplete.NextMissionButton:SetPoint("CENTER",0,-276)
				
				--Hide unneccessary parchement

				for i=2,12 do
					hideit=select(i,GarrisonMissionFrame.MissionComplete:GetRegions())
					hideit:Hide()
				end

				for i=11,13 do
					hideit=select(i,GarrisonMissionFrame.MissionComplete.Stage.MissionInfo:GetRegions())
					hideit:Hide()
				end

				for i =1,10 do
					hideit=select(i,GarrisonMissionFrame.MissionComplete.BonusRewards:GetRegions())
					hideit:SetAlpha(0)
				end

				for i=1,5 do
					hideit=select(i,GarrisonMissionFrame.MissionComplete.Stage.MissionInfo:GetRegions())
					hideit:Hide()
				end

				-- Modify the completed/failed TEXT

				completeorfailglow=select(1,GarrisonMissionFrame.MissionComplete.ChanceFrame:GetRegions())
				completeorfailglow:Hide()
				completeorfailglow2=select(3,GarrisonMissionFrame.MissionComplete.ChanceFrame:GetRegions())
				completeorfailglow2:Hide()
				completeorfail=select(5,GarrisonMissionFrame.MissionComplete.ChanceFrame:GetRegions())
				completeorfail:SetFont(unpack(miirgui.huge))

				--Modify the Missions Information TEXT'

				level=select(6,GarrisonMissionFrame.MissionComplete.Stage.MissionInfo:GetRegions())
				level:SetTextColor(1,1,1,1)
				level:SetFont(unpack(miirgui.superhuge))
				level:SetShadowColor(0,0,0,0)

				name=select(9,GarrisonMissionFrame.MissionComplete.Stage.MissionInfo:GetRegions())
				name:SetFont(unpack(miirgui.superhuge))
				name:SetShadowColor(0,0,0,0)
	
				region=select(10,GarrisonMissionFrame.MissionComplete.Stage.MissionInfo:GetRegions())
				region:SetFont(unpack(miirgui.huge))
				region:SetShadowColor(0,0,0,0)

				rewards=select(11,GarrisonMissionFrame.MissionComplete.BonusRewards:GetRegions())
				rewards:SetFont(unpack(miirgui.huge))
				rewards:SetShadowColor(0,0,0,0)
				rewards:SetTextColor(1,1,1,1)

				-- Modifies the Follower' protrait who contributes something to the mission

				local function GarrisonMissionComplete_Initialize(missionList, index)
					for i=1, 3 do
						local follower = GarrisonMissionFrame.MissionComplete.Stage.FollowersFrame.Followers[i];
						followerbg=select(1,follower:GetRegions())
						followerbg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
						followerbg:ClearAllPoints()
						followerbg:SetPoint("CENTER",24,4)
						followerbg:SetWidth(120)
						followerbg:SetHeight(47)
						
						classicon=select(2,follower:GetRegions())
						classicon:Hide()

						name=select(3,follower:GetRegions())
						name:SetTextColor(1,1,1,1)
						name:SetFont(unpack(miirgui.small))

						xpbar=select(2,follower:GetChildren())
						xpbar:ClearAllPoints()
						xpbar:SetPoint("CENTER",25,-10)
						xpbar:SetWidth(116)
						
						leftxp=select(2,xpbar:GetRegions())
						leftxp:Hide()

						midxp=select(3,xpbar:GetRegions())
						midxp:Hide()

						rightxp=select(4,xpbar:GetRegions())
						rightxp:Hide()

						followers=select(1,follower:GetChildren())

						background2=select(1,followers:GetRegions())
						background2:Hide()

						portrait=select(2,followers:GetRegions())
						portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

						mquality=select(3,followers:GetRegions())
						mquality:SetTexture("Interface\\Garrison\\qual.blp")
						mquality:SetHeight(64)
						mquality:SetWidth(64)

						levelborder=select(4,followers:GetRegions())
						levelborder:Hide()

						leveltext=select(5,followers:GetRegions())
						leveltext:SetTextColor(1, 1, 1,1)
						leveltext:SetFont(unpack(miirgui.small))
						leveltext:SetShadowColor(0,0,0,0)
					end	
					completeorfailglow=select(1,GarrisonMissionFrame.MissionComplete.ChanceFrame:GetRegions())
					completeorfailglow:Hide()
					completeorfailglow2=select(3,GarrisonMissionFrame.MissionComplete.ChanceFrame:GetRegions())
					completeorfailglow2:Hide()
					completeorfail=select(5,GarrisonMissionFrame.MissionComplete.ChanceFrame:GetRegions())
					completeorfail:SetFont(unpack(miirgui.huge))
				end

				hooksecurefunc(GarrisonMission,"MissionCompleteInitialize",GarrisonMissionComplete_Initialize)
				
				--Add borders to the mission complete followers frames

				m_border(GarrisonMissionFrame.MissionComplete.Stage.FollowersFrame.Follower2,124,49,"Center",24,4.5,12,"HIGH")
				m_border(GarrisonMissionFrame.MissionComplete.Stage.FollowersFrame.Follower3,124,49,"Center",24,4.5,12,"HIGH")
				m_border(GarrisonMissionFrame.MissionComplete.Stage.FollowersFrame.Follower1,124,49,"Center",24,4.5,12,"HIGH")

				--[[GARRISON REPORT FRAME]]
					
				local function miirgui_GarrisonLandingPageReport_GetShipments(self)
					local shipmentIndex = 1;
					local buildings = C_Garrison.GetBuildings();
					for i = 1, #buildings do
						local buildingID = buildings[i].buildingID;
						if ( buildingID) then
							local name, texture, shipmentCapacity, shipmentsReady, shipmentsTotal, creationTime, duration, timeleftString, itemName, itemIcon, itemQuality, itemID = C_Garrison.GetLandingPageShipmentInfo(buildingID);
							local shipment = self.Shipments[shipmentIndex];
							if ( not shipment ) then
								return;
							end
							if ( name and shipmentCapacity > 0 ) then

								shipment.Icon:SetDesaturated(false);
								shipment.Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)

								shipment.Name:SetTextColor(1,1,1,1)
								shipment.Name:SetFont(unpack(miirgui.medium))
								shipment.Name:SetShadowColor(0,0,0,0)
								
								shipment.Done:SetTexture("Interface\\Garrison\\GarrLanding-TradeskillTimerFill.blp")
								shipment.Done:SetVertexColor(1,1,0,1)
								shipment.Done:SetSize(64,64)
								
								shipment.Border:Show();
								shipment.Border:SetTexture("Interface\\Garrison\\shipborder.blp")
								shipment.Border:SetVertexColor(unpack(miirgui.Color))
								shipment.BG:Hide();
								
								if (shipmentsTotal) then
									
									shipment.Count:SetTextColor(1,1,1,1)
									shipment.Count:SetFont(unpack(miirgui.medium))
									shipment.Count:SetShadowColor(0,0,0,0)
									
									if ( shipmentsReady == shipmentsTotal ) then
										shipment.Done:Show();
									else
										shipment.Swipe:SetCooldownUNIX(creationTime, duration);
										shipment.Border:SetVertexColor(unpack(miirgui.Color))

									end
								end
								shipment:Show();
								shipmentIndex = shipmentIndex + 1;
							else
								shipment:Hide();
							end
						end
					end
				end
				
				hooksecurefunc("GarrisonLandingPageReport_GetShipments",miirgui_GarrisonLandingPageReport_GetShipments)				
				
				local function miirgui_GarrisonLandingPageReportList_Update()
					local items = GarrisonLandingPageReport.List.items or {};
					local numItems = #items;
					local scrollFrame = GarrisonLandingPageReport.List.listScroll;
					local offset = HybridScrollFrame_GetOffset(scrollFrame);
					local buttons = scrollFrame.buttons;
					local numButtons = #buttons;
					
					if (numItems == 0) then
						GarrisonLandingPageReport.List.EmptyMissionText:SetTextColor(1,1,1,1)
						GarrisonLandingPageReport.List.EmptyMissionText:SetFont(unpack(miirgui.huge))
						GarrisonLandingPageReport.List.EmptyMissionText:SetShadowColor(0,0,0,0)
					end
					
					for i = 1, numButtons do
						local button = buttons[i];
						local index = offset + i; -- adjust index
						local item = items[index];
						if ( item ) then
							button.id = index;
							local bgName;
							if (item.isBuilding) then
								button.Status:SetFont(unpack(miirgui.medium))
								button.Status:SetShadowColor(0,0,0,0)
							else
							button.Status:Hide()
							end
							button.TimeLeft:SetFont(unpack(miirgui.huge))
							button.TimeLeft:SetShadowColor(0,0,0,0)
							button.Title:SetTextColor(unpack(miirgui.Color))
							button.Title:SetFont(unpack(miirgui.huge))
							button.Title:SetShadowColor(0,0,0,0)
							if (item.isComplete) then
								button.MissionType:SetFont(unpack(miirgui.medium))
								button.MissionType:SetShadowColor(0,0,0,0)
								button.MissionType:SetTextColor(0, 1, 0.5, 1)
							else
								button.MissionType:SetFont(unpack(miirgui.medium))
								button.MissionType:SetShadowColor(0,0,0,0)
								button.MissionType:SetTextColor(1,1,1,1)
							end
						end
					end
				end
				
				hooksecurefunc("GarrisonLandingPageReportList_Update",miirgui_GarrisonLandingPageReportList_Update)
				
				local function miirgui_GarrisonLandingPageReportList_UpdateAvailable()
					local items = GarrisonLandingPageReport.List.AvailableItems or {};
					local numItems = #items;
					local scrollFrame = GarrisonLandingPageReport.List.listScroll;
					local offset = HybridScrollFrame_GetOffset(scrollFrame);
					local buttons = scrollFrame.buttons;
					local numButtons = #buttons;
					
					for i = 1, numButtons do
						local button = buttons[i];
						local index = offset + i; -- adjust index
						if ( index <= numItems ) then
							local item = items[index];
							button.id = index;

							button.Title:SetTextColor(unpack(miirgui.Color))
							button.Title:SetFont(unpack(miirgui.huge))
							button.Title:SetShadowColor(0,0,0,0)
							
							button.MissionType:SetFont(unpack(miirgui.medium))
							button.MissionType:SetShadowColor(0,0,0,0)
							button.MissionType:SetTextColor(1,1,1,1)
						end
					end
				end		
				
				hooksecurefunc("GarrisonLandingPageReportList_UpdateAvailable",miirgui_GarrisonLandingPageReportList_UpdateAvailable)	
					
				bg=select(1,GarrisonLandingPage:GetRegions())
				bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				bg:ClearAllPoints()
				bg:SetPoint("Left")
				bg:SetHeight(500)
				bg:SetWidth(830)
				
				--Messing with invasion alert icon
				
				newinvasion=select(2,GarrisonLandingPage.InvasionBadge:GetRegions())
				newinvasion:ClearAllPoints()
				newinvasion:SetTexture("Interface\\Garrison\\newinvasion.blp")
				newinvasion:SetHeight(32)
				newinvasion:SetWidth(32)
				newinvasion:ClearAllPoints()
				newinvasion:SetPoint("CENTER",0,-10)

				invasion=select(1,GarrisonLandingPage.InvasionBadge:GetRegions())
				invasion:ClearAllPoints()
				invasion:SetTexture("Interface\\Garrison\\invasion.blp")
				invasion:SetHeight(32)
				invasion:SetWidth(32)
				invasion:ClearAllPoints()
				invasion:SetPoint("CENTER",0,-10)			

				--Hide parchement

				for i=2,10 do 
					hideit=select(i,GarrisonLandingPage:GetRegions() )
					hideit:Hide()
				end

				anvil=select(2,GarrisonLandingPageReport:GetRegions() )
				anvil:SetDesaturated(true)
				
				--Add border
				
				m_border(GarrisonLandingPage,832,502,"Center",0,0,12,"MEDIUM")
				m_border(GarrisonLandingPageTab1,96,38,"Center",0,0,12,"MEDIUM")
				m_border(GarrisonLandingPageTab2,96,38,"Center",0,0,12,"MEDIUM")
				m_border(GarrisonLandingPageTab3,90,38,"Center",0,0,12,"MEDIUM")

				--Modify tabs

				selectedlefttab1=select(4,GarrisonLandingPageTab1:GetRegions())
				selectedlefttab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedlefttab1:ClearAllPoints()
				selectedlefttab1:SetPoint("LEFT")
				selectedlefttab1:SetHeight(32)

				selectedcentertab1=select(5,GarrisonLandingPageTab1:GetRegions())
				selectedcentertab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedcentertab1:ClearAllPoints()
				selectedcentertab1:SetPoint("Center")
				selectedcentertab1:SetHeight(32)

				selectedrighttab1=select(6,GarrisonLandingPageTab1:GetRegions())
				selectedrighttab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedrighttab1:ClearAllPoints()
				selectedrighttab1:SetPoint("RIGHT")
				selectedrighttab1:SetHeight(32)

				deselectedlefttab1=select(1,GarrisonLandingPageTab1:GetRegions())
				deselectedlefttab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedlefttab1:ClearAllPoints()
				deselectedlefttab1:SetPoint("LEFT")
				deselectedlefttab1:SetHeight(32)

				deselectedcentertab1=select(2,GarrisonLandingPageTab1:GetRegions())
				deselectedcentertab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedcentertab1:ClearAllPoints()
				deselectedcentertab1:SetPoint("Center")
				deselectedcentertab1:SetHeight(32)

				deselectedrighttab1=select(3,GarrisonLandingPageTab1:GetRegions())
				deselectedrighttab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedrighttab1:ClearAllPoints()
				deselectedrighttab1:SetPoint("RIGHT")
				deselectedrighttab1:SetHeight(32)

				selectedlefttab2=select(4,GarrisonLandingPageTab2:GetRegions())
				selectedlefttab2:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedlefttab2:ClearAllPoints()
				selectedlefttab2:SetPoint("LEFT",10,0)
				selectedlefttab2:SetHeight(32)

				selectedcentertab2=select(5,GarrisonLandingPageTab2:GetRegions())
				selectedcentertab2:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedcentertab2:ClearAllPoints()
				selectedcentertab2:SetPoint("Center")
				selectedcentertab2:SetHeight(32)

				selectedrighttab2=select(6,GarrisonLandingPageTab2:GetRegions())
				selectedrighttab2:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedrighttab2:ClearAllPoints()
				selectedrighttab2:SetPoint("RIGHT",-10,0)
				selectedrighttab2:SetHeight(32)

				deselectedlefttab2=select(1,GarrisonLandingPageTab2:GetRegions())
				deselectedlefttab2:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedlefttab2:ClearAllPoints()
				deselectedlefttab2:SetPoint("LEFT",10,0)
				deselectedlefttab2:SetHeight(32)

				deselectedcentertab1=select(2,GarrisonLandingPageTab2:GetRegions())
				deselectedcentertab1:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedcentertab1:ClearAllPoints()
				deselectedcentertab1:SetPoint("Center")
				deselectedcentertab1:SetHeight(32)

				deselectedrighttab2=select(3,GarrisonLandingPageTab2:GetRegions())
				deselectedrighttab2:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedrighttab2:ClearAllPoints()
				deselectedrighttab2:SetPoint("RIGHT",-10,0)
				deselectedrighttab2:SetHeight(32)
				
				selectedlefttab3=select(4,GarrisonLandingPageTab3:GetRegions())
				selectedlefttab3:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedlefttab3:ClearAllPoints()
				selectedlefttab3:SetPoint("LEFT")
				selectedlefttab3:SetHeight(32)

				selectedcentertab3=select(5,GarrisonLandingPageTab3:GetRegions())
				selectedcentertab3:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedcentertab3:ClearAllPoints()
				selectedcentertab3:SetPoint("Center")
				selectedcentertab3:SetHeight(32)

				selectedrighttab3=select(6,GarrisonLandingPageTab3:GetRegions())
				selectedrighttab3:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
				selectedrighttab3:ClearAllPoints()
				selectedrighttab3:SetPoint("RIGHT")
				selectedrighttab3:SetHeight(32)

				deselectedlefttab3=select(1,GarrisonLandingPageTab3:GetRegions())
				deselectedlefttab3:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedlefttab3:ClearAllPoints()
				deselectedlefttab3:SetPoint("LEFT")
				deselectedlefttab3:SetHeight(32)

				deselectedcentertab3=select(2,GarrisonLandingPageTab3:GetRegions())
				deselectedcentertab3:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedcentertab3:ClearAllPoints()
				deselectedcentertab3:SetPoint("Center")
				deselectedcentertab3:SetHeight(32)

				deselectedrighttab3=select(3,GarrisonLandingPageTab3:GetRegions())
				deselectedrighttab3:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
				deselectedrighttab3:ClearAllPoints()
				deselectedrighttab3:SetPoint("RIGHT")
				deselectedrighttab3:SetHeight(32)
				
				
				
				for i=7,9 do
					hover=select(i,GarrisonLandingPageTab1:GetRegions())
					hover:SetAlpha(0)
				end
				
				for i=7,9 do
					hover=select(i,GarrisonLandingPageTab2:GetRegions())
					hover:SetAlpha(0)
				end
				
				for i=7,9 do
					hover=select(i,GarrisonLandingPageTab3:GetRegions())
					hover:SetAlpha(0)
				end

				--progress and available buttons

				avail=select(1,GarrisonLandingPageReport.Available:GetRegions())
				avail:SetAlpha(0)

				inp=select(1,GarrisonLandingPageReport.InProgress:GetRegions())
				inp:SetAlpha(0)

				m_border(GarrisonLandingPageReport.InProgress,194,30,"Center",0,-4,12,"MEDIUM")
				m_border(GarrisonLandingPageReport.Available,194,30,"Center",0,-4,12,"MEDIUM")

				--Hide Report List BG

				bg=select(1,GarrisonLandingPageReportList:GetRegions())
				bg1=select(1,GarrisonLandingPageReportList:GetRegions())
				bg:Hide()
				bg1:Hide()
				GarrisonLandingPageReportListListScrollFrameScrollBarTrack:Hide()

				--Scroll Frame buttons

				for i=1,10 do
					bla=select(1,_G["GarrisonLandingPageReportListListScrollFrameButton"..i]:GetRegions())
					bla:Hide()
					m_border(_G["GarrisonLandingPageReportListListScrollFrameButton"..i],400,46,"Center",0,0,12,"MEDIUM")
				end	

				title= select(1,GarrisonLandingPageReport:GetRegions())
				title:SetTextColor(unpack(miirgui.Color))
				title:SetFont(unpack(miirgui.superhuge))
				title:SetShadowColor(0,0,0,0)

				--[[FOLLOWERTAB]]--

				for i=1,3 do
					hideit=select(i,GarrisonLandingPage.FollowerList:GetRegions())
					hideit:Hide()
				end

				for i = 1,19 do
					hideit=select(i,GarrisonMissionFrame.FollowerTab:GetRegions()) 
					hideit:Hide()
				end

				--Change the loayout of the Follower details tab

				border=select(1,GarrisonLandingPage.FollowerTab.PortraitFrame:GetRegions())
				border:Hide() 
				portrait=select(2,GarrisonLandingPage.FollowerTab.PortraitFrame:GetRegions())
				portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

				quality=select(3,GarrisonLandingPage.FollowerTab.PortraitFrame:GetRegions())
				quality:SetTexture("Interface\\Garrison\\qual.blp")
				quality:SetHeight(64)
				quality:SetWidth(64)

				levelborder=select(4,GarrisonLandingPage.FollowerTab.PortraitFrame:GetRegions())
				levelborder:Hide()
				leveltext=select(5,GarrisonLandingPage.FollowerTab.PortraitFrame:GetRegions())
				leveltext:SetTextColor(1, 1, 1,1)
				leveltext:SetFont(unpack(miirgui.small))
				leveltext:SetShadowColor(0,0,0,0)

				xpleft=select(2,GarrisonLandingPage.FollowerTab.XPBar:GetRegions())
				xpleft:Hide()
				xpright=select(3,GarrisonLandingPage.FollowerTab.XPBar:GetRegions())
				xpright:Hide()
				xpmiddle=select(4,GarrisonLandingPage.FollowerTab.XPBar:GetRegions())
				xpmiddle:Hide()

				xptext=select(6,GarrisonLandingPage.FollowerTab.XPBar:GetRegions())
				xptext:SetTextColor(1, 1, 1,1)
				xptext:SetFont(unpack(miirgui.small))
				xptext:SetShadowColor(0,0,0,0)

				m_border(GarrisonLandingPage.FollowerTab.XPBar,374,16,"Center",0,0,12,"MEDIUM")
						
				
				for i = 1,10 do
					_G["GarrisonLandingPageReportListListScrollFrameButton"..i]:HookScript("OnEnter", function(self, button)
						local items = GarrisonLandingPageReport.List.items 
						if GarrisonLandingPageReport.selectedTab == GarrisonLandingPageReport.Available then
							items = GarrisonLandingPageReport.List.AvailableItems 
						end

						local item = items[self.id];
	
							if ( item.isBuilding ) then
								return;
							end
							if ( GarrisonLandingPageReport.selectedTab == GarrisonLandingPageReport.InProgress ) then
							
							else
								if not (item.isRare) then
								GameTooltip:AddLine(" ");
								GameTooltip:AddLine(GARRISON_MISSION_AVAILABILITY);
								GameTooltip:AddLine(item.offerTimeRemaining, 1, 1, 1);
								end
							end
						GameTooltip:Show();
						
					end)
				end
				
				
				for i = 1,7 do
					_G["GarrisonMissionFrameMissionsListScrollFrameButton"..i]:HookScript("OnEnter", function(self)
						if not (self.info.inProgress) and not (self.info.isRare) then
						GameTooltip:AddLine(GARRISON_MISSION_AVAILABILITY)
						GameTooltip:AddLine(self.info.offerTimeRemaining, 1, 1, 1)
						GameTooltip:Show()
						end
					end)
				end	
				
				
			end	
		end
		
		frame:SetScript("OnEvent", frame.OnEvent);
		
		-- Better Garrison Minimap Button
		
		GarrisonLandingPageMinimapButton:HookScript("OnShow", function(self)
		
		bla=select(7,GarrisonLandingPageMinimapButton:GetRegions())	
		bla:SetTexture("Interface\\Garrison\\horde.blp")
			
		pulse=select(2,GarrisonLandingPageMinimapButton:GetRegions())
		pulse:SetSize(36,36)
		pulse:SetTexture("Interface\\Garrison\\pulse.blp")
			
		GarrisonLandingPageMinimapButton:UnregisterEvent("SHIPMENT_UPDATE")
		GarrisonLandingPageMinimapButton:UnregisterEvent("GARRISON_INVASION_AVAILABLE")
		GarrisonLandingPageMinimapButton:SetSize(32,32)	
		GarrisonLandingPageMinimapButton:SetPushedTexture("Interface\\Garrison\\horde.blp")
		end)