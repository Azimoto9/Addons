		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_PVPUI" then
			WarGamesFrame.HorizontalBar:Hide()
			wargamesscroll = select(2,WarGamesFrameInfoScrollFrameScrollBar:GetRegions())
			wargamesscroll:Hide()
			wargamesscroll2 = select(1,WarGamesFrame:GetRegions())
			wargamesscroll2:Hide()
			WarGamesFrameDescription:SetTextColor(1,1,1,1)
			WarGamesFrameDescription:SetFont(unpack(miirgui.medium))
			WarGamesFrameDescription:SetShadowColor(0,0,0,0)
			ring1 = select(2,PVPQueueFrameCategoryButton1:GetRegions())
			ring1:Hide()
			icon1 = select(3,PVPQueueFrameCategoryButton1:GetRegions())
			icon1:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon1:SetWidth(46)
			icon1:SetHeight(46)
			ring2 = select(2,PVPQueueFrameCategoryButton2:GetRegions())
			ring2:Hide()
			icon2 = select(3,PVPQueueFrameCategoryButton2:GetRegions())
			icon2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon2:SetWidth(46)
			icon2:SetHeight(46)
			ring3 = select(2,PVPQueueFrameCategoryButton3:GetRegions())
			ring3:Hide()
			icon3 = select(3,PVPQueueFrameCategoryButton3:GetRegions())
			icon3:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon3:SetWidth(46)
			icon3:SetHeight(46)
			ring4 = select(2,PVPQueueFrameCategoryButton4:GetRegions())
			ring4:Hide()
			icon4 = select(3,PVPQueueFrameCategoryButton4:GetRegions())
			icon4:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon4:SetWidth(46)
			icon4:SetHeight(46)
			PVPRole = select(1,HonorFrame:GetChildren())
			local kids = {PVPRole:GetRegions() };
			for _, child in ipairs(kids) do
			child:Hide()
			end
			PVPReadyDialogBackground:Hide()
			m_border(PVPQueueFrameCategoryButton1,50,50,"Left",10,0,14,"MEDIUM")
			m_border(PVPQueueFrameCategoryButton2,50,50,"Left",10,0,14,"MEDIUM")
			m_border(PVPQueueFrameCategoryButton3,50,50,"Left",10,0,14,"MEDIUM")
			m_border(PVPQueueFrameCategoryButton4,50,50,"Left",10,0,14,"MEDIUM")
			m_border(HonorFrame,332,296,"Center",0,-34,16,"HIGH")
			m_border(ConquestFrame,332,350,"Center",2,-8,16,"HIGH")
			m_border(WarGamesFrame,334,382,"Center",2,9,14,"HIGH")

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);