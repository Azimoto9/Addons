	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		for i=1,2 do
			local button = _G["GuildRegistrarButton"..i]
			if button:GetFontString() then
				if button:GetFontString():GetText() then
					button:GetFontString():SetTextColor(1,1,1)
					button:GetFontString():SetShadowColor(0,0,0,0)
					button:GetFontString():SetFont(unpack(miirgui.medium))
				end
			end
		end

		GuildRegistrarPurchaseText:SetTextColor(1,1,1)
		GuildRegistrarPurchaseText:SetShadowColor(0,0,0,0)
		GuildRegistrarPurchaseText:SetFont(unpack(miirgui.medium))
		PetitionBg= select(19,PetitionFrame:GetRegions() )
		PetitionBg:Hide() 
		PetitionPortrait= select(18,PetitionFrame:GetRegions() )
		PetitionPortrait:Show()
		PetitionPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PetitionPortrait:SetPoint("Topleft",-8,10)
		PetitionPortrait:SetWidth(64)
		PetitionPortrait:SetHeight(64)
		PetitionFrameCharterTitle:SetTextColor(unpack(miirgui.Color))
		PetitionFrameCharterTitle:SetShadowColor(0,0,0,0)
		PetitionFrameCharterTitle:SetFont(unpack(miirgui.medium))
		PetitionFrameCharterName:SetTextColor(1, 1, 1,1)
		PetitionFrameCharterName:SetShadowColor(0,0,0,0)
		PetitionFrameCharterName:SetFont(unpack(miirgui.medium))
		PetitionFrameMasterTitle:SetTextColor(unpack(miirgui.Color))
		PetitionFrameMasterTitle:SetShadowColor(0,0,0,0)
		PetitionFrameMasterTitle:SetFont(unpack(miirgui.medium))
		PetitionFrameMasterName:SetTextColor(1, 1, 1,1)
		PetitionFrameMasterName:SetShadowColor(0,0,0,0)
		PetitionFrameMasterName:SetFont(unpack(miirgui.medium))
		PetitionFrameMemberTitle:SetTextColor(unpack(miirgui.Color))
		PetitionFrameMemberTitle:SetShadowColor(0,0,0,0)
		PetitionFrameMemberTitle:SetFont(unpack(miirgui.medium))
		for i= 1,9 do
		_G["PetitionFrameMemberName"..i]:SetTextColor(1, 1, 1,1)
		_G["PetitionFrameMemberName"..i]:SetShadowColor(0,0,0,0)
		_G["PetitionFrameMemberName"..i]:SetFont(unpack(miirgui.medium))
		end
		PetitionFrameInstructions:SetTextColor(1, 1, 1,1)
		PetitionFrameInstructions:SetShadowColor(0,0,0,0)
		PetitionFrameInstructions:SetFont(unpack(miirgui.medium))

				--[[GuildRegistrarFrame Changes]]--

		local GuildInvite=CreateFrame("frame")
		GuildInvite:RegisterEvent("GUILD_INVITE_REQUEST")
		GuildInvite:SetScript("OnEvent",function(GuildInvite)
		GuildInviteFrameTabardRing:Hide()
		GuildInviteFrameBackground:Hide()
		GuildInviteFrameBg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
		GuildInviteFrameBg:SetAlpha(0.6)
		m_border(GuildInviteFrame,68,68,"Top",0,-68,14,"HIGH")
		GuildInviteFrameInviterName:SetTextColor(1,1,1,1)
		GuildInviteFrameInviterName:SetShadowColor(0,0,0,0)
		GuildInviteFrameInviterName:SetFont(unpack(miirgui.small))
		GuildInviteFrameInviteText:SetTextColor(1,1,1,1)
		GuildInviteFrameInviteText:SetShadowColor(0,0,0,0)
		GuildInviteFrameInviteText:SetFont(unpack(miirgui.small))
		GuildInviteFrameGuildName:SetTextColor(unpack(miirgui.Color))
		GuildInviteFrameGuildName:SetShadowColor(0,0,0,0)
		GuildInviteFrameGuildName:SetFont(unpack(miirgui.medium))
		Achievement= select(1,GuildInviteFrame:GetChildren() )
		Achievementtext= select(1,Achievement:GetRegions() )
		Achievementtext:SetTextColor(unpack(miirgui.Color))
		Achievementtext:SetShadowColor(0,0,0,0)
		Achievementtext:SetFont(unpack(miirgui.small))
		GuildLevel= select(1,GuildInviteFrame:GetChildren() )
		GuildLevelText= select(2,GuildLevel:GetRegions() )
		GuildLevelText:SetTextColor(1,1,1,1)
		GuildLevelText:SetShadowColor(0,0,0,0)
		GuildLevelText:SetFont(unpack(miirgui.medium))
		end)

		GuildRegistrarRealBG=select(19,GuildRegistrarFrame:GetRegions())
		GuildRegistrarRealBG:Hide()
		GuildRegistrarFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		AvailableServicesText:SetTextColor(1,1,1,1)
		AvailableServicesText:SetShadowColor(0,0,0,0)
		AvailableServicesText:SetFont(unpack(miirgui.medium))
		m_border(GuildRegistrarFrame,332,340,"TopLeft",2,-60,14,"MEDIUM")

		
	end)