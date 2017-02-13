		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_QuestChoice" then

			-- Hides the unnecessary textures by assigning a background texture
				
			local choiceBG= CreateFrame("Frame","miirgui_QuestChoiceFrame",QuestChoiceFrame)
			choiceBG:SetFrameStrata("BACKGROUND")
			choiceBG:SetWidth(600) 
			choiceBG:SetHeight(520)
			local choiceBGtexture = choiceBG:CreateTexture(nil,"BACKGROUND")
			choiceBGtexture:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
			choiceBGtexture:SetAllPoints(choiceBG)
			choiceBG.texture = choiceBGtexture
			choiceBG:SetPoint("Center",0,0)
			choiceBG:Show()
				
			for i=1,19 do 
			hideit = select(i,QuestChoiceFrame:GetRegions())
			hideit:SetAlpha(0)
			end

			background = select(15,QuestChoiceFrame:GetRegions())
			background:Hide()

			-- Changes the color and look of the mission TEXT

			missiontext= select(20,QuestChoiceFrame:GetRegions())
			missiontext:SetTextColor(unpack(miirgui.Color))
			missiontext:SetFont(unpack(miirgui.huge))
			missiontext:SetShadowColor(0,0,0,0)

			-- Changes the look of the description-TEXT each option has

			hooksecurefunc("QuestChoiceFrame_Update",function()
				option1text= select(1,QuestChoiceFrameOption1.OptionText:GetRegions())
				option1text:SetTextColor(1,1,1,1)
				option1text:SetFont(unpack(miirgui.medium))
				option1text:SetShadowColor(0,0,0,0)

				option2text= select(1,QuestChoiceFrameOption2.OptionText:GetRegions())
				option2text:SetTextColor(1,1,1,1)
				option2text:SetFont(unpack(miirgui.medium))
				option2text:SetShadowColor(0,0,0,0)
			end)

			-- Adds borders to the frame


			m_border(QuestChoiceFrame,602,522,"Center",0,0,14,"HIGH")

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);