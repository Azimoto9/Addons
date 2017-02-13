	--[[Registering Events]]

	local frame = CreateFrame("FRAME");
	frame:RegisterEvent("ADDON_LOADED")

	--Applying changes

	function frame:OnEvent(event, arg1)

		local arkinv = IsAddOnLoaded("ArkInventory")

		if event == "ADDON_LOADED" and arg1 == "Blizzard_Collections" or arkinv == true then

			CollectionsJournalPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	
			MountJournalSummonRandomFavoriteButtonBorder:Hide()
			MountJournalListScrollFrameScrollBarBG:Hide()
	
			PetJournalTutorialButton:Hide()
			PetJournalListScrollFrameScrollBarBG:Hide()
			PetJournalLoadoutPet2BG:Hide()
			PetJournalLoadoutPet3BG:Hide()
			PetJournalLoadoutPet1PetTypeIcon:SetBlendMode("Add")
			PetJournalLoadoutPet2PetTypeIcon:SetBlendMode("Add")
			PetJournalLoadoutPet3PetTypeIcon:SetBlendMode("Add")
			PetJournalPetCardBG:Hide()
			PetJournalLoadoutBorder:Hide()
			PetJournalLoadoutPet1BG:Hide()
			PetJournalLoadoutPet2BG:Hide()
			PetJournalLoadoutPet3BG:Hide()
			PetJournalHealPetButtonBorder:Hide()

			ToyBox.iconsFrame.BackgroundTile:SetDesaturated(1)
			ToyBox.iconsFrame.OverlayShadowTopLeft:Hide()
			ToyBox.iconsFrame.OverlayShadowTop:Hide()
			ToyBox.iconsFrame.OverlayShadowTopRight:Hide()
			ToyBox.iconsFrame.OverlayShadowRight:Hide()
			ToyBox.iconsFrame.OverlayShadowLeft:Hide()
			ToyBox.iconsFrame.OverlayShadowBottomLeft:Hide()
			ToyBox.iconsFrame.OverlayShadowBottomRight:Hide()
			ToyBox.iconsFrame.OverlayShadowBottom:Hide()
			ToyBox.iconsFrame.BGCornerFilagreeBottomLeft:Hide()
			ToyBox.iconsFrame.BGCornerFilagreeBottomRight:Hide()
			ToyBox.iconsFrame.BGCornerTopLeft:Hide()
			ToyBox.iconsFrame.BGCornerTopRight:Hide()
			ToyBox.iconsFrame.BGCornerBottomRight:Hide()
			ToyBox.iconsFrame.BGCornerBottomLeft:Hide()
			ToyBox.iconsFrame.ShadowLineTop:Hide()
			ToyBox.iconsFrame.ShadowLineBottom:Hide()
			ToyBox.iconsFrame.ShadowCornerTopRight:Hide()
			ToyBox.iconsFrame.ShadowCornerTopLeft:Hide()
			ToyBox.iconsFrame.ShadowCornerLeft:Hide()
			ToyBox.iconsFrame.ShadowCornerRight:Hide()
			ToyBox.iconsFrame.ShadowCornerBottomLeft:Hide()
			ToyBox.iconsFrame.ShadowCornerBottomRight:Hide()
			ToyBox.iconsFrame.ShadowCornerTop:Hide()
			ToyBox.iconsFrame.ShadowCornerBottom:Hide()
			ToyBox.iconsFrame.watermark:Hide()
			ToyBox.navigationFrame.pageText:SetFont(unpack(miirgui.medium))
			ToyBox.navigationFrame.pageText:SetShadowColor(0,0,0,0)
			ToyBox.navigationFrame.pageText:SetTextColor(1, 1, 1,1)

			HeirloomsJournal.iconsFrame.BackgroundTile:SetDesaturated(1)
			HeirloomsJournal.iconsFrame.OverlayShadowTopLeft:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowTop:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowTopRight:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowRight:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowLeft:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowBottomLeft:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowBottomRight:Hide()
			HeirloomsJournal.iconsFrame.OverlayShadowBottom:Hide()
			HeirloomsJournal.iconsFrame.BGCornerFilagreeBottomLeft:Hide()
			HeirloomsJournal.iconsFrame.BGCornerFilagreeBottomRight:Hide()
			HeirloomsJournal.iconsFrame.BGCornerTopLeft:Hide()
			HeirloomsJournal.iconsFrame.BGCornerTopRight:Hide()
			HeirloomsJournal.iconsFrame.BGCornerBottomRight:Hide()
			HeirloomsJournal.iconsFrame.BGCornerBottomLeft:Hide()
			HeirloomsJournal.iconsFrame.ShadowLineTop:Hide()
			HeirloomsJournal.iconsFrame.ShadowLineBottom:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerTopRight:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerTopLeft:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerLeft:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerRight:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerBottomLeft:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerBottomRight:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerTop:Hide()
			HeirloomsJournal.iconsFrame.ShadowCornerBottom:Hide()
			HeirloomsJournal.iconsFrame.watermark:Hide()
			HeirloomsJournal.navigationFrame.pageText:SetFont(unpack(miirgui.medium))
			HeirloomsJournal.navigationFrame.pageText:SetShadowColor(0,0,0,0)
			HeirloomsJournal.navigationFrame.pageText:SetTextColor(1, 1, 1,1)
			
			-- Addings borders

			m_border(PetJournalLoadoutPet2,414,108,"TopLeft",-8,0,14,"HIGH")
			m_border(PetJournalLoadoutPet1,414,334,"TopLeft",-8,6,14,"HIGH")			
			m_border(PetJournalLeftInset,264,522,"Left",0,0,14,"HIGH")
			m_border(PetJournalPetCard,414,174,"TopLeft",-4,4,14,"HIGH")
			m_border(ToyBox.iconsFrame,696,544,"Center",0,0,12,"HIGH")
			m_border(MountJournal.LeftInset,264,522,"Left",0,0,14,"HIGH")
			m_border(MountJournal,414,522,"Center",139,-17,12,"HIGH")
			m_border(MountJournal.MountDisplay.InfoButton,42,42,"Center",-66,-20,14,"HIGH")
			m_border(MountJournalListScrollFrameButton1,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton2,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton3,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton4,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton5,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton6,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton7,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton8,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton9,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton10,42,42,"Left",-44,0,14,"HIGH")
			m_border(MountJournalListScrollFrameButton11,42,42,"Left",-44,0,14,"HIGH")
			m_border(HeirloomsJournal.iconsFrame,696,544,"Center",0,0,12,"HIGH")
			
			-- Captain Hook's Hooks
		
			local function miirgui_ToySpellButton_UpdateButton(self)	
				local toyString = self.name
				local slotFrameCollected = self.slotFrameCollected;
				local slotFrameUncollected = self.slotFrameUncollected;
				if (PlayerHasToy(self.itemID)) then
				
					toyString:SetTextColor(1,1,1,1)
					toyString:SetShadowColor(0, 0, 0, 0)
					toyString:SetFont(unpack(miirgui.small))
					slotFrameCollected:SetTexture("Interface\\Buttons\\UI-Quickslot")
					slotFrameCollected:SetHeight(74)
					slotFrameCollected:SetWidth(74)
				else
					toyString:SetTextColor(0.5, 0.5, 0.5, 1)
					toyString:SetFont(unpack(miirgui.small))
					toyString:SetShadowColor(0, 0, 0, 0)
					slotFrameUncollected:SetDesaturated(true)
					slotFrameUncollected:SetTexture("Interface\\Buttons\\UI-Quickslot")
					slotFrameUncollected:SetHeight(74)
					slotFrameUncollected:SetWidth(74)
				end
		
				self:SetScript("OnEvent",
					function(self)
					CollectionsSpellButton_UpdateCooldown(self)
				end)
				
			end

			hooksecurefunc("ToySpellButton_UpdateButton",miirgui_ToySpellButton_UpdateButton)				-- this hook changes the look of the Toys-Tab as well as its font color
					
			
			local function miirgui_PetJournal_UpdatePetLoadOut()
			--thanks to fuba for the fix :)
					for i=1,3 do
						local loadoutPlate = PetJournal.Loadout["Pet"..i];
						local petID = C_PetJournal.GetPetLoadOutInfo(i);
						if petID then
							loadoutPlate.level:SetTextColor(1,1,1,1)
							loadoutPlate.level:SetFont(unpack(miirgui.small))
							local health, maxHealth, attack, speed, rarity = C_PetJournal.GetPetStats(petID);
							loadoutPlate.qualityBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							loadoutPlate.qualityBorder:SetVertexColor(ITEM_QUALITY_COLORS[rarity-1].r, ITEM_QUALITY_COLORS[rarity-1].g, ITEM_QUALITY_COLORS[rarity-1].b);
							if not loadoutPlate.qualityBorder:IsVisible() then loadoutPlate.qualityBorder:Show() end
						end
					end 
			end

			hooksecurefunc("PetJournal_UpdatePetLoadOut",miirgui_PetJournal_UpdatePetLoadOut)				-- this hook changes the quality border on the pet loadout panel

			local function miirgui_PetJournal_UpdatePetCard(self)
				local speciesID, customName, level, name, icon, petType, creatureID, xp, maxXp, displayID, isFavorite, sourceText, description, isWild, canBattle, tradable, unique;
				if PetJournalPetCard.petID then
					speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal.GetPetInfoByPetID(PetJournalPetCard.petID);
					self.PetInfo.level:SetTextColor(1,1,1,1)
					self.PetInfo.level:SetFont(unpack(miirgui.small))
					self.PetInfo.qualityBorder:SetTexture("Interface\\Containerframe\\quality.blp")
					
					if petType == 1 then --humanoid
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\humanoid.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 2 then --dragonkin
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\dragon.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 3 then --flying
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\flying.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 4 then --undead
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\undead.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 5 then --critter
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\critter.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 6 then --magical
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\magical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 7 then --elemental
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\elemental.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 8 then --brock lesnar
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\beast.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 9 then --aquatic
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\water.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 10 then --mechanical
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\mechanical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					end
				else
					speciesID = PetJournalPetCard.speciesID;
					_,_, petType= C_PetJournal.GetPetInfoBySpeciesID(PetJournalPetCard.speciesID);
				if petType == 1 then --humanoid
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\humanoid.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 2 then --dragonkin
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\dragon.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 3 then --flying
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\flying.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 4 then --undead
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\undead.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 5 then --critter
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\critter.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 6 then --magical
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\magical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 7 then --elemental
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\elemental.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 8 then --brock lesnar
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\beast.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 9 then --aquatic
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\water.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 10 then --mechanical
											self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\mechanical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
				end
				end
			end

			hooksecurefunc("PetJournal_UpdatePetCard",miirgui_PetJournal_UpdatePetCard)						-- this hook changes the class-icon on the pet loadout panel

			local function miirgui_PetJournal_UpdatePetList()
				local scrollFrame = PetJournal.listScroll;
				local offset = HybridScrollFrame_GetOffset(scrollFrame);
				local petButtons = scrollFrame.buttons;
				local pet, index;
				local numPets, numOwned = C_PetJournal.GetNumPets();
				PetJournal.PetCount.Count:SetText(numOwned);
				local summonedPetID = C_PetJournal.GetSummonedPetGUID();
				for i = 1,#petButtons do
					pet = petButtons[i];
					index = offset + i;
					if index <= numPets then
						local petID, speciesID, isOwned, customName, level, favorite, isRevoked, name, icon, petType, creatureID, sourceText, description, isWildPet, canBattle = C_PetJournal.GetPetInfoByIndex(index);
						if isOwned then
							local health, maxHealth, attack, speed, rarity = C_PetJournal.GetPetStats(petID);
							pet.dragButton.level:SetTextColor(1,1,1,1)
							pet.dragButton.level:SetFont(unpack(miirgui.small))
							pet.iconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							pet.iconBorder:SetVertexColor(ITEM_QUALITY_COLORS[rarity-1].r, ITEM_QUALITY_COLORS[rarity-1].g, ITEM_QUALITY_COLORS[rarity-1].b);
						end
					end
				end
							for i=1,11 do
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:SetHeight(33)
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:SetWidth(66)
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:ClearAllPoints()
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:SetPoint("Right", -4, 0)
			end
			end

			hooksecurefunc("PetJournal_UpdatePetList",miirgui_PetJournal_UpdatePetList)						-- this hook changes the quality border on the pet-list

			local function miirgui_MountJournal_UpdateMountList()
				MountJournal_UpdateCachedList(MountJournal);
				local scrollFrame = MountJournal.ListScrollFrame;
				local offset = HybridScrollFrame_GetOffset(scrollFrame);
				local buttons = scrollFrame.buttons;
				local showMounts = true;
			
				for i=1, #buttons do
					local button = buttons[i];
					local displayIndex = i + offset;
					if ( displayIndex <= #MountJournal.cachedMounts and showMounts ) then
						local index = MountJournal.cachedMounts[displayIndex];
						local creatureName, spellID, icon, active, isUsable, sourceType, isFavorite, isFactionSpecific, faction, _, isCollected = MountJournal_GetMountInfo(index);
						if ( isFavorite ) then
							button.favorite:ClearAllPoints()
							button.favorite:SetPoint("Right", -5, 0)
						end
					end
				end

			end

			hooksecurefunc("MountJournal_UpdateMountList", miirgui_MountJournal_UpdateMountList)			-- this hook changes the position of the favorite icon on the mount list

			local function miirgui_UpdateButton(self,button)
				local name, itemEquipLoc, isPvP, itemTexture, upgradeLevel, source, effectiveLevel, minLevel, maxLevel = C_Heirloom.GetHeirloomInfo(button.itemID);	
				button.special:SetFont(unpack(miirgui.small))
				button.special:SetTextColor(1,1,1,1)
				button.special:SetShadowColor(0, 0, 0, 0)
				if C_Heirloom.PlayerHasHeirloom(button.itemID) then
					button.name:SetFont(unpack(miirgui.small))
					button.name:SetTextColor(1,1,1,1)
					button.name:SetShadowColor(0, 0, 0, 0)
					button.slotFrameCollected:SetTexture("Interface\\Buttons\\UI-Quickslot")
					button.slotFrameCollected:SetHeight(74)
					button.slotFrameCollected:SetWidth(74)
					button.levelBackground:Hide();
					button.level:SetTextColor(1,1,1,1)
					button.level:SetFont(unpack(miirgui.small))												
				else
					button.name:SetFont(unpack(miirgui.small))
					button.name:SetTextColor(0.5, 0.5, 0.5, 1);
					button.name:SetShadowColor(0, 0, 0, 0);
					button.special:SetFont(unpack(miirgui.small))
					button.special:SetTextColor(0.5, 0.5, 0.5, 1);
					button.special:SetShadowColor(0, 0, 0, 0);
					button.slotFrameUncollected:SetTexture("Interface\\Buttons\\UI-Quickslot")
					button.slotFrameUncollected:SetHeight(74)
					button.slotFrameUncollected:SetWidth(74)
				end
			end
 
			hooksecurefunc(HeirloomsJournal,"UpdateButton",miirgui_UpdateButton)							-- this hook changes the look of the heirlooms tab as well as its font color

			local function miirgui_LayoutCurrentPage(self)
				self.UpgradeLevelHelpBox:Hide();
				local pageLayoutData = self.heirloomLayoutData[self.currentPage];
				local numEntriesInUse = 0;
				local numHeadersInUse = 0;
				if pageLayoutData then
					for i, layoutData in ipairs(pageLayoutData) do
						if type(layoutData) == "string" then
							numHeadersInUse = numHeadersInUse + 1;
							local header = self:AcquireFrame(self.heirloomHeaderFrames, numHeadersInUse, "FRAME", "HeirloomHeaderTemplate");
							header.text:SetFont(unpack(miirgui.huge))
							header.text:SetTextColor(unpack(miirgui.Color));
							header.text:SetShadowColor(0, 0, 0, 0);
						end
					end
				end
			end

			hooksecurefunc(HeirloomsJournal,"LayoutCurrentPage",miirgui_LayoutCurrentPage)					-- this hook changes the fonts of the heirloom-headers

		end
	end

	frame:SetScript("OnEvent", frame.OnEvent);