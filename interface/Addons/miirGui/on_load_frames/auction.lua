		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes
		
		function frame:OnEvent(event, arg1)
		
		if event == "ADDON_LOADED" and arg1 == "Blizzard_AuctionUI" then

			local function miirgui_AuctionFrameAuctions_Update()
				local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame);
				local index;
				for i=1, NUM_AUCTIONS_TO_DISPLAY do
					index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameAuctions.page);
					auction = _G["AuctionsButton"..i];
					buttonName = "AuctionsButton"..i;
					button = _G[buttonName];
					local itemButton = _G[buttonName.."Item"];
					if (quality) then
						itemButton.IconBorder:Hide();
					else
						itemButton.IconBorder:Hide();
					end
					for i=1,9 do
						_G["AuctionsButton"..i.."Middle"] = select (4, _G["AuctionsButton"..i]:GetRegions())
						_G["AuctionsButton"..i.."Middle"]:SetHeight(36)
						_G["AuctionsButton"..i.."Left"]:SetHeight(36)
						_G["AuctionsButton"..i.."Left"]:ClearAllPoints()
						_G["AuctionsButton"..i.."Left"]:SetPoint("Left",34,3.5)
						_G["AuctionsButton"..i.."Right"]:SetHeight(36)
						_G["AuctionsButton"..i.."Right"]:ClearAllPoints()
						_G["AuctionsButton"..i.."Right"]:SetPoint("Right",0,3.5)
						_G["AuctionsButton"..i.."Highlight"]:ClearAllPoints()
						_G["AuctionsButton"..i.."Highlight"]:SetPoint("Topleft",35,2)
						_G["AuctionsButton"..i.."Highlight"]:SetHeight(34)
						_G["AuctionsButton"..i.."ItemCount"]:ClearAllPoints()
						_G["AuctionsButton"..i.."ItemCount"]:SetPoint("Center", 0, -7)
					end
				end
			end

			hooksecurefunc("AuctionFrameAuctions_Update",miirgui_AuctionFrameAuctions_Update)

			local function miirgui_AuctionFrameBid_Update()
				local button, buttonName;
				local index;
					for i=1, 9 do
						button = _G["BidButton"..i];
						buttonName = "BidButton"..i;
						local itemButton = _G[buttonName.."Item"];
						itemButton.IconBorder:Hide();
					end
					for i=1,9 do
						_G["BidButton"..i.."Middle"] = select (6, _G["BidButton"..i]:GetRegions())
						_G["BidButton"..i.."Middle"]:SetHeight(36)
						_G["BidButton"..i.."Left"]:SetHeight(36)
						_G["BidButton"..i.."Left"]:ClearAllPoints()
						_G["BidButton"..i.."Left"]:SetPoint("Left",34,3.5)
						_G["BidButton"..i.."Right"]:SetHeight(36)
						_G["BidButton"..i.."Right"]:ClearAllPoints()
						_G["BidButton"..i.."Right"]:SetPoint("Right",0,3.5)
						_G["BidButton"..i.."Highlight"]:ClearAllPoints()
						_G["BidButton"..i.."Highlight"]:SetPoint("Topleft",35,2)
						_G["BidButton"..i.."Highlight"]:SetHeight(34)
						_G["BidButton"..i.."ItemCount"]:ClearAllPoints()
						_G["BidButton"..i.."ItemCount"]:SetPoint("Center", 0, -7)
				end
			end

			hooksecurefunc("AuctionFrameBid_Update",miirgui_AuctionFrameBid_Update)

			local function miirgui_AuctionFrameBrowse_Update()
				for i = 1,8 do
					QualityTexture= select(4,_G["BrowseButton"..i.."Item"]:GetRegions() )
					QualityTexture:SetAlpha(0)
					_G["BrowseButton"..i.."Middle"] = select (5, _G["BrowseButton"..i]:GetRegions())
					_G["BrowseButton"..i.."Middle"]:SetHeight(36)
					_G["BrowseButton"..i.."Left"]:SetHeight(36)
					_G["BrowseButton"..i.."Left"]:ClearAllPoints()
					_G["BrowseButton"..i.."Left"]:SetPoint("Left",34,3.5)
					_G["BrowseButton"..i.."Right"]:SetHeight(36)
					_G["BrowseButton"..i.."Right"]:ClearAllPoints()
					_G["BrowseButton"..i.."Right"]:SetPoint("Right",0,3.5)
					_G["BrowseButton"..i.."Highlight"]:ClearAllPoints()
					_G["BrowseButton"..i.."Highlight"]:SetPoint("Topleft",35,2)
					_G["BrowseButton"..i.."Highlight"]:SetHeight(34)
					_G["BrowseButton"..i.."ItemCount"]:ClearAllPoints()
					_G["BrowseButton"..i.."ItemCount"]:SetPoint("Center", 0, -7)
				end
			end

			hooksecurefunc("AuctionFrameBrowse_Update",miirgui_AuctionFrameBrowse_Update)

			WowTokenGameTimeTutorial.LeftDisplay.Label:SetTextColor(unpack(miirgui.Color))
			WowTokenGameTimeTutorial.LeftDisplay.Label:SetFont(unpack(miirgui.huge))
			WowTokenGameTimeTutorial.LeftDisplay.Label:SetShadowColor(0,0,0,0)
			
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial1:SetTextColor(1, 1, 1,1)
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial1:SetFont(unpack(miirgui.medium))
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial1:SetShadowColor(0,0,0,0)
			
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial2:SetTextColor(1, 1, 1,1)
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial2:SetFont(unpack(miirgui.medium))
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial2:SetShadowColor(0,0,0,0)
			
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial3:SetTextColor(1, 1, 1,1)
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial3:SetFont(unpack(miirgui.medium))
			WowTokenGameTimeTutorial.LeftDisplay.Tutorial3:SetShadowColor(0,0,0,0)
			
			WowTokenGameTimeTutorial.RightDisplay.Label:SetTextColor(unpack(miirgui.Color))
			WowTokenGameTimeTutorial.RightDisplay.Label:SetFont(unpack(miirgui.huge))
			WowTokenGameTimeTutorial.RightDisplay.Label:SetShadowColor(0,0,0,0)
			
			WowTokenGameTimeTutorial.RightDisplay.Tutorial1:SetTextColor(1, 1, 1,1)
			WowTokenGameTimeTutorial.RightDisplay.Tutorial1:SetFont(unpack(miirgui.medium))
			WowTokenGameTimeTutorial.RightDisplay.Tutorial1:SetShadowColor(0,0,0,0)	
			
			WowTokenGameTimeTutorial.RightDisplay.Tutorial2:SetTextColor(1, 1, 1,1)
			WowTokenGameTimeTutorial.RightDisplay.Tutorial2:SetFont(unpack(miirgui.medium))
			WowTokenGameTimeTutorial.RightDisplay.Tutorial2:SetShadowColor(0,0,0,0)		
			
			WowTokenGameTimeTutorial.RightDisplay.Tutorial3:SetTextColor(1, 1, 1,1)
			WowTokenGameTimeTutorial.RightDisplay.Tutorial3:SetFont(unpack(miirgui.medium))
			WowTokenGameTimeTutorial.RightDisplay.Tutorial3:SetShadowColor(0,0,0,0)	
		
		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);