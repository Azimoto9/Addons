	local f = CreateFrame("Frame");
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:SetScript("OnEvent", function()
		
		--Code to support Classic Quest log

		local classicquest = IsAddOnLoaded("Classic Quest Log")

		local classicquest2 = IsAddOnLoaded("ClassicQuestLog") -- name may varie

		if classicquest == true or classicquest2 == true then
			Portrait= select(18,ClassicQuestLog:GetRegions() )
			Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			Portrait:SetPoint("Topleft",-8,10)
				
			Bg= select(19,ClassicQuestLog:GetRegions() )
			Bg:Hide() 
			
			Bg2= select(20,ClassicQuestLog:GetRegions() )
			Bg2:Hide() 
			
			m_border(ClassicQuestLog,660,416,"Center",-1,-17,14,"MEDIUM")
		end

		--Code to support Clique

		hooksecurefunc("ToggleSpellBook", function(bookType)
			if (CliqueSpellTab) then
				CliqueIcon = select(6,CliqueSpellTab:GetRegions())
				CliqueIcon:SetTexCoord(0.13, 0.83, 0.13, 0.83)
				CliqueConfigPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			end
		end)

		--Code to support Combuctor

		local combuctor = IsAddOnLoaded("Combuctor")

		if combuctor == true  then
			CombuctorFrameinventoryPortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				hideit=select(i,CombuctorFrameinventory:GetRegions())
				hideit:Hide()
			end
		end

		--Code to support Inventorian
		
		local invent = IsAddOnLoaded("Inventorian")

		if invent == true  then
			InventorianBagFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			InventorianBankFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				hideit=select(i,InventorianBagFrame:GetRegions())
				hideit:Hide()
				hideitalso=select(i,InventorianBankFrame:GetRegions())
				hideitalso:Hide()
			end
		end
		
	end)