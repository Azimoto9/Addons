		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_GuildBankUI" then

			GuildBankFrameBlackBG:Hide()
			GuildBankEmblemFrame:Hide()
			m_border(GuildBankFrame,720,316,"Center",1,0,14,"MEDIUM")
			local c = CreateFrame("Frame",GuildBankBackground,GuildBankFrame)
			c:SetFrameStrata("Low")
			local ct = c:CreateTexture(nil,"BACKGROUND")
			ct:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			ct:SetAllPoints(c)
			c.texture = ct
			c:SetPoint("Topleft",0,0)
			c:SetPoint("Bottomright",0,0)
			c:Show()

			local function miirgui_GuildBankFrame_Update()
				local tab = GetCurrentGuildBankTab();
				local button, index, column;
				local texture, itemCount, locked, isFiltered, quality;
				for i=1, MAX_GUILDBANK_SLOTS_PER_TAB do
					index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP);
					if ( index == 0 ) then
						index = NUM_SLOTS_PER_GUILDBANK_GROUP;
					end
				column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP);
				button = _G["GuildBankColumn"..column.."Button"..index];
				button:SetID(i);
				texture, itemCount, locked, isFiltered, quality = GetGuildBankItemInfo(tab, i);
					if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
						button.IconBorder:Show();
						button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						button.Count:ClearAllPoints()
						button.Count:SetPoint("Center", 0, -11)
					end
				end
			end

			hooksecurefunc("GuildBankFrame_Update", miirgui_GuildBankFrame_Update)

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);