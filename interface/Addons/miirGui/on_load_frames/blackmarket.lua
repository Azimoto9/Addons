		--[[Registering Events]]

	local frame = CreateFrame("FRAME");
	frame:RegisterEvent("ADDON_LOADED")

		--Applying changes
		
	function frame:OnEvent(event, arg1)
		
		if event == "ADDON_LOADED" and arg1 == "Blizzard_BlackMarketUI" then
		
			Top= select(11,BlackMarketFrame:GetRegions() )
			Top:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
			title= select(22,BlackMarketFrame:GetRegions() )
			title:Hide()
			BlackMarketScrollFrameScrollBarTrack:Hide()
			
			hideit= select(9,BlackMarketFrame:GetChildren() )
			for i=12,21 do
				hideit= select(i,BlackMarketFrame:GetRegions() )
				hideit:Hide()
			end
			
			hideit= select(9,BlackMarketFrame:GetChildren() )
			for i=1,8 do 
				hideit2 = select(i,hideit:GetRegions() )
				hideit2:Hide()
			end
			
			m_border(BlackMarketFrame,612,412,"Center",-116,-21,14,"MEDIUM")

			local function miirgui_BlackMarketScrollFrame_Update()
				local numItems = C_BlackMarket.GetNumItems();	
				local scrollFrame = BlackMarketScrollFrame;
				local offset = HybridScrollFrame_GetOffset(scrollFrame);
				local buttons = scrollFrame.buttons;
				local numButtons = #buttons;
					for i = 1, numButtons do
						local button = buttons[i];
						local index = offset + i; -- adjust index
						
						if ( index <= numItems ) then
							quality = select(17,C_BlackMarket.GetItemInfoByIndex(index))
							if quality then
								button.Item.IconBorder:Hide()
								button.Item:ClearAllPoints()
								button.Item:SetPoint("Left", _G["BlackMarketScrollFrameButton"..i], "Left", 0,2)
								button.Item.IconTexture:SetTexCoord(0.15, 0.85, 0.15, 0.85)
							end
						end
						fixitleft= select(1,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
						fixitleft:ClearAllPoints()
						fixitleft:SetPoint("Left",38,3.5)
						fixitleft:SetHeight(36)	
						
						fixitright= select(2,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
						fixitright:SetHeight(37)
						fixitright:ClearAllPoints()
						fixitright:SetPoint("Right",0,3.5)
						
						fixitmiddle= select(3,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
						fixitmiddle:ClearAllPoints()
						fixitmiddle:SetPoint("Left",40,3.5)
						fixitmiddle:SetSize(520,37)
						
						selection =_G["BlackMarketScrollFrameButton"..i]
						fixselection=select(9,selection:GetRegions())
						fixselection:ClearAllPoints()
						fixselection:SetPoint("CENTER",18.5,2.5)
						fixselection:SetSize(529.5,34)
						
						
						
						highlight= select(10,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
						highlight:ClearAllPoints()
						highlight:SetTexture(fixselection:GetTexture())
						highlight:SetPoint("CENTER",18,-10)
						highlight:SetSize(529.5,60)

						
					end
			end

			hooksecurefunc("BlackMarketScrollFrame_Update",miirgui_BlackMarketScrollFrame_Update)
				
			hooksecurefunc("BlackMarketFrame_UpdateHotItem",function(self)
				if quality then
					self.HotDeal.Item.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
					self.HotDeal.Item.IconBorder:SetSize(32,32)
				end
			end)	
		end
	end

	frame:SetScript("OnEvent", frame.OnEvent);