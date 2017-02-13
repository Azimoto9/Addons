		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_GuildUI" then

			GuildInfoDetailsFrameScrollBarTrack:SetAlpha(0)
			GuildNewsContainerScrollBarTrack:SetAlpha(0)
			GuildPerksContainerScrollBarTrack:Hide()
			GuildLogScrollFrameScrollBarTrack:Hide()
			Emblem1 = select(1, GuildPointFrame:GetRegions())
			Emblem1:Hide()
			Emblem2 = select(4, GuildPointFrame:GetRegions())
			Emblem2:Hide()
			GuildTextEditScrollFrameScrollBarTrack:Hide()

			local FixPerksBG= CreateFrame("Frame","miirgui_GuildPerksFrame",GuildPerksFrame)
			FixPerksBG:SetFrameStrata("Medium")
			FixPerksBG:SetWidth(323) 
			FixPerksBG:SetHeight(323)
			local FixPerksBGtexture = FixPerksBG:CreateTexture(nil,"BACKGROUND")
			FixPerksBGtexture:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			FixPerksBGtexture:SetAllPoints(FixPerksBG)
			FixPerksBG.texture = FixPerksBGtexture
			FixPerksBG:SetPoint("Center",-1,-6)
			FixPerksBG:Show()

			m_border(GuildRosterFrame,330,310,"Center",-1,-32,14,"Medium")
			m_border(GuildPerksFrame,330,340,"Center",-1,0,12,"Medium")
			m_border(GuildInfoFrameRecruitment,330,336,"Center",-1,0,12,"Medium")
			m_border(GuildInfoFrameApplicants,330,336,"Center",-1,0,12,"Medium")

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);