	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		GameMenuFrameHeader:Hide()
		GameMenuText=select (11,GameMenuFrame:GetRegions())
		GameMenuText:Hide()
		
		InterfaceOptionsFramePanelContainer:SetBackdrop({
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 14,
		})
		InterfaceOptionsFrameHeader:Hide()
		InterfaceOptionsFrameHeaderText:Hide()
		VideoOptionsFrameHeader:Hide()
		VideoOptionsFrameHeaderText:Hide()
		
		gamemenubg = select(1,GameMenuFrame:GetRegions())
		gamemenubg:ClearAllPoints()
		gamemenubg:SetPoint("Topleft", GameMenuFrame, 8,-8)
		gamemenubg:SetPoint("Bottomright", GameMenuFrame, -8,8)

		staticbg = select(1,StaticPopup1:GetRegions())
		staticbg:ClearAllPoints()
		staticbg:SetPoint("Topleft",StaticPopup1, 8,-8)
		staticbg:SetPoint("Bottomright", StaticPopup1, -8,8)
		
	end)