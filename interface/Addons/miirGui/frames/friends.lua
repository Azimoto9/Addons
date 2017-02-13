	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()
		FriendsFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		FriendsFrameIcon:SetPoint("Topleft",-8,9)
		FriendsFrameIcon:SetWidth(64)
		FriendsFrameIcon:SetHeight(64)
		m_border(FriendsListFrame,332,318,"Center",-2,-29,14,"MEDIUM")
		m_border(IgnoreListFrame,332,318,"Center",-2,-29,14,"MEDIUM")
		m_border(PendingListFrame,332,318,"Center",-2,-29,14,"MEDIUM")
		m_border(WhoFrame,332,320,"Center",-2,-28,14,"MEDIUM")
		m_border(ChannelFrame,330,340,"Center",-2,-4,14,"MEDIUM")
	end)
	
	local frame = CreateFrame("FRAME");
	frame:RegisterEvent("RAID_ROSTER_UPDATE")
	frame:RegisterEvent("GROUP_ROSTER_UPDATE")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	m_border(RaidFrame,330,340,"Center",-1,-17,14,"MEDIUM")
		function frame:OnEvent(event)
		
			if IsInRaid() then
			--print("inraid")
				m_border_RaidFrame:ClearAllPoints()
				m_border_RaidFrame:SetPoint("Center",-1,-27)
				m_border_RaidFrame:SetSize(330,364)
			else
			--print("not in raid")
				m_border_RaidFrame:ClearAllPoints()
				m_border_RaidFrame:SetPoint("Center",-1,-17)
				m_border_RaidFrame:SetSize(330,340)
			end	
		end
	frame:SetScript("OnEvent", frame.OnEvent);	