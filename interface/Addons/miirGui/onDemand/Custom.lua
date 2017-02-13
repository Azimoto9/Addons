local addonsToSkin = {
["Rematch"] = function()

	RematchPetCard.Title.TitleBG:Hide()
	RematchPetCard.Front.Bottom.AbilitiesBG:Hide()
	RematchPetCard.Back.Bottom.BottomBG:Hide()
	RematchPetCard.Back.Middle.LoreBG:Hide()
	
	RematchPetListScrollBarBG:Hide()
	RematchQueueListScrollBarBG:Hide()
	RematchOptionListScrollBarBG:Hide()
	RematchLoadedTeamPanel.InsetBack:Hide()
	RematchTeamListScrollBarBG:Hide()
	
	m_border(RematchLoadedTeamPanel,282,26,"TOP",0,0,14,"HIGH")
	m_border(m_border_RematchLoadedTeamPanel,282,134,"BOTTOM",0,-134,14,"HIGH")
	m_border(m_border_m_border_RematchLoadedTeamPanel,282,134,"BOTTOM",0,-134,14,"HIGH")
	m_border(m_border_m_border_m_border_RematchLoadedTeamPanel,282,134,"BOTTOM",0,-136,14,"HIGH")

	hooksecurefunc(RematchLoadoutPanel,"UpdateLoadouts",function()
		local panel = RematchLoadoutPanel
			for i=1,3 do
				local button = panel.Loadouts[i]
				button.InsetBack:Hide()
			end
	end)
	
	m_border(RematchQueuePanel,282,26,"TOP",0,0,14,"HIGH")
	m_border(RematchQueueListScrollFrame,0,0,"CENTER",0,0	,14,"HIGH")
	m_border_RematchQueueListScrollFrame:SetPoint("TOPLEFT","RematchQueueListScrollFrame",-5,6)
	m_border_RematchQueueListScrollFrame:SetPoint("BOTTOMRIGHT","RematchQueueListScrollFrame",7,-6)
	m_border(RematchQueueListScrollFrame,282,31,"TOP",0,1,14,"HIGH")	
	
	m_border(RematchTeamListScrollFrame,0,0,"CENTER",0,0	,14,"HIGH")
	m_border_RematchTeamListScrollFrame:SetPoint("TOPLEFT","RematchTeamListScrollFrame",-5,6)
	m_border_RematchTeamListScrollFrame:SetPoint("BOTTOMRIGHT","RematchTeamListScrollFrame",7,-6)
	m_border(RematchTeamPanel,282,31,"TOP",0,1,14,"HIGH")	
	
	m_border(RematchPetListScrollFrame,0,0,"CENTER",0,0	,14,"HIGH")
	m_border_RematchPetListScrollFrame:SetPoint("TOPLEFT","RematchPetListScrollFrame",-5,6)
	m_border_RematchPetListScrollFrame:SetPoint("BOTTOMRIGHT","RematchPetListScrollFrame",7,-6)
	m_border(RematchPetPanel,282,31,"TOP",0,1,14,"HIGH")	
	
	RematchTeamPanel.Top.Team.Faceplate:Hide()
	RematchTeamPanel.Top.Team.Backplate:Hide()
	m_border(RematchTeamPanel.Top.Team,160,38,"LEFT",0,0,14,"HIGH")
	RematchTeamPanel.Top.Team:SetBackdropBorderColor(1,1,1,0)
	RematchTeamPanel.Top.Team:SetBackdropColor(1,1,1,0)
	
	RematchQueuePanel.Top.LevelingSlot.Faceplate:Hide()
	RematchQueuePanel.Top.LevelingSlot.Backplate:Hide()
	m_border(RematchQueuePanel.Top.LevelingSlot,220,38,"CENTER",0,0,14,"HIGH")
	RematchQueuePanel.Top.LevelingSlot:SetBackdropBorderColor(1,1,1,0)
	RematchQueuePanel.Top.LevelingSlot:SetBackdropColor(1,1,1,0)
	
	hooksecurefunc(RematchQueuePanel,"UpdateList",function()
		for i=1,13 do
			local button = _G["RematchQueueListScrollFrameButton"..i]
			button.Pet.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
			button.Pet.IconBorder:SetTexCoord(0,1,0,1)	
			button.Faceplate:Hide()
			button.Backplate:Hide()
			m_border(button,200,38,"CENTER",0,0,14,"HIGH")
			button:SetBackdropBorderColor(1,1,1,0)
			button:SetBackdropColor(1,1,1,0)	
			button:SetScript("OnEnter",function(self)
				_G["m_border_"..self:GetName()]:SetBackdrop({
					bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
					edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
					edgeSize = 14, 
					insets = { left = 4, right = 4, top = 4, bottom = 4 }});
				_G["m_border_"..self:GetName()]:SetBackdropColor(1,1,1,0.2)
			end)		
			button:SetScript("OnLeave",function(self)
				_G["m_border_"..self:GetName()]:SetBackdropColor(1,1,1,0)
			end)				
			button:HookScript("OnClick",function()
				RematchPetPanel.Selected:SetParent(button)
				RematchPetPanel.Selected:SetAllPoints(true)
				RematchPetPanel.Selected:Show()
			end)
		end
	end)
		
	hooksecurefunc(RematchTeamPanel,"UpdateLoadedTeam",function()
		local settings = RematchSettings
		if settings.ShowLoadedTeam and settings.loadedTeam then
			m_border_RematchTeamPanel:SetHeight(90)
		else
			m_border_RematchTeamPanel:SetHeight(31)
		end
	end)
	
	hooksecurefunc(RematchPetPanel,"UpdateTypeBar",function()	
		if not RematchSettings.UseTypeBar then
			m_border_RematchPetPanel:SetHeight(31)
		else
			m_border_RematchPetPanel:SetHeight(90)
		end
	end)

	hooksecurefunc(RematchQueuePanel,"UpdateTop",function()
		local settings = RematchSettings
		if settings.ShowLevelingSlot  then
			m_border_RematchQueuePanel:SetHeight(90)
		else
			m_border_RematchQueuePanel:SetHeight(31)
		end
	end)
	
	hooksecurefunc(RematchTeamTabs,"TabButtonUpdate",function(panel,index)
		local settings = RematchSettings
		local rematch = Rematch
		local selected = panel:GetSelectedTab()
		local numGroups = #settings.TeamGroups
		local searchText = rematch.TeamPanel:GetTeamSearchInfo()
		if index>0 and index<=numGroups then
			local button = panel:GetTabButton(index)
			if index==selected and not searchText then
				button.Background:SetTexCoord(0,1,0,1)			
				button.Background:SetTexture("Interface\\Containerframe\\quality")
				button.Background:ClearAllPoints()
				button.Background:SetPoint("CENTER",button.Icon,0,0)
				button.Background:SetSize(38,38)
				button.Background:SetVertexColor(miirguiDB.color.r,miirguiDB.color.g,miirguiDB.color.b,1)
				button.Icon:SetPoint("CENTER",0,0)
			else
				button.Background:SetTexCoord(0,1,0,1)	
				button.Background:SetTexture("Interface\\Containerframe\\quality")
				button.Background:ClearAllPoints()
				button.Background:SetPoint("CENTER",button.Icon,0,0)
				button.Background:SetSize(38,38)
				button.Background:SetVertexColor(0.5,0.5,0.5,1)	
				button.Icon:SetPoint("CENTER",0,0)
				button.Icon:SetDesaturated(true)
			end
			button:Show()
		elseif index==(numGroups+1) and index<=16 then
			local button = panel:GetTabButton(index)	
			button.Background:SetTexCoord(0,1,0,1)	
			button.Background:SetTexture("Interface\\Containerframe\\quality")
			button.Background:ClearAllPoints()
			button.Background:SetPoint("CENTER",button.Icon,0,0)
			button.Background:SetSize(38,38)
			button.Background:SetVertexColor(0.5,0.5,0.5,1)	
			button.Icon:SetPoint("CENTER",0,0)
			button.Icon:SetTexture("Interface\\Icons\\Achievement_Guild_DoctorIsIn")
			button:Show()
		end
	end)

	hooksecurefunc(RematchTeamPanel,"UpdateList",function()
		for i =1,13 do
			local button = _G["RematchTeamListScrollFrameButton"..i]
			button.Faceplate:Hide()
			button.Backplate:Hide()
			m_border(button,160,38,"RIGHT",0,0,14,"HIGH")
			button:SetBackdropBorderColor(1,1,1,0)
			button:SetBackdropColor(1,1,1,0)
			button:SetScript("OnEnter",function(self)
				_G["m_border_"..self:GetName()]:SetBackdrop({
					bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
					edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
					edgeSize = 14, 
					insets = { left = 4, right = 4, top = 4, bottom = 4 }});
				_G["m_border_"..self:GetName()]:SetBackdropColor(1,1,1,0.2)
			end)		
			button:SetScript("OnLeave",function(self)
				_G["m_border_"..self:GetName()]:SetBackdropColor(1,1,1,0)
			end)				
			button:HookScript("OnClick",function()
				RematchPetPanel.Selected:SetParent(button)
				RematchPetPanel.Selected:SetAllPoints(true)
				RematchPetPanel.Selected:Show()
			end)
		end
	end)
	
	local function rematch_list()
		for i =1,13 do
			local button = _G["RematchPetListScrollFrameButton"..i]
			button.Faceplate:Hide()
			button.Backplate:Hide()
			button.Pet.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
			button.Pet.IconBorder:SetTexCoord(0,1,0,1)
			m_border(button,200,42,"RIGHT",0,0,14,"HIGH")
			button:SetBackdropBorderColor(1,1,1,0)
			button:SetBackdropColor(1,1,1,0)
			button:SetScript("OnEnter",function(self)
				_G["m_border_"..self:GetName()]:SetBackdrop({
					bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
					edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
					edgeSize = 14, 
					insets = { left = 4, right = 4, top = 4, bottom = 4 }});
				_G["m_border_"..self:GetName()]:SetBackdropColor(1,1,1,0.2)
			end)		
			button:SetScript("OnLeave",function(self)
				_G["m_border_"..self:GetName()]:SetBackdropColor(1,1,1,0)
			end)				
			button:HookScript("OnClick",function()
				RematchPetPanel.Selected:SetParent(button)
				RematchPetPanel.Selected:SetAllPoints(true)
				RematchPetPanel.Selected:Show()
			end)
		end
	end

	hooksecurefunc(RematchPetPanel,"Update",rematch_list)
	hooksecurefunc(RematchPetPanel,"UpdateList",rematch_list)	
	
		end,
	["SimBuilder"] = function()
	SimBuilderLaunchButton:ClearAllPoints()
	SimBuilderLaunchButton:SetPoint("LEFT",CharacterFrameCloseButton,-40,0)
	
	SimItemCompareFrameTitleBG:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble")
	SimItemCompareFrameDialogBG:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
	SimItemCompareFrameTopRight:Hide()
	SimItemCompareFrameTopLeft:Hide()
	SimItemCompareFrameBottomRight:Hide()
	SimItemCompareFrameBottomLeft:Hide()
	SimItemCompareFrameLeft:Hide()
	SimItemCompareFrameRight:Hide()
	SimItemCompareFrameTop:Hide()
	SimItemCompareFrameBottom:Hide()
	SimItemCompareFrameTitleBG:ClearAllPoints()
	SimItemCompareFrameTitleBG:SetPoint("TOP",SimItemCompareFrame,0,-7)
	SimItemCompareFrameTitleBG:SetSize(586,16)
	m_border(SimItemCompareFrame,590,394,"Center",0.5,-8,12,"HIGH")
	m_border(SimItemCompareFrameClose,591,20,"RIGHT",-6,1,14,"HIGH")
	
	SimItemCopyFrameTitleBG:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble")
	SimItemCopyFrameDialogBG:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
	SimItemCopyFrameTopRight:Hide()
	SimItemCopyFrameTopLeft:Hide()
	SimItemCopyFrameBottomRight:Hide()
	SimItemCopyFrameBottomLeft:Hide()
	SimItemCopyFrameLeft:Hide()
	SimItemCopyFrameRight:Hide()
	SimItemCopyFrameTop:Hide()
	SimItemCopyFrameBottom:Hide()
	SimItemCopyFrameTitleBG:ClearAllPoints()
	SimItemCopyFrameTitleBG:SetPoint("TOP",SimItemCopyFrame,0,-7)
	SimItemCopyFrameTitleBG:SetSize(586,16)
	m_border(SimItemCopyFrame,590,170,"Center",0.5,-8.5,12,"HIGH")
	m_border(SimItemCopyFrameClose,591,20,"RIGHT",-6,1,14,"HIGH")
	
		end,
	["BugSack"] = function()
	
	hooksecurefunc(BugSack,"OpenSack",function()	
		local _,title= BugSackFrame:GetChildren()
		m_border(title,460,20,"LEFT",-4,0,14,"TOOLTIP")
		m_border(BugSackFrame,508,318,"Center",0,0,14,"BACKGROUND")

		for i=1,10 do 
		local bg = select(i,BugSackFrame:GetRegions())
		bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
		end
	end)
	
		end,
	["AckisRecipeList"] = function()
	
		hooksecurefunc(_G.AckisRecipeList,"Scan",function()
			ARL_ProfessionButtonPortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		end)
		
		end,
	["BetterArchaeologyUI"] = function()
	
			ArchaeologyFrameSummaryPage:HookScript("OnShow",function()
				for i=1,18 do
					local race = _G["ArchaeologyFrameSummaryPageRace"..i]
					if race then 
						m_fontify(race.raceName,"white")
					end
				end

			end)
			
			ArchaeologyFrameFuturePage:HookScript("OnShow",function()
			
			local futureartifacts = 	ArchaeologyFrameFuturePage:GetRegions()
			m_fontify(futureartifacts,"color")
			m_fontify(ArchaeologyFrameFuturePage.pageText,"white")
				for i=1,12 do
					m_fontify(_G["ArchaeologyFrameFuturePageArtifact"..i.."ArtifactName"],"white")
					m_fontify(_G["ArchaeologyFrameFuturePageArtifact"..i.."ArtifactSubText"],"white")
				end
			
			end)
			
		end,
	["Classic Quest Log"] = function()
	
			m_icon(ClassicQuestLog, "quest", -8, 9, "MEDIUM")
			ClassicQuestLogScrollFrame.BG:Hide()
			ClassicQuestLogDetailScrollFrame.DetailBG:Hide()
			m_border(ClassicQuestLog,0,0,"CENTER",0,0,14,"HIGH")		
			m_border_ClassicQuestLog:SetPoint("TOPLEFT","ClassicQuestLog",2,-58)
			m_border_ClassicQuestLog:SetPoint("BOTTOMRIGHT","ClassicQuestLog",-4,24)
			
			local function miirgui_cql_obj(_,self)
			if self:GetName() == "ClassicQuestLogDetailScrollChildFrame" then		
				local _,_,_,_,QuestInfoRewardsFramewilllearn = QuestInfoRewardsFrame:GetRegions()
				if QuestInfoRewardsFramewilllearn ~= nil then
					m_fontify(QuestInfoRewardsFramewilllearn,"white")
				end	
			end
			end
			
			hooksecurefunc("QuestInfo_Display", miirgui_cql_obj)	
				
			local function miirgui_cql_show()
					m_fontify(QuestInfoTitleHeader,"color")
					m_fontify(QuestInfoDescriptionHeader,"color")
					m_fontify(QuestInfoObjectivesHeader,"color")
					m_fontify(QuestInfoDescriptionText,"white")
					m_fontify(QuestInfoObjectivesText,"white")
					m_fontify(QuestInfoGroupSize,"white")
					m_fontify(QuestInfoRewardText,"white")
			end
			
			ClassicQuestLog:HookScript("OnShow",miirgui_cql_show)
			
		end,
	["Clique"] = function()
	
			hooksecurefunc("ToggleSpellBook",function()
				if (CliqueSpellTab) then
					local _,_,_,_,_,CliqueIcon = CliqueSpellTab:GetRegions()
					CliqueIcon:SetTexCoord(0.13, 0.83, 0.13, 0.83)
					CliqueConfigPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				end
			end)
			
		end,
	["Combuctor"] = function()
	
			CombuctorFrameinventoryPortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				local hideit=select(i,CombuctorFrameinventory:GetRegions())
				hideit:Hide()
			end
			
		end,
	["Inventorian"] = function()
	
			InventorianBagFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			InventorianBankFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				local hideit=select(i,InventorianBagFrame:GetRegions())
				hideit:Hide()
				local hideitalso=select(i,InventorianBankFrame:GetRegions())
				hideitalso:Hide()
			end
			
		end,
	["mOnArs_WardrobeHelper"] = function()
	
			mOnWD_MainFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			
		end,
}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(_, event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		if event == "ADDON_LOADED" then	
			if addonsToSkin[addon] then
				addonsToSkin[addon]()
				addonsToSkin[addon] = nil	
			end
		else	
			for addon, func in pairs(addonsToSkin) do
				if IsAddOnLoaded(addon) then
					func()
				end
			end
		end
	end
	end)