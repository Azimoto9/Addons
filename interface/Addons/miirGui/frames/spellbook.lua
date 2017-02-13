	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		SpellBookFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		PrimaryProfession1Icon:SetAlpha(1)
		PrimaryProfession1Icon:SetDesaturated(nil)
		PrimaryProfession1Icon:SetBlendMode("Blend")
		PrimaryProfession1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PrimaryProfession2Icon:SetAlpha(1)
		PrimaryProfession2Icon:SetDesaturated(nil)
		PrimaryProfession2Icon:SetBlendMode("Blend")
		PrimaryProfession2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookFrameTutorialButton:Hide()
		SpellBookPageText:SetTextColor(1, 1, 1,1)
		SpellBookPageText:SetFont(unpack(miirgui.small))
		SpellBookPageText:SetShadowColor(0,0,0,0)
		PrimaryProfession1Missing:SetTextColor(unpack(miirgui.Color))
		PrimaryProfession1Missing:SetFont(unpack(miirgui.huge))
		PrimaryProfession1Missing:SetShadowColor(0,0,0,0)
		PrimaryProfession2Missing:SetTextColor(unpack(miirgui.Color))
		PrimaryProfession2Missing:SetFont(unpack(miirgui.huge))
		PrimaryProfession2Missing:SetShadowColor(0,0,0,0)
		SpellBookSkillLineTab1Icon=select(4,SpellBookSkillLineTab1:GetRegions())
		SpellBookSkillLineTab1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab2Icon=select(4,SpellBookSkillLineTab2:GetRegions())
		SpellBookSkillLineTab2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab3Icon=select(4,SpellBookSkillLineTab3:GetRegions())
		SpellBookSkillLineTab3Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab4Icon=select(4,SpellBookSkillLineTab4:GetRegions())
		SpellBookSkillLineTab4Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab5Icon=select(4,SpellBookSkillLineTab5:GetRegions())
		SpellBookSkillLineTab5Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PrimaryProfession1missingtext=select(4,PrimaryProfession1:GetRegions())
		PrimaryProfession1missingtext:SetTextColor(1,1,1,1)
		PrimaryProfession1missingtext:SetShadowColor(0,0,0,0)
		PrimaryProfession1missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession1Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession1Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession1Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession2Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession2Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession2Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession3Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession3Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession3Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession4Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession4Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession4Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession1missingtext=select(4,SecondaryProfession1:GetRegions())
		SecondaryProfession1missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession1missingtext:SetShadowColor(0,0,0,0)
		SecondaryProfession1missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession2missingtext=select(4,SecondaryProfession2:GetRegions())
		SecondaryProfession2missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession2missingtext:SetShadowColor(0,0,0,0)
		SecondaryProfession2missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession3missingtext=select(4,SecondaryProfession3:GetRegions())
		SecondaryProfession3missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession3missingtext:SetShadowColor(0,0,0,0)
		SecondaryProfession3missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession4missingtext=select(4,SecondaryProfession4:GetRegions())
		SecondaryProfession4missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession4missingtext:SetShadowColor(0,0,0,0)
		SecondaryProfession4missingtext:SetFont(unpack(miirgui.small))
		PrimaryProfession2missingtext=select(4,PrimaryProfession2:GetRegions())
		PrimaryProfession2missingtext:SetTextColor(1,1,1,1)
		PrimaryProfession2missingtext:SetShadowColor(0,0,0,0)
		PrimaryProfession2missingtext:SetFont(unpack(miirgui.small))
		m_border(PrimaryProfession1,74,74,"Left",6,-2,14,"MEDIUM")
		m_border(PrimaryProfession2,74,74,"Left",6,-2,14,"MEDIUM")

		local function miirgui_FormatProfession(frame,index)
			if index then
				frame.missingHeader:Hide();
				frame.missingText:Hide();
				local name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier, specializationIndex, specializationOffset = GetProfessionInfo(index);
				frame.skillName = name;
				frame.rank:SetText(prof_title);
				frame.rank:SetShadowColor(0,0,0,0)
				frame.rank:SetFont(unpack(miirgui.small))
				frame.professionName:SetText(name);
				frame.professionName:SetTextColor(unpack(miirgui.Color))
				frame.professionName:SetFont(unpack(miirgui.medium))
				frame.professionName:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc("FormatProfession",miirgui_FormatProfession)

		local function miirgui_UpdateProfessionButton(self)
			local spellIndex = self:GetID() + self:GetParent().spellOffset;
			local texture = GetSpellBookItemTexture(spellIndex, SpellBookFrame.bookType);
			local spellName, subSpellName = GetSpellBookItemName(spellIndex, SpellBookFrame.bookType);
			local isPassive = IsPassiveSpell(spellIndex, SpellBookFrame.bookType);
				if ( isPassive ) then
					self.highlightTexture:SetTexture("Interface\\Buttons\\UI-PassiveHighlight");
					self.spellString:SetTextColor(unpack(miirgui.Color))
					self.spellString:SetFont(unpack(miirgui.medium))
					self.spellString:SetShadowColor(0,0,0,0)     
				else
					self.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
					self.spellString:SetTextColor(unpack(miirgui.Color))
					self.spellString:SetFont(unpack(miirgui.medium))
					self.spellString:SetShadowColor(0,0,0,0)
				end
		end

		hooksecurefunc("UpdateProfessionButton",miirgui_UpdateProfessionButton)


		local function miirgui_SpellBookCoreAbilities_UpdateTabs()
			local numSpecs = GetNumSpecializations();
			local currentSpec = GetSpecialization();
			local index = 1;
			local tab;
			for i=1, numSpecs do
			tab =SpellBook_GetCoreAbilitySpecTab(i)
			tab:GetNormalTexture():SetTexCoord(0.85, 0.15, 0.15, 0.85)
			i = i+1
			end
		end

		hooksecurefunc("SpellBookCoreAbilities_UpdateTabs",miirgui_SpellBookCoreAbilities_UpdateTabs)

		local function miirgui_SpellBook_UpdateCoreAbilitiesTab()
			local currentSpec = GetSpecialization();
			local desaturate = currentSpec and (currentSpec ~= SpellBookCoreAbilitiesFrame.selectedSpec);
			local specID, displayName = GetSpecializationInfo(SpellBookCoreAbilitiesFrame.selectedSpec);
			SpellBookCoreAbilitiesFrame.SpecName:SetText(displayName);
			SpellBookCoreAbilitiesFrame.SpecName:SetTextColor(unpack(miirgui.Color))
			SpellBookCoreAbilitiesFrame.SpecName:SetFont(unpack(miirgui.huge))
			SpellBookCoreAbilitiesFrame.SpecName:SetShadowColor(0,0,0,0)
	
			local abilityList = SPEC_CORE_ABILITY_DISPLAY[specID];
			if ( abilityList ) then
				for i=1, #abilityList do
					local name, subname = GetSpellInfo(abilityList[i]);
					local _, icon = GetSpellTexture(abilityList[i]);
					local button = SpellBook_GetCoreAbilityButton(i);
					button.spellID = abilityList[i];
					button.Name:SetText(name);
					button.Name:SetTextColor(unpack(miirgui.Color))
					button.Name:SetFont(unpack(miirgui.medium))
					button.Name:SetShadowColor(0,0,0,0)
					button.InfoText:SetText(_G[SPEC_CORE_ABILITY_TEXT[specID].."_CORE_ABILITY_"..i]);
					button.InfoText:SetTextColor(1, 1, 1,1)
					button.InfoText:SetFont(unpack(miirgui.small))
					button.InfoText:SetShadowColor(0,0,0,0)
					button.iconTexture:SetTexture(icon);
					button.iconTexture:SetDesaturated(showLevel or desaturate);
					button.RequiredLevel:SetTextColor(1, 1, 1,1)
					button.RequiredLevel:SetShadowColor(0,0,0,0)
					button.RequiredLevel:SetFont(unpack(miirgui.small))
				end
			end
		end

		hooksecurefunc("SpellBook_UpdateCoreAbilitiesTab", miirgui_SpellBook_UpdateCoreAbilitiesTab)

		local function miirgui_SpellButton_UpdateButton(self)
			local slot, slotType = SpellBook_GetSpellBookSlot(self);
			local name = self:GetName();
			local subSpellString = _G[name.."SubSpellName"]
			local spellString = _G[name.."SpellName"];
			spellString:SetTextColor(unpack(miirgui.Color));
			spellString:SetFont(unpack(miirgui.medium))
			spellString:SetShadowColor(0,0,0,0)
			subSpellString:SetTextColor(1, 1, 1)
			subSpellString:SetShadowColor(0,0,0,0)
			subSpellString:SetFont(unpack(miirgui.small))
			if slotType == "FUTURESPELL" then
				local level = GetSpellAvailableLevel(slot, SpellBookFrame.bookType)
					if (level and level > UnitLevel("player")) then
						self.RequiredLevelString:SetTextColor(1, 1, 1);
						self.RequiredLevelString:SetFont(unpack(miirgui.small))
						self.RequiredLevelString:SetShadowColor(0,0,0,0)
					end
			end
			local temp, texture, offset, numSlots, isGuild, offSpecID = GetSpellTabInfo(SpellBookFrame.selectedSkillLine);
			local isOffSpec = (offSpecID ~= 0) and (SpellBookFrame.bookType == BOOKTYPE_SPELL);
			if (isOffSpec) then
						self.RequiredLevelString:SetTextColor(1, 1, 1);
						self.RequiredLevelString:SetFont(unpack(miirgui.small))
						self.RequiredLevelString:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc("SpellButton_UpdateButton", miirgui_SpellButton_UpdateButton)
		
	end)