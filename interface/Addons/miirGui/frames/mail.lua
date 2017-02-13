	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	local frame = CreateFrame("FRAME");
	frame:RegisterEvent("ITEM_TEXT_READY")
	f:SetScript("OnEvent", function()

		InboxFrameBg:Hide()
		ItemTextFrameIcon = select(18,ItemTextFrame:GetRegions())
		ItemTextFrameIcon:SetPoint("Topleft",-8,9)
		ItemTextFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		ItemTextFrameIcon:SetWidth(64)
		ItemTextFrameIcon:SetHeight(64)
		m_border(ItemTextFrame,330,364,"Center",0,-27,14,"MEDIUM")
		function frame:OnEvent(event)
			if ( event == "ITEM_TEXT_READY" ) then
				ItemTextPageText:SetTextColor(1,1,1,1)
				ItemTextPageText:SetFont(unpack(miirgui.medium))
				ItemTextPageText:SetShadowColor(0,0,0,0)
				ItemTextMaterialTopLeft:Hide()
				ItemTextMaterialTopRight:Hide()
				ItemTextMaterialBotLeft:Hide()
				ItemTextMaterialBotRight:Hide()
				ItemTextScrollFrameMiddle:Hide()
			end
		end
		for i=24,25 do
			hideit= select(i,OpenMailFrame:GetRegions() )
			hideit:Hide() 
		end

		for i=4,7 do
			hideit= select(i,SendMailFrame:GetRegions() )
			hideit:Hide() 
		end

		OpenMailFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		OpenMailBodyText:SetTextColor(1,1,1,1)
		OpenMailBodyText:SetShadowColor(0,0,0,0)
		OpenMailBodyText:SetFont(unpack(miirgui.medium))
		OpenStationeryBackgroundLeft:Hide()
		OpenStationeryBackgroundRight:Hide()
		OpenMailInvoiceItemLabel:SetTextColor(1,1,1,1)
		OpenMailInvoiceItemLabel:SetShadowColor(0,0,0,0)
		OpenMailInvoiceItemLabel:SetFont(unpack(miirgui.medium))
		OpenMailInvoicePurchaser:SetTextColor(1,1,1,1)
		OpenMailInvoicePurchaser:SetShadowColor(0,0,0,0)
		OpenMailInvoicePurchaser:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceSalePrice:SetTextColor(1,1,1,1)
		OpenMailInvoiceSalePrice:SetShadowColor(0,0,0,0)
		OpenMailInvoiceSalePrice:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceBuyMode:SetTextColor(1,1,1,1)
		OpenMailInvoiceBuyMode:SetShadowColor(0,0,0,0)
		OpenMailInvoiceBuyMode:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceAmountReceived:SetTextColor(1,1,1,1)
		OpenMailInvoiceAmountReceived:SetShadowColor(0,0,0,0)
		OpenMailInvoiceAmountReceived:SetFont(unpack(miirgui.medium))
		SendMailBodyEditBox:SetFont(unpack(miirgui.medium))
		SendMailBodyEditBox:SetTextColor(1,1,1,1)
		SendMailBodyEditBox:SetShadowColor(0,0,0,0)
		OpenMailInvoiceDeposit:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceDeposit:SetTextColor(1,1,1,1)
		OpenMailInvoiceDeposit:SetShadowColor(0,0,0,0)
		OpenMailInvoiceHouseCut:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceHouseCut:SetTextColor(1,1,1,1)
		OpenMailInvoiceHouseCut:SetShadowColor(0,0,0,0)
		InvoiceTextFontNormal:SetFont(unpack(miirgui.medium))
		InvoiceTextFontNormal:SetTextColor(1,1,1,1)
		InvoiceTextFontNormal:SetShadowColor(0,0,0,0)
		SendStationeryBackgroundLeft:Hide()
		SendStationeryBackgroundRight:Hide()
		SendMailMoneyInset:Hide()
		MailFrameIcon = select(18,MailFrame:GetRegions())
		MailFrameIcon:SetPoint("Topleft",-8,9)
		MailFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		MailFrameIcon:SetWidth(64)
		MailFrameIcon:SetHeight(64)
		for i=1,7 do
			MailItem1Horizontal = select(3,_G["MailItem"..i]:GetRegions())
			MailItem1Horizontal:SetTexture(0.129,0.113,0.129,1)
		end
		m_border(SendMailFrame,330,322,"Center",-24,18,14,"MEDIUM")
		m_border(InboxFrame,330,364,"Center",-24,18,14,"MEDIUM")
		m_border(OpenMailFrameInset,330,320,"TOPLEFT",0,0,14,"MEDIUM")
		frame:SetScript("OnEvent", frame.OnEvent);
		
		hooksecurefunc("OpenMailFrame_UpdateButtonPositions",function()		
			for i=1,16 do
				local attachmentButton = _G["OpenMailAttachmentButton"..i];
				local itemLink = GetInboxItemLink(InboxFrame.openMailID, i);
				if itemLink then
					rarity=select(3,GetItemInfo(itemLink))
					r, g, b, hex = GetItemQualityColor(rarity)
					attachmentButton.IconBorder:Show()
					attachmentButton.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
					attachmentButton.IconBorder:SetVertexColor(r, g, b, hex)
				end
			end
		end)

	
	end)

