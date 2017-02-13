	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()

		bonusobj= select(4,ObjectiveTrackerBlocksFrame:GetChildren() )
		bonusobj2=select(2,bonusobj:GetRegions())
		bonusobj2:SetTextColor(1,1,1,1)
		bonusobj2:SetFont(unpack(miirgui.medium))
		bonusobj2:SetShadowColor(0,0,0,0)
		WatchFrameTitle= select(2,ObjectiveTrackerBlocksFrame.QuestHeader:GetRegions())
		WatchFrameTitle:SetTextColor(1, 1, 1,1)
		WatchFrameTitle:SetShadowColor(0,0,0,0)
		WatchFrameTitle:SetFont(unpack(miirgui.medium))
		ACHFrameTitle= select(2,ObjectiveTrackerBlocksFrame.AchievementHeader:GetRegions())
		ACHFrameTitle:SetTextColor(1, 1, 1,1)
		ACHFrameTitle:SetShadowColor(0,0,0,0)
		ACHFrameTitle:SetFont(unpack(miirgui.medium))
		ScenFrameTitle= select(2,ObjectiveTrackerBlocksFrame.ScenarioHeader:GetRegions())
		ScenFrameTitle:SetTextColor(1, 1, 1,1)
		ScenFrameTitle:SetShadowColor(0,0,0,0)
		ScenFrameTitle:SetFont(unpack(miirgui.medium))

		local function miirgui_SetStringText(_,fontString, text, useFullHeight, colorStyle, useHighlight)
			local r, g, b = fontString:GetTextColor()
			r = floor(r * 255 ) 
			g = floor(g * 255 ) 
			b = floor(b * 255 ) 
			if r == 190 then
					fontString:SetTextColor(unpack(miirgui.Color))
					fontString:SetFont(unpack(miirgui.medium))
					fontString:SetShadowColor(0,0,0,0)
			elseif r == 203 then
					fontString:SetTextColor(1,1,1,1)
					fontString:SetFont(unpack(miirgui.medium))
					fontString:SetShadowColor(0,0,0,0)
			elseif r == 152 then
					fontString:SetTextColor(0, 1, 0.5, 1)
					fontString:SetFont(unpack(miirgui.medium))
					fontString:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE,"SetStringText", miirgui_SetStringText)

		local function miirgui_OnBlockHeaderEnter(self,block)
			if ( block.HeaderText ) then
				block.HeaderText:SetTextColor(unpack(miirgui.Color.Highlight));
				for objectiveKey, line in pairs(block.lines) do
					whitepls = line.Text:GetTextColor()
						whitepls = floor(whitepls * 255 ) 
							if ( line.Dash ) then
								line.Dash:SetTextColor(1,1,1,1);
								r, g, b, a = line.Dash:GetTextColor()
							end
				end
			end
		end

		hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE,"OnBlockHeaderEnter",miirgui_OnBlockHeaderEnter)

		local function miirgui_OnBlockHeaderLeave(self,block)
			if ( block.HeaderText ) then
						block.HeaderText:SetTextColor(unpack(miirgui.Color));
			end
			for objectiveKey, line in pairs(block.lines) do
				local colorStyle = line.Text.colorStyle.reverse;
				if ( colorStyle ) then
					line.Text:SetTextColor(1,1,1,1);
					if ( line.Dash ) then
						line.Dash:SetTextColor(1,1,1,1);
					end
				else
				end
			end	
		end

		hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE,"OnBlockHeaderLeave",miirgui_OnBlockHeaderLeave)

		local function miirgui_ObjectiveTracker_Collapse()
			ObjectiveTrackerFrame.HeaderMenu.Title:SetTextColor(1, 1, 1,1)
			ObjectiveTrackerFrame.HeaderMenu.Title:SetShadowColor(0,0,0,0)
			ObjectiveTrackerFrame.HeaderMenu.Title:SetFont(unpack(miirgui.medium))
		end

		hooksecurefunc("ObjectiveTracker_Collapse",miirgui_ObjectiveTracker_Collapse)
		
		local dig = CreateFrame("Frame", "miirgui_dig_bg")
		dig:SetFrameStrata("HIGH")
		dig:SetSize(192,22)
		dig:SetBackdrop({
		bgFile = "",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 12,insets = { left = 2, right = 2, top =2, bottom = 2 }})
		dig:SetBackdropBorderColor(1, 1, 1,1)
	
		hooksecurefunc("BonusObjectiveTrackerProgressBar_SetValue",function(self, percent)
		self.Bar.Icon:SetMask("")
		self.Bar.BarFrame:Hide()
		
		dig:SetParent(self.Bar)	
		dig:SetPoint("CENTER",0,0)
		dig:SetFrameStrata("HIGH")
		dig:Show()	
				
		end)
	end)