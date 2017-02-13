		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes


		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_TradeSkillUI" then

			local loaded = LoadAddOn("BiggerTradeskillUI")
			if not loaded then

				local tsdw = IsAddOnLoaded("TradeSkillDW")
				if tsdw == true then
					local tsdwb = CreateFrame("Frame", "nil",TradeSkillFrame)
					tsdwb:SetFrameStrata("MEDIUM")
					tsdwb:SetPoint("Topleft",TradeSkillFrame,4,-80)
					tsdwb:SetPoint("BottomRight",TradeSkillFrame,-6,24)
					tsdwb:SetBackdrop({
					bgFile = "",
					edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
					edgeSize = 14,})
					tsdwb:SetBackdropColor(0, 0, 0, 0)
					tsdwb:SetBackdropBorderColor(1, 1, 1)	

				else
					m_border(TradeSkillFrame,330,320,"Center",-1,-28,14,"Medium")
				end
			else
			m_border(TradeSkillFrame,546,420,"Center",-1,-28,12,"Medium")
			BTSUiTexDetailBackground:Hide()
			end
			TradeSkillFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);