		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_ChallengesUI" then

			ChallengesFrameDetailsLine1:Hide()
			ChallengesFrameDetailsLine2:Hide()
			ChallengeBG= select(1,ChallengesFrameDetails:GetRegions() )
			ChallengeBG:Hide() 
			m_border(ChallengesFrameDetails,340,34,"Center",-2,20,14,"HIGH")
			m_border(ChallengesFrameRewardRow1,340,34,"Center",0,0,12,"MEDIUM")
			m_border(ChallengesFrameRewardRow2,340,34,"Center",0,0,12,"MEDIUM")
			m_border(ChallengesFrameRewardRow3,340,34,"Center",0,0,12,"MEDIUM")

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);