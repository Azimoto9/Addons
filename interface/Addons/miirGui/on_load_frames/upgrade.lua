		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_ItemUpgradeUI" then

			ItemUpgradeFrameCornerTL:Hide()
			ItemUpgradeFrameCornerTR:Hide()
			ItemUpgradeFrameCornerBL:Hide()
			ItemUpgradeFrameCornerBR:Hide()
			ItemUpgradeFrameLeftEdge:Hide()
			ItemUpgradeFrameRightEdge:Hide()
			ItemUpgradeFrameTopEdge:Hide()
			ItemUpgradeFrameBottomEdge:Hide()
			for i=2,4 do
			hideit= select(i,ItemUpgradeFrame.ItemButton:GetRegions() )
			hideit:Hide() 
			end
			m_border(ItemUpgradeFrame.ItemButton,60,60,"Center",0,0,14,"HIGH")
			m_border(ItemUpgradeFrame.ItemButton,330,60,"Center",196,0,14,"HIGH")
			hideit= select(8,ItemUpgradeFrame.ItemButton:GetRegions() )
			hideit:Hide() 

			local function miirgui_ItemUpgradeFrame_Update()
				local icon, name, quality, bound, numCurrUpgrades, numMaxUpgrades, cost, currencyType = GetItemUpgradeItemInfo();
				if icon then
					showit= select(1,ItemUpgradeFrame.ItemButton:GetRegions() )
					showit:Show() 
				else	
					hideit= select(1,ItemUpgradeFrame.ItemButton:GetRegions() )
					hideit:Hide() 
				end
			end

			hooksecurefunc("ItemUpgradeFrame_Update", miirgui_ItemUpgradeFrame_Update)

			ItemUpgradeFramePortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
			ItemUpgradeFrame.ButtonFrame:GetRegions():Hide()
			ItemUpgradeFrame.ButtonFrame.ButtonBorder:Hide()
			ItemUpgradeFrame.ButtonFrame.ButtonBottomBorder:Hide()
			ItemUpgradeFrameHeaderTintage = select(23,ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameHeaderTintage:SetTexture(0.128,0.117,0.128,1)
			ItemUpgradeFrameBackgroundTintage = select(25, ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameBackgroundTintage:SetTexture(0.078,0.078,0.078,1) 
			ItemUpgradeFrameBackgroundTintage2 = select(27, ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameBackgroundTintage2:SetTexture(0,0,0,0)

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);