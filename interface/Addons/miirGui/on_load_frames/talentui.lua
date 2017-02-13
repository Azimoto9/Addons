		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_TalentUI" then

			for i=1,4 do
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."Ring"]:Hide()
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."SpecIcon"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."SpecIcon"]:SetWidth(42)
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."SpecIcon"]:SetHeight(42)
			end
			for i=1,3 do
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."Ring"]:Hide()
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."SpecIcon"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."SpecIcon"]:SetWidth(42)
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."SpecIcon"]:SetHeight(42)
			end
			PlayerTalentFrameTalents:HookScript("OnShow", function(self, button)
			PlayerTalentFrameTalentsTutorialButton:Hide()	
			end)
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildRing:Hide()
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1Ring:Hide()	
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildRing:Hide()
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1Ring:Hide()	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameTalentsTutorialButton:Hide()
			PlayerTalentFrameSpecializationTutorialButton:Hide()	
			PlayerTalentFramePetSpecializationTutorialButton:Hide()	
			PlayerTalentFramePortrait:SetWidth(64)
			PlayerTalentFramePortrait:SetHeight(64)
			PlayerTalentFramePortrait:SetPoint("Topleft",-8,9)
			PlayerTalentFrameHoritontal = select(13,PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFrameHoritontal:SetTexture(0.78,0.78,0.78,0)
			PlayerTalentFrameTintage = select(1,PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFrameTintage:SetTexture(0,0,0,0)		
			PlayerTalentFramePetHoritontal = select(13,PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFramePetHoritontal:SetTexture(0.78,0.78,0.78,0)
			PlayerTalentFramePetTintage = select(1,PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFramePetTintage:SetTexture(0,0,0,0)	
			PlayerSpecTab1Icon=select(2,PlayerSpecTab1:GetRegions())
			PlayerSpecTab1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerSpecTab2Icon=select(2,PlayerSpecTab2:GetRegions())
			PlayerSpecTab2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			m_border(PlayerTalentFrameSpecializationSpellScrollFrame,414,414,"Center",0,-2,14,"MEDIUM")	
			m_border(PlayerTalentFramePetSpecializationSpellScrollFrame,414,414,"Center",0,-2,14,"MEDIUM")	
			m_border(PlayerTalentFramePetSpecializationSpecButton1,46,46,"Left",14,0,14,"MEDIUM")
			m_border(PlayerTalentFramePetSpecializationSpecButton2,46,46,"Left",14,0,14,"MEDIUM")
			m_border(PlayerTalentFramePetSpecializationSpecButton3,46,46,"Left",14,0,14,"MEDIUM")	
			m_border(PlayerTalentFrameSpecializationSpecButton1,46,46,"Left",14,0,14,"MEDIUM")
			m_border(PlayerTalentFrameSpecializationSpecButton2,46,46,"Left",14,0,14,"MEDIUM")
			m_border(PlayerTalentFrameSpecializationSpecButton3,46,46,"Left",14,0,14,"MEDIUM")	
			m_border(PlayerTalentFrameSpecializationSpellScrollFrameScrollChild,76,76,"TopLeft",16,-14,14,"MEDIUM")		
			m_border(PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1,58,58,"Center",0,0,14,"MEDIUM")	
			m_border(PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild,76,76,"TopLeft",16,-14,14,"MEDIUM")		
			m_border(PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1,58,58,"Center",0,0,14,"MEDIUM")
			m_border(PlayerTalentFrameTalents,640,384,"Center",0,0,14,"Medium")	

			local function miirgui_PlayerTalentFrame_CreateSpecSpellButton(frame, index)
				local scrollChild = frame.spellsScroll.child;
				local name = scrollChild:GetName() .. "Ability" .. index;
				local button = _G[name];
				child1,child2 = _G[name]:GetRegions();
				child1:Hide()
				child2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				m_border(_G[name],58,58,"Center",0,0,14,"MEDIUM")
			end

			hooksecurefunc("PlayerTalentFrame_CreateSpecSpellButton", miirgui_PlayerTalentFrame_CreateSpecSpellButton)

			local function miirgui_PlayerTalentFrame_UpdateSpecFrame(self, spec)
				for i=1,4 do
				_G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility"..i.."SubText"]:SetTextColor(1, 1, 1,1)
				_G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility"..i.."SubText"]:SetShadowColor(0,0,0,0)
				_G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility"..i.."SubText"]:SetFont(unpack(miirgui.small))
				end
			end

			hooksecurefunc("PlayerTalentFrame_UpdateSpecFrame",miirgui_PlayerTalentFrame_UpdateSpecFrame)

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);