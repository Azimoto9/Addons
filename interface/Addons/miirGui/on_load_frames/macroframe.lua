		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_MacroUI" then

			for i=19,21 do
				hideit= select(i,MacroFrame:GetRegions() )
				hideit:Hide() 
			end
			MacroFramePortraitmiirgui=select(18,MacroFrame:GetRegions())
			MacroFramePortraitmiirgui:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			MacroFramePortraitmiirgui:SetPoint("Topleft",-8,9)
			MacroFramePortraitmiirgui:SetWidth(64)
			MacroFramePortraitmiirgui:SetHeight(64)

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);