	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		DressUpFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		
	end)