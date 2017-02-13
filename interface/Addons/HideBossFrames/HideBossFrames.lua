-- HideBossFrames by Arnialys

local function hideBossFrames()
	for i = 1, MAX_BOSS_FRAMES do
		local frame = _G["Boss"..i.."TargetFrame"]
		frame:UnregisterAllEvents()
		frame:Hide()
		frame.Show = function() return end
		_G["Boss"..i.."TargetFrame".."HealthBar"]:UnregisterAllEvents()
		_G["Boss"..i.."TargetFrame".."ManaBar"]:UnregisterAllEvents()
	end
end
-- Call the hide function
hideBossFrames()