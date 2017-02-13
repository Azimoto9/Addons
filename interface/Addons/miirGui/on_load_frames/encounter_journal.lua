		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_EncounterJournal"  then
			EncounterJournalInstanceSelectTierDropDownText:SetFont(unpack(miirgui.small))
			EncounterJournalInstanceSelectTierDropDownText:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoDifficulty:GetFontString():SetTextColor(1,1,1,1)
			EncounterJournalEncounterFrameInfoDifficulty:GetFontString():SetFont(unpack(miirgui.small))
			EncounterJournalEncounterFrameInfoDifficulty:GetFontString():SetShadowColor(0,0,0,0)	
			EncounterJournalEncounterFrameInfoLootScrollFrameFilterToggle:GetFontString():SetTextColor(1,1,1,1)
			EncounterJournalEncounterFrameInfoLootScrollFrameFilterToggle:GetFontString():SetFont(unpack(miirgui.small))
			EncounterJournalEncounterFrameInfoLootScrollFrameFilterToggle:GetFontString():SetShadowColor(0,0,0,0)
			EncounterJournalInstanceSelectRaidTab.grayBox:ClearAllPoints()	
			EncounterJournalInstanceSelectRaidTab.grayBox:SetPoint("CENTER",EncounterJournalInstanceSelectRaidTab,"CENTER",-1,11)
			EncounterJournalInstanceSelectRaidTab.grayBox:SetSize(135,52)
			EncounterJournalSuggestFrame.Suggestion1.bg:Hide()			
			EncounterJournalSuggestFrame.Suggestion2.bg:Hide()			
			EncounterJournalSuggestFrame.Suggestion3.bg:Hide()	
			EncounterJournalEncounterFrameInfoInstanceTitle:SetFont(unpack(miirgui.huge))
			EncounterJournalEncounterFrameInfoInstanceTitle:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoInstanceTitle:SetTextColor(unpack(miirgui.Color))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildLoreDescription:SetTextColor(1, 1, 1)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildLoreDescription:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildLoreDescription:SetFont(unpack(miirgui.medium))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetTextColor(1, 1, 1)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetFont(unpack(miirgui.medium))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetTextColor(unpack(miirgui.Color))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetFont(unpack(miirgui.medium))
			EncounterJournalPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			EncounterJournalInstanceSelectScrollFrameScrollBarTrack:Hide()
			EncounterJournalInstanceSelectBG:Hide()
			EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoLootScrollFrameScrollBarTrack:Hide()
			m_border(EncounterJournalEncounterFrameInstanceFrame,340,266,"Center",3,34,12,"MEDIUM")
			m_border(EncounterJournalInstanceSelect,794	,388,"Center",1,-22,12,"HIGH")
			m_border(EncounterJournalSuggestFrame.Suggestion1,340,260,"Center",3,-28,12,"MEDIUM")
			m_border(EncounterJournalSuggestFrame.Suggestion2,280,130,"Center",25,14,12,"MEDIUM")
			m_border(EncounterJournalSuggestFrame.Suggestion3,280,130,"Center",25,14,12,"MEDIUM")
			
			for i = 1, 9 do
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Icon"]:SetSize(40,40)			
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetFont(unpack(miirgui.medium))
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetFont(unpack(miirgui.medium))
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetFont(unpack(miirgui.medium))
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetFont(unpack(miirgui.medium))
			end
			
			_G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetTextColor(1, 1, 1,1)
			_G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetShadowColor(0,0,0,0)
			_G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetFont(unpack(miirgui.medium)) 
			_G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetTextColor(1, 1, 1,1)
			_G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetShadowColor(0,0,0,0)
			_G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetFont(unpack(miirgui.medium)) 
			_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetTextColor(unpack(miirgui.Color))
			_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetFont(unpack(miirgui.medium))   
			_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetShadowColor(0,0,0,0)      
			
			local function miirgui_EncounterJournal_UpdateButtonState(self)
				local oldtex = self.textures.expanded;
				if self:GetParent().expanded then
					self.tex = self.textures.expanded;
					oldtex = self.textures.collapsed;
					self.expandedIcon:SetTextColor(unpack(miirgui.Color));
					self.expandedIcon:SetFont(unpack(miirgui.small))
					self.expandedIcon:SetShadowColor(0,0,0,0)
					self.title:SetTextColor(unpack(miirgui.Color));
					self.title:SetFont(unpack(miirgui.medium))
					self.title:SetShadowColor(0,0,0,0)
				else
					self.tex = self.textures.collapsed;
					self.expandedIcon:SetTextColor(unpack(miirgui.Color));
					self.expandedIcon:SetFont(unpack(miirgui.small))
					self.expandedIcon:SetShadowColor(0,0,0,0)
					self.title:SetTextColor(unpack(miirgui.Color));
					self.title:SetFont(unpack(miirgui.medium))
					self.title:SetShadowColor(0,0,0,0)
				end
			end

			hooksecurefunc("EncounterJournal_UpdateButtonState",miirgui_EncounterJournal_UpdateButtonState)

			local function miirgui_EncounterJournal_SetBullets(object, description, hideBullets)
				local parent = object:GetParent();
				local desc = string.match(description, "(.-)\$bullet;");
				local bullets = {}
				for v in string.gmatch(description,"\$bullet;([^$]+)") do
					tinsert(bullets, v);
				end
				local k = 1;
				for j = 1,#bullets do
					local text = bullets[j];
					if (text and text ~= "") then
						local bullet;
						bullet = parent.Bullets and parent.Bullets[k];
						bullet.Text:SetTextColor(1,1,1,1)
						bullet.Text:SetShadowColor(0,0,0,0)
						bullet.Text:SetFont(unpack(miirgui.medium));
						k = k + 1;
					end
				end
			
			end

			hooksecurefunc("EncounterJournal_SetBullets",miirgui_EncounterJournal_SetBullets)

			local function miirgui_EncounterJournal_ToggleHeaders()
				for i = 1, 50 do
					if _G["EncounterJournalInfoHeader"..i] then  
						_G["EncounterJournalInfoHeader"..i].description:SetTextColor(1, 1, 1,1)
						_G["EncounterJournalInfoHeader"..i].description:SetShadowColor(0,0,0,0)
						_G["EncounterJournalInfoHeader"..i].description:SetFont(unpack(miirgui.medium))
						_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetTextColor(unpack(miirgui.Color));
						_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetShadowColor(0,0,0,0)
						_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetFont(unpack(miirgui.small))      
					end
				end    
			end

			hooksecurefunc("EncounterJournal_ToggleHeaders", miirgui_EncounterJournal_ToggleHeaders)	
			
			local function miirgui_EncounterJournal_DisplayInstance(instanceID, noButton)
				local self = EncounterJournal.encounter;
				local iname, description, bgImage, _, loreImage, buttonImage = EJ_GetInstanceInfo();
				self.instance.title:SetTextColor(1,1,1,1)
				self.instance.title:SetFont(unpack(miirgui.huge))
				self.info.instanceButton.icon:SetMask("")
				local bossIndex = 1;
				local name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
				local bossButton;
				while bossID do
					bossButton = _G["EncounterJournalBossButton"..bossIndex];
					bossButton:GetFontString():SetTextColor(1,1,1,1)
					bossButton:GetFontString():SetFont(unpack(miirgui.medium))
					bossButton:GetFontString():SetShadowColor(0,0,0,0)
					bossButton:Show();
					bossIndex = bossIndex + 1;
					name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
				end
			end

			hooksecurefunc("EncounterJournal_DisplayInstance", miirgui_EncounterJournal_DisplayInstance)

			local function miirgui_EncounterJournal_DisplayEncounter()
				local id, name, displayInfo, iconImage;
				for i=1,9 do 
					id, name, description, displayInfo, iconImage = EJ_GetCreatureInfo(i);
						if id then
						local button = EncounterJournal_GetCreatureButton(i);
						button.creature:SetTexCoord(0.13, 0.83, 0.13, 0.83);
						SetPortraitTexture(button.creature, displayInfo);
						end
				end
			end
			
			hooksecurefunc("EncounterJournal_DisplayEncounter",miirgui_EncounterJournal_DisplayEncounter)		
		
			local function miirgui_EJSuggestFrame_RefreshDisplay()
				local self = EncounterJournal.suggestFrame;
				C_AdventureJournal.GetSuggestions(self.suggestions);		
				if ( #self.suggestions > 0 ) then
					local suggestion = self.Suggestion1;
					local data = self.suggestions[1];
				
					suggestion.reward.icon:SetSize(46,46)
					suggestion.reward.iconRingHighlight:SetAlpha(0)
					suggestion.centerDisplay.title.text:SetTextColor(unpack(miirgui.Color))
					suggestion.centerDisplay.title.text:SetFont(unpack(miirgui.huge))
					suggestion.centerDisplay.title.text:SetShadowColor(0,0,0,0)		
					suggestion.centerDisplay.description.text:SetTextColor(1,1,1,1)
					suggestion.centerDisplay.description.text:SetFont(unpack(miirgui.medium))
					suggestion.centerDisplay.description.text:SetShadowColor(0,0,0,0)
					suggestion.iconRing:Hide();	
					suggestion.icon:SetMask("")	
					suggestion.reward.text:SetTextColor(1,1,1,1)
					suggestion.reward.text:SetFont(unpack(miirgui.medium))
					suggestion.reward.text:SetShadowColor(0,0,0,0)	
					
				end
				if ( #self.suggestions > 1 ) then			
					for i = 2, #self.suggestions do 
						local suggestion = self["Suggestion"..i];
						if ( not suggestion ) then 
							break;
						end	
						
						suggestion.reward:ClearAllPoints()
						suggestion.reward:SetPoint("BOTTOM",suggestion.icon,0,-60)
						
						local data = self.suggestions[i];					
						suggestion.centerDisplay.title.text:SetTextColor(unpack(miirgui.Color))
						suggestion.centerDisplay.title.text:SetFont(unpack(miirgui.huge))
						suggestion.centerDisplay.title.text:SetShadowColor(0,0,0,0)		
						suggestion.centerDisplay.description.text:SetTextColor(1,1,1,1)
						suggestion.centerDisplay.description.text:SetFont(unpack(miirgui.medium))
						suggestion.centerDisplay.description.text:SetShadowColor(0,0,0,0)
						suggestion.iconRing:Hide();
						suggestion.icon:SetMask("")
					end
				end
			end
			
			hooksecurefunc("EJSuggestFrame_RefreshDisplay",miirgui_EJSuggestFrame_RefreshDisplay)	
			
			local function miirgui_EJSuggestFrame_UpdateRewards(suggestion)
				suggestion.reward.iconRing:Hide()
				suggestion.reward:SetSize(46,46)
				suggestion.reward.icon:SetMask("");
			end
			
			hooksecurefunc("EJSuggestFrame_UpdateRewards", miirgui_EJSuggestFrame_UpdateRewards)

			local function miirgui_EJ_SetDifficulty()
				local self = EncounterJournal.encounter;
				local iname, description, bgImage, _, loreImage, buttonImage = EJ_GetInstanceInfo();
				self.instance.title:SetTextColor(1,1,1,1)
				self.instance.title:SetFont(unpack(miirgui.huge))
				self.info.instanceButton.icon:SetMask("")
				local bossIndex = 1;
				local name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
				local bossButton;
				while bossID do
					bossButton = _G["EncounterJournalBossButton"..bossIndex];
					bossButton:GetFontString():SetTextColor(1,1,1,1)
					bossButton:GetFontString():SetFont(unpack(miirgui.medium))
					bossButton:GetFontString():SetShadowColor(0,0,0,0)
					bossButton:Show();
					bossIndex = bossIndex + 1;
					name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
				end
			end
			
			hooksecurefunc("EJ_SetDifficulty",miirgui_EJ_SetDifficulty)
			
		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);