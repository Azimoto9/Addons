		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI" then

			local function miirgui_InspectPaperDollItemSlotButton_Update(button)
				headquality= select(5,InspectHeadSlot:GetRegions() )
				headquality:SetTexture("Interface\\Containerframe\\quality.blp")
				neckquality= select(5,InspectNeckSlot:GetRegions() )
				neckquality:SetTexture("Interface\\Containerframe\\quality.blp")
				shoulderquality= select(5,InspectShoulderSlot:GetRegions() )
				shoulderquality:SetTexture("Interface\\Containerframe\\quality.blp")
				backquality= select(5,InspectBackSlot:GetRegions() )
				backquality:SetTexture("Interface\\Containerframe\\quality.blp")
				chestquality= select(5,InspectChestSlot:GetRegions() )
				chestquality:SetTexture("Interface\\Containerframe\\quality.blp")
				shirtquality= select(5,InspectShirtSlot:GetRegions() )
				shirtquality:SetTexture("Interface\\Containerframe\\quality.blp")
				tabardquality= select(5,InspectTabardSlot:GetRegions() )
				tabardquality:SetTexture("Interface\\Containerframe\\quality.blp")
				wristquality= select(5,InspectWristSlot:GetRegions() )
				wristquality:SetTexture("Interface\\Containerframe\\quality.blp")
				handquality= select(5,InspectHandsSlot:GetRegions() )
				handquality:SetTexture("Interface\\Containerframe\\quality.blp")
				waistquality= select(5,InspectWaistSlot:GetRegions() )
				waistquality:SetTexture("Interface\\Containerframe\\quality.blp")
				legquality= select(5,InspectLegsSlot:GetRegions() )
				legquality:SetTexture("Interface\\Containerframe\\quality.blp")
				feetquality= select(5,InspectFeetSlot:GetRegions() )
				feetquality:SetTexture("Interface\\Containerframe\\quality.blp")
				finger0quality= select(5,InspectFinger0Slot:GetRegions() )
				finger0quality:SetTexture("Interface\\Containerframe\\quality.blp")
				finger1quality= select(5,InspectFinger1Slot:GetRegions() )
				finger1quality:SetTexture("Interface\\Containerframe\\quality.blp")
				trinket0quality= select(5,InspectTrinket0Slot:GetRegions() )
				trinket0quality:SetTexture("Interface\\Containerframe\\quality.blp")
				trinket1quality= select(5,InspectTrinket1Slot:GetRegions() )
				trinket1quality:SetTexture("Interface\\Containerframe\\quality.blp")
				mainhandquality= select(5,InspectMainHandSlot:GetRegions() )
				mainhandquality:SetTexture("Interface\\Containerframe\\quality.blp")
				offhandquality= select(5,InspectSecondaryHandSlot:GetRegions() )
				offhandquality:SetTexture("Interface\\Containerframe\\quality.blp")
			end

			hooksecurefunc("InspectPaperDollItemSlotButton_Update",miirgui_InspectPaperDollItemSlotButton_Update)

			InspectFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			SpecializationRing:Hide()
			SpecializationSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			for i=1,6 do
				_G["InspectGlyphsGlyph"..i.."Ring"]:Hide()
				_G["InspectGlyphsGlyph"..i.."Glyph"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			end
			InspectGuildFrameBG:Hide()
			m_border(InspectGlyphsGlyph1,48,48,"Center",0,0,14,"Medium")	
			m_border(InspectGlyphsGlyph5,48,48,"Center",0,0,14,"Medium")	
			m_border(InspectGlyphsGlyph3,48,48,"Center",0,0,14,"Medium")	
			m_border(InspectGlyphsGlyph2,64,64,"Center",0,0,14,"Medium")
			m_border(InspectGlyphsGlyph4,64,64,"Center",0,0,14,"Medium")
			m_border(InspectGlyphsGlyph6,64,64,"Center",0,0,14,"Medium")	
			m_border(Specialization,76,76,"TOPLEFT",16,-14,14,"Medium")
			m_border(InspectGuildFrame,330,340,"LEFT",4,-18,14,"Medium")	

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);