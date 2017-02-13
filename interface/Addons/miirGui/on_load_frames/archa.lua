		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_ArchaeologyUI" then

		
			f= CreateFrame("Frame",nil)
			f:SetFrameStrata("MEDIUM")
			f:SetWidth(256) -- Set these to whatever height/width is needed 
			f:SetHeight(16) -- for your Texture
			local t = f:CreateTexture(nil,"BACKGROUND")
			t:SetTexture("Interface\\Archeology\\progress.blp")
			t:SetAllPoints(f)
			f.texture = t

		
		ArcheologyDigsiteProgressBar:HookScript("OnShow", function()
			ArcheologyDigsiteProgressBar.BarTitle:SetTextColor(1, 1, 1,1)
			ArcheologyDigsiteProgressBar.BarTitle:SetFont(unpack(miirgui.small))
			ArcheologyDigsiteProgressBar.BarTitle:SetShadowColor(0,0,0,0)
			ArcheologyDigsiteProgressBar.BarBorderAndOverlay:Hide()
			ArcheologyDigsiteProgressBar.Shadow:Hide()
			ArcheologyDigsiteProgressBar.BarBackground:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")		
		
			f:SetParent(ArcheologyDigsiteProgressBar)
			f:SetPoint("CENTER",0,0)
			f:Show()
		end)
		
			ArchaeologyFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			ArchaeologyFrameHelpPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameHelpPageTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameHelpPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameHelpPageDigTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameHelpPageDigTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameHelpPageDigTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1,1,1,1)
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameSummaryPageTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameSummaryPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitleMid:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitleMid:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPageTitleMid:SetShadowColor(0,0,0,0)
			nothingcompleted=select(1,ArchaeologyFrameCompletedPage:GetRegions())
			nothingcompleted:SetFont(unpack(miirgui.medium))
			nothingcompleted:SetTextColor(1,1,1,1)
			nothingcompleted:SetShadowColor(0,0,0,0)
			for i= 1, 12 do
				DiggingRace= _G["ArchaeologyFrameSummaryPageRace"..i]
				DiggingRaceProgress = select(1,DiggingRace:GetRegions())
				DiggingRaceProgress:SetTextColor(1,1,1,1)	
				DiggingRaceProgress:SetFont(unpack(miirgui.medium))
				DiggingRaceProgress:SetShadowColor(0,0,0,0)	
			end
			ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageHistoryTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameArtifactPageHistoryTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1,1,1,1)	
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitleTop:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitleTop:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPageTitleTop:SetShadowColor(0,0,0,0)
			for i= 1,12 do
				ArtifactNumber= _G["ArchaeologyFrameCompletedPageArtifact"..i]
				ArtifactBg=select(2,ArtifactNumber:GetRegions())
				ArtifactBg:Hide()
				ArtifactName=select(4,ArtifactNumber:GetRegions())
				ArtifactName:SetTextColor(1,1,1,1)	
				ArtifactName:SetFont(unpack(miirgui.medium))
				ArtifactName:SetShadowColor(0,0,0,0)
				ArtifactSubText=select(5,ArtifactNumber:GetRegions())
				ArtifactSubText:SetTextColor(1,1,1,1)
				ArtifactSubText:SetFont(unpack(miirgui.small))
				ArtifactSubText:SetShadowColor(0,0,0,0)
			end
			ArchaeologyFrameCompletedPagePageText:SetTextColor(1,1,1,1)	
			ArchaeologyFrameCompletedPagePageText:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPagePageText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameRankBarBar:SetVertexColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageArtifactName:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageArtifactName:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameArtifactPageArtifactName:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageArtifactSubText:SetTextColor(1,1,1,1)
			ArchaeologyFrameArtifactPageArtifactSubText:SetFont(unpack(miirgui.small))
			ArchaeologyFrameArtifactPageArtifactSubText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPagePageText:SetTextColor(1,1,1,1)
			ArchaeologyFrameSummaryPagePageText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPagePageText:SetFont(unpack(miirgui.small))
			ArchaeologyFrameArtifactPageRaceBG:SetDesaturated(0)

			hooksecurefunc("ArchaeologyFrame_CurrentArtifactUpdate", function(self)
			ArchaeologyFrameArtifactPageRaceBG:SetDesaturated(0)
			end)
			
		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);