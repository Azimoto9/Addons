local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()

	TimeManagerGlobe:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
	TimeManagerGlobe:SetPoint("TOPLEFT", -7,9)
	
end)