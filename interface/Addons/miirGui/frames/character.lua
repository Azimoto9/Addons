	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		local function miirgui_PaperDollItemSlotButton_Update(self)
			local quality = GetInventoryItemQuality("player", self:GetID());
			if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality] and self:GetID() < 20) then
				self.IconBorder:Show()
				self.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
				self.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b)
			end
			CharacterBag0Slot.IconBorder:SetAlpha(0)
			CharacterBag1Slot.IconBorder:SetAlpha(0)
			CharacterBag2Slot.IconBorder:SetAlpha(0)
			CharacterBag3Slot.IconBorder:SetAlpha(0)
		end

		hooksecurefunc("PaperDollItemSlotButton_Update",miirgui_PaperDollItemSlotButton_Update)

		local function miirgui_CharacterFrame_UpdatePortrait()
		local masteryIndex = GetSpecialization();
			if (masteryIndex == nil) then
				local _, class = UnitClass("player");
				CharacterFramePortrait:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\classes");
				CharacterFramePortrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[class]));
				CharacterFramePortrait:SetPoint("Topleft",-8,9)
				CharacterFramePortrait:SetWidth(64)
				CharacterFramePortrait:SetHeight(64)
				else
				local icon = select(4,GetSpecializationInfo(masteryIndex))
				CharacterFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85);
			end
		end

		hooksecurefunc("CharacterFrame_UpdatePortrait",miirgui_CharacterFrame_UpdatePortrait)
		
		local function miirgui_EquipmentFlyout_DisplayButton(button, paperDollItemSlot)
			local location = button.location;
			if ( not location ) then
				return;
			end
			if ( location >= EQUIPMENTFLYOUT_FIRST_SPECIAL_LOCATION ) then
				EquipmentFlyout_DisplaySpecialButton(button, paperDollItemSlot);
				return;
			end

			local quality = select(16,EquipmentManager_GetItemInfoByLocation(location))
	
			if quality  then
					button.IconBorder:Show();
					button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
			end
		end
		
		hooksecurefunc("EquipmentFlyout_DisplayButton",miirgui_EquipmentFlyout_DisplayButton)
			
		m_border(ReputationFrame,330,364,"Center",-1,-27,14,"MEDIUM")
		m_border(TokenFrame,330,364,"Center",-1,-27,14,"MEDIUM")
		m_border(PetModelFrame,330,362,"Center",-1,0,14,"MEDIUM")
		
	end)