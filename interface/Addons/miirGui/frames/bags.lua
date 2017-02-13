	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		function miirgui_ContainerFrame_Update(frame)
			local id = frame:GetID();
			local name = frame:GetName();
			local itemButton;
			for i=1, frame.size, 1 do
				itemButton = _G[name.."Item"..i];
				--texture, itemCount, locked, quality, readable, _, _, isFiltered, noValue = GetContainerItemInfo(id, itemButton:GetID());
				local quality = select(4,GetContainerItemInfo(id, itemButton:GetID()))
					if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						itemButton.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
						itemButton.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						itemButton.IconBorder:Show();
						itemButton.Count:ClearAllPoints()
						itemButton.Count:SetPoint("Center", 0, -11)
				end
			end
		end

		hooksecurefunc("ContainerFrame_Update",miirgui_ContainerFrame_Update)
		
		function miirgui_BankFrameItemButton_Update(button)		
			local container = button:GetParent():GetID();
			local buttonID = button:GetID();
			if( button.isBag ) then
				container = -4;
			end
			local quality = select(4,GetContainerItemInfo(container, buttonID))
			--local _, _, _, quality, _, _, _, isFiltered = GetContainerItemInfo(container, buttonID);
			if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
				button.IconBorder:Show();
				button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
				button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
				button.Count:ClearAllPoints()
				button.Count:SetPoint("Center", 0, -11)
			else
				button.IconBorder:Hide();
			end
		end
		
		hooksecurefunc("BankFrameItemButton_Update",miirgui_BankFrameItemButton_Update)
		
		BankPortraitTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		BankPortraitTexture:SetPoint("Topleft",-8,9)
		BankPortraitTexture:SetWidth(64)
		BankPortraitTexture:SetHeight(64)	
		BankFrameBg:SetTexture(0.078,0.078,0.078,1)
		
		for i=1,12 do
			_G["ContainerFrame"..i.."Portrait"]:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		end
		
	end)