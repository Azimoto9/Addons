local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()

	TradeFramePlayerPortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
	TradeFramePlayerPortrait:SetPoint("TOPLEFT",-8,10)
	TradeFramePlayerPortrait:SetWidth(64)
	TradeFramePlayerPortrait:SetHeight(64)
	TradeFrameRecipientPortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
	TradeFrameRecipientPortrait:SetWidth(62)
	TradeFrameRecipientPortrait:SetHeight(62)
	TradeRecipientBG:Hide()
	TradeRecipientBotLeftCorner:SetPoint("BOTTOMLEFT", "TradeFrame", "BOTTOMRIGHT", -178, -5)
		
end)