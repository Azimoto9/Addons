		--[[Registering Events]]

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ADDON_LOADED")

		--Applying changes

		function frame:OnEvent(event, arg1)

		if event == "ADDON_LOADED" and arg1 == "Blizzard_AchievementUI" then
			for i=1,12 do
				_G["AchievementFrameSummaryCategoriesCategory"..i.."FillBar"]:Hide()
				_G["AchievementFrameSummaryCategoriesCategory"..i.."Bar"]:SetVertexColor(unpack(miirgui.Color))
			end

			local kids = {AchievementFrameComparisonSummaryFriend:GetRegions() };
			for _, child in ipairs(kids) do
				child:Hide()
			end

			local kids = {AchievementFrameComparisonSummaryPlayer:GetRegions() };
			for _, child in ipairs(kids) do
				child:Hide()
			end

			AchievementFrameWoodBorderTopLeft:Hide()
			AchievementFrameWoodBorderTopRight:Hide()
			AchievementFrameWoodBorderBottomLeft:Hide()
			AchievementFrameWoodBorderBottomRight:Hide()
			AchievementFrameWaterMark:Hide()
			AchievementFrameComparisonWatermark:Hide()

			hooksecurefunc("AchievementFrame_ToggleAchievementFrame",function(toggleStatFrame)
			for i=1,8 do
				tint= select(i,AchievementFrameCategories:GetRegions() )
				tint:SetVertexColor(1,1,1,1)
			end
			end)

			AchievementFrameComparisonSummaryPlayerStatusBarFillBar:Hide()
			AchievementFrameComparisonSummaryPlayerStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameComparisonSummaryFriendStatusBarFillBar:Hide()
			AchievementFrameComparisonSummaryFriendStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesStatusBarFillBar:Hide()
			AchievementFrameSummaryCategoriesStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameAchievementsContainerScrollBarBG:Hide()
			AchievementFrameStatsContainerScrollBarBG:Hide()
			AchievementFrameComparisonStatsContainerScrollBarBG:Hide()
			AchievementFrameComparisonDark:SetAlpha(0)
			AchievementFrameCategoriesContainerScrollBarBG:SetAlpha(0)
			AchievementFrameComparisonContainerScrollBarBG:SetAlpha(0)
			m_border(AchievementFrameSummary,530,462,"Center",0,0,14,"HIGH")

			FuglyGreenBorder1 = select(3,AchievementFrameStats:GetChildren())
			FuglyGreenBorder1:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder1:SetBackdropBorderColor(1, 1, 1,1)	

			FuglyGreenBorder2 = select(2,AchievementFrameAchievements:GetChildren())
			FuglyGreenBorder2:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder2:SetBackdropBorderColor(1, 1, 1,1)	

			FuglyGreenBorder3 = select(5,AchievementFrameComparison:GetChildren())
			FuglyGreenBorder3:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder3:SetBackdropBorderColor(1, 1, 1,1)	

			AchievementFrameCategories:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})

		end
		end

		frame:SetScript("OnEvent", frame.OnEvent);