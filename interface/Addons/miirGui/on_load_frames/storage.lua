		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_VoidStorageUI" then

			local function miirgui_VoidStorage_ItemsUpdate(doDeposit, doContents)
			local self = VoidStorageFrame;
			local button;
				if ( doContents ) then
					for i = 1, 9 do
						local itemID, textureName, quality = GetVoidTransferWithdrawalInfo(i);
						button = _G["VoidStorageWithdrawButton"..i];
						button.icon:SetTexture(textureName);
						if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
							button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							button.IconBorder:Show();
							button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						end
					end
				end
				if ( doDeposit ) then
					for i = 1, 9 do
						local itemID, textureName, quality = GetVoidTransferDepositInfo(i);
						button = _G["VoidStorageDepositButton"..i];
						button.icon:SetTexture(textureName);
						if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
							button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							button.IconBorder:Show();
							button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						end
					end
				end
				for i = 1, 80 do
					local itemID, textureName, locked, recentDeposit, isFiltered, quality = GetVoidItemInfo(self.page, i);
					button = _G["VoidStorageStorageButton"..i];
					button.icon:SetTexture(textureName);
					if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
						button.IconBorder:Show();
						button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
					end
				end
			end

			hooksecurefunc("VoidStorage_ItemsUpdate", miirgui_VoidStorage_ItemsUpdate)

			VoidStoragePurchaseFrameCornerTL:Hide()
			VoidStoragePurchaseFrameCornerTR:Hide()
			VoidStoragePurchaseFrameCornerBL:Hide()
			VoidStoragePurchaseFrameCornerBR:Hide()
			VoidStoragePurchaseFrameLeftEdge:Hide()
			VoidStoragePurchaseFrameRightEdge:Hide()
			VoidStoragePurchaseFrameTopEdge:Hide()
			VoidStoragePurchaseFrameBottomEdge:Hide()
			arrow= select(12,VoidStorageDepositFrame:GetRegions() )
			arrow:Hide()
			arrow2= select(12,VoidStorageWithdrawFrame:GetRegions() )
			arrow2:Hide()
			VoidStorageBorderFrameLeftEdge:Hide()
			VoidStorageBorderFrameRightEdge:Hide()
			VoidStorageBorderFrameTopEdge:Hide()
			VoidStorageBorderFrameBottomEdge:Hide()
			VoidStorageBorderFrameHeader:Hide()
			VoidStorageBorderFrameCornerTL:Hide()
			VoidStorageBorderFrameCornerTR:Hide()
			VoidStorageBorderFrameCornerBL:Hide()
			VoidStorageBorderFrameCornerBR:Hide()
			VoidStorageDepositFrameBg:Hide()
			VoidStorageWithdrawFrameBg:Hide()
			VoidStorageStorageFrameLine1:Hide()
			VoidStorageStorageFrameLine1:SetWidth(1)
			VoidStorageStorageFrameLine2:Hide()
			VoidStorageStorageFrameLine2:SetWidth(1)
			VoidStorageStorageFrameLine3:Hide()
			VoidStorageStorageFrameLine3:SetWidth(1)
			VoidStorageStorageFrameLine4:Hide()
			VoidStorageStorageFrameLine4:SetWidth(1)
			VoidStoragePurchaseTintage = select (2,VoidStoragePurchaseFrame:GetRegions())
			VoidStoragePurchaseTintage:Hide()
			VoidStorageFrameFix1 = select (2,VoidStorageFrame:GetRegions())
			VoidStorageFrameFix1:SetTexture(1,1,1,0)
			m_border(VoidStoragePurchaseFrame,496,184,"Center",0,0,14,"MEDIUM")
			Portrait1= select(4,VoidStorageFrame.Page1:GetRegions() )
			Portrait1:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			Portrait2= select(4,VoidStorageFrame.Page2:GetRegions() )
			Portrait2:SetTexCoord(0.85, 0.15, 0.15, 0.85)

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);