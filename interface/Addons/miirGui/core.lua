local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()	
	-- This table defines the addon's default settings:
	
	local defaults = {
		["color"] =
			{
				r=0.08,
				g=0.342,
				b=0.52,
				hr=0.086,
				hg=0.459,
				hb=0.71,
				enable=false,
			},
		["blue"] = true,
		["grey"] = false,
		["savemode"] = false,
		["alerpos"]= 
				{
					x = 0,
					y = 0,
					enable = false,
				},
		["skinminimap"] = false,
		["cbar"] = false,
		["testmode"]=false,
	}

	-- This function copies values from one table into another:
	local function copyDefaults(src, dst)
		-- If no source (defaults) is specified, return an empty table:
		if type(src) ~= "table" then return {} end
		-- If no target (saved variable) is specified, create a new table:
		if type(dst) ~= "table" then dst = { } end
		-- Loop through the source (defaults):
		for k, v in pairs(src) do
			-- If the value is a sub-table:
			if type(v) == "table" then
				-- Recursively call the function:
				dst[k] = copyDefaults(v, dst[k])
			-- Or if the default value type doesn't match the existing value type:
			elseif type(v) ~= type(dst[k]) then
				-- Overwrite the existing value with the default one:
				dst[k] = v
			end
		end
		-- Return the destination table:
		return dst
	end

	-- Copy the values from the defaults table into the saved variables table
	-- if it exists, and assign the result to the saved variable:
	
	miirguiDB = copyDefaults(defaults, miirguiDB)
		
	miirgui ={}
	
	--[[		
		--miirguiDB.color.r,miirguiDB.color.g,miirguiDB.color.b,1 = {0.118,0.278,0.157,1}
		--miirguiDB.color.hr,miirguiDB.color.hg,miirguiDB.color.hb,1t = {0.29, 0.65, 0.388,1}		
	]]
end)