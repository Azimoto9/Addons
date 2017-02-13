local function skin_Blizzard_LookingForGuildUI()
	if event == "ADDON_LOADED" and arg1 == "Blizzard_LookingForGuildUI" then
		LookingForGuildFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
	end
end

local catchaddon = CreateFrame("FRAME")
catchaddon:RegisterEvent("ADDON_LOADED")

--function to catch loading addons
local function skinnedOnLoad(_, _, addon)
	if addon == "Blizzard_LookingForGuildUI" then
		skin_Blizzard_LookingForGuildUI()
	end	
end

--this function decides whether the addon is already loaded or if we need to look out for it!

local function skinnedOnLogin()
	if IsAddOnLoaded("Blizzard_LookingForGuildUI") then
		-- Addon is already loaded, procceed to skin!
		skin_Blizzard_LookingForGuildUI()
	else
		-- Addon is not loaded yet, procceed to look out for it!
		catchaddon:SetScript("OnEvent", skinnedOnLoad)
	end
end

local HelloWorld = CreateFrame("FRAME")
HelloWorld:RegisterEvent("PLAYER_ENTERING_WORLD")
HelloWorld:SetScript("OnEvent", skinnedOnLogin)