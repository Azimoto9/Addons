		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_ItemAlterationUI" then

			TransmogrifyArtFrameCornerTL:Hide()
			TransmogrifyArtFrameCornerTR:Hide()
			TransmogrifyArtFrameCornerBL:Hide()
			TransmogrifyArtFrameCornerBR:Hide()
			TransmogrifyArtFrameLeftEdge:Hide()
			TransmogrifyArtFrameRightEdge:Hide()
			TransmogrifyArtFrameTopEdge:Hide()
			TransmogrifyArtFrameBottomEdge:Hide()
			TransmogrifyFrameHeadSlotGrabber:Hide()
			TransmogrifyFrameShoulderSlotGrabber:Hide()
			TransmogrifyFrameBackSlotGrabber:Hide()
			TransmogrifyFrameChestSlotGrabber:Hide()
			TransmogrifyFrameWristSlotGrabber:Hide()
			TransmogrifyFrameMainHandSlotGrabber:Hide()
			TransmogrifyFrameSecondaryHandSlotGrabber:Hide()
			TransmogrifyFrameHandsSlotGrabber:Hide()
			TransmogrifyFrameWaistSlotGrabber:Hide()
			TransmogrifyFrameLegsSlotGrabber:Hide()
			TransmogrifyFrameFeetSlotGrabber:Hide()
			TransmogrifyArtFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			TransmogrifyModelFrameFix1 = select(2,TransmogrifyModelFrame:GetRegions())
			TransmogrifyModelFrameFix1:SetTexture(0,0,0,0)
			TransmogrifyModelFrameFix2 = select(1,TransmogrifyFrameButtonFrame:GetRegions())
			TransmogrifyModelFrameFix2:SetTexture(0,0,0,0)
			TranmogrifyArtFrameFix1 = select(23,TransmogrifyArtFrame:GetRegions())
			TranmogrifyArtFrameFix1:SetTexture(0,0,0,0)
			local c = CreateFrame("Frame",miirgui_TransmogrifyBackground,TransmogrifyFrame)
			c:SetFrameStrata("Low")
			local ct = c:CreateTexture(nil,"BACKGROUND")
			ct:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			ct:SetAllPoints(c)
			c.texture = ct
			c:SetPoint("Topleft",0,0)
			c:SetPoint("Bottomright",0,0)
			c:Show()

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);