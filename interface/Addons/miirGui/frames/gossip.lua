	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		GossipFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		GossipGreetingText:SetTextColor(1, 1, 1,1)
		GossipGreetingText:SetFont(unpack(miirgui.medium))
		GossipGreetingText:SetShadowColor(0,0,0,0)
		GossipFrameBackground = select(19,GossipFrame:GetRegions())
		GossipFrameBackground:Hide()
		m_border(GossipFrame,330,412,"Center",0,-18,14,"MEDIUM")
		
	end)