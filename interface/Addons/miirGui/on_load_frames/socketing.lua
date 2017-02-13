		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_ItemSocketingUI" then
		
			for i=19,27 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			for i=36,37 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			for i=46,51 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			for i=40,50 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			ItemSocketingFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			m_border(ItemSocketingFrameInset,304,276,"TopLeft",12,-12,12,"MEDIUM")

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);