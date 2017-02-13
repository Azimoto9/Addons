local SimplePowerBar = LibStub("AceAddon-3.0"):GetAddon("SimplePowerBar");
local Media = LibStub("LibSharedMedia-3.0")
local mediaWidgets = Media and LibStub("AceGUISharedMediaWidgets-1.0", true)

local FontStyle = {
	NONE = "None",
	OUTLINE = "Outline",
	THICKOUTLINE = "Thick Outline",
	["NONE, MONOCHROME"] = "No Outline, Monochrome",
	["OUTLINE, MONOCHROME"] = "Outline, Monochrome", --Strange errors surrounding this.
	["THICKOUTLINE, MONOCHROME"] = "Thick Outline, Monochrome"
}
local StatusBarOrientation = {
	HORIZONTAL = "Horizontal",
	VERTICAL = "Vertical"
}
local FullAlign = {TOPLEFT = "TOPLEFT",TOP = "TOP",TOPRIGHT = "TOPRIGHT",LEFT = "LEFT",CENTER = "CENTER",RIGHT = "RIGHT",BOTTOMLEFT = "BOTTOMLEFT",BOTTOM = "BOTTOM",BOTTOMRIGHT = "BOTTOMRIGHT"}
local AlignH = {LEFT = "LEFT", CENTER = "CENTER", RIGHT = "RIGHT"}
local AlignV = {BOTTOM = "BOTTOM", CENTER = "CENTER", TOP = "TOP"}
local FrameStratas = {BACKGROUND = "Background",LOW = "Low",MEDIUM = "Medium",HIGH = "High",DIALOG = "Dialog",FULLSCREEN_DIALOG = "Fullscreen Dialog",TOOLTIP = "Tooltip"}
local DisplayModes = {PERCENT = "Percent",NUMERIC = "Numeric",BOTH = "Both"}

local function GetValue(info)
	local db = SimplePowerBar.db.profile
	if type(info.arg) == "table" then
		return db[info.arg[1]][info.arg[2]]
	else
		return db[info.arg]
	end
end

local function SetValue(info,v)
	local db = SimplePowerBar.db.profile
	if type(info.arg) == "table" then
		db[info.arg[1]][info.arg[2]] = v
	else
		db[info.arg] = v
	end
	SimplePowerBar:FullUpdate()
end

local function GetColor(info)
	local db = SimplePowerBar.db.profile
	local color
	if type(info.arg) == "table" then
		color = db[info.arg[1]][info.arg[2]]
	else
		color = db[info.arg]
	end
	return color.r, color.g, color.b, (color.a or 1)
end

local function SetColor(info,r,g,b,a)
	local db = SimplePowerBar.db.profile
	local color
	if type(info.arg) == "table" then
		color = db[info.arg[1]][info.arg[2]]
	else
		color = db[info.arg]
	end
	color.r,color.g,color.b,color.a = r,g,b,a
	SimplePowerBar:FullUpdate()
end

local options = nil;
local function GetOptions()
	local db = SimplePowerBar.db.profile
	if not options then
		options = {
			name = GetAddOnMetadata("SimplePowerBar", "title").." v"..GetAddOnMetadata("SimplePowerBar", "version"),
			handler = SimplePowerBar,
			type = "group",
			childGroups = "tab",
			get = GetValue,
			set = SetValue,
			args = {
				UseBlizz = {
					name = "Use Blizzard Frame",
					type = "toggle",
					order = 1,
					set = SetValue,
					get = GetValue,
					arg = "useBlizz",
				},
				Lock = {
					name = "Lock Position",
					type = "toggle",
					order = 2,
					get = GetValue,
					set = SetValue,
					arg = "locked",
				},
				Test = {
					name = "Test Mode",
					type = "toggle",
					order = 3,
					get = GetValue,
					set = SetValue,
					arg = "test",
				},
				Blizzard = {
					name = "Blizzard Settings",
					type = "group",
					order = 50,
					disabled = function() return not db.useBlizz end,
					args = {
						TextSettings = {
							name = "Text Settings",
							type = "group",
							inline = true,
							order = 1,
							args = {
								Description = {
									name = "Toggling these options will require a /reload to update changes. Or click the button below to use blizzard toggles.",
									type = "description",
									order = 1,
								},
								DisplayText = {
									name = "Display Text",
									type = "select",
									values = DisplayModes,
									order = 2,
									get = function() return GetCVar("alternateResourceText") end,
									set = function(info,v) SetCVar("alternateResourceText",v) end,
								},
								Header1 = {
									name = "",
									type = "header",
									order = 4,
								},
								BlizzardOptions = {
									name = "Status Text Options",
									type = "execute",
									order = 5,
									width = "full",
									func = function()
										InterfaceOptionsFrame_OpenToCategory(_G["InterfaceOptionsStatusTextPanel"])
									end,
								},
							},							
						},
					},
				},
				BarSettings = {
					name = "Bar Settings",
					type = "group",
					order = 10,
					disabled = function() return db.useBlizz end,
					args = {
						Statusbar = {
							name = "Statusbar",
							type = "group",
							inline = true,
							order = 1,
							args = {
								Texture = { 
									name = "Texture",
									type = "select",
									order = 1,							
									dialogControl = mediaWidgets and "LSM30_Statusbar" or nil,
									values = Media:HashTable("statusbar"),
									arg = "StatusTex",
								},
								Orientation = {
									name = "Orientation",
									type = "select",
									order = 1.5,
									values = StatusBarOrientation,
									arg = "Orientation",
								},
								CustomColor = {
									name = "Coloring Method",
									type = "group",
									order = 2,
									inline = true,
									args = {
										Header1 = {
											name = "Color Fadeing",
											type = "header",
											order = 0,
										},
										ColorFade = {
											name = "Color Fade",
											desc = "Transitions the color from green to yellow to red depending on the current value of alternate power. Enabling this will overrule other coloring methods.",
											descStyle = "inline",
											type = "toggle",
											order = 1,
											width = "full",
											arg = "fade",
										},
										MinMaxColors = {
											name = "Low and High Colors",
											type = "group",
											order = 1.1,
											inline = true,
											disabled = function() return not db.fade end,
											args = {
												LowColor = {
													name = "Low Color",
													type = "color",
													desc = "Select the low color.",
													order = 1,
													get = GetColor,
													set = SetColor,
													arg = "StatusLow",
												},
												HighColor = {
													name = "High Color",
													type = "color",
													desc = "Select the high color.",
													order = 2,
													get = GetColor,
													set = SetColor,
													arg = "StatusHigh",
												},
											},
										},
										Header2 = {
											name = "Class Color",
											type = "header",
											order = 2,
										},
										ClassColor = {
											name = "Class Color",
											desc = "Uses your class color. Enabling this will overrule custom coloring and Blizzard coloring.",
											descStyle = "inline",
											disabled = function() 
												return db.fade
											end,
											type = "toggle",
											order = 3,
											width = "full",
											arg = "statusClass",
										},
										Header3 = {
											name = "Blizzard Color",
											type = "header",
											order = 4,
										},
										BlizzColor = {
											name = "Blizzard Color",
											desc = "This uses the default statusbar color of the Blizzard frame. Class color must be disabled to use.",
											descStyle = "inline",
											disabled = function() 
												if db.fade or db.statusClass then 
													return true 
												else 
													return false 
												end
											end,
											type = "toggle",
											order = 5,
											width = "full",
											arg = "statusBlizz",
										},
										Header4 = {
											name = "Custom Color",
											type = "header",
											order = 6,
										},
										Color = {
											name = "Custom Color",
											type = "color",
											desc = "Set the color of your choice for the statusbar. The alpha channel for this color will be used for all other coloring methods.",
											order = 7,
											get = GetColor,
											set = SetColor,
											hasAlpha = true,
											arg = "StatusColor",
										},
										Header5 = {
											name = "Full Bar Color",
											type = "header",
											order = 8,
										},
										FullBarColor = {
											name = "Enable Full Bar Color",
											desc = "This allows you to set a custom color when the bar is full.",
											descStyle = "inline",
											type = "toggle",
											order = 9,
											width = "full",
											arg = "sbMaxEnabled",
										},
										ColorFullBar = {
											name = "Full Bar Color",
											type = "color",
											order = 10,
											get = GetColor,
											set = SetColor,
											arg = {"StatusColor","MaxColor"},
										},
									},
								},
							},
						},
						BG = {
							name = "Background",
							type = "group",
							inline = true,
							order = 3,
							args = {
								Size = {
									name = "Sizing",
									type = "group",
									inline = true,
									order = 1,
									args = {
										Width = {
											name = "Width",
											type = "range",
											order = 1,
											min = 10,
											max = 1200,
											step = 1,
											arg = "width",
										},
										Height = {
											name = "Height",
											type = "range",
											order = 2,
											min = 1,
											max = 1200,
											step = 1,
											arg = "height",
										},
									},
								},
								Texture = {
									name = "Texture Settings",
									type = "group",
									order = 2,
									inline = true,
									args = {
										Texture  = {
											name = "Texture",
											type = "select",
											order = 1,
											dialogControl = mediaWidgets and "LSM30_Background" or nil,
											values = Media:HashTable("background"),
											width = "full",
											get = GetValue,
											set = SetValue,
											arg = "bg",
										},
										Tile = {
											name = "Background Tiling",
											type = "toggle",
											order = 4,
											width = "single",
											get = GetValue,
											set = SetValue,
											arg = "tile",
										},
										TileSize = {
											name = "Tile Size",
											type = "range",
											order = 5,
											disabled = function() return not db.tile end,
											min = 0,
											max = 120,
											step = 0.1,
											get = GetValue,
											set = SetValue,
											arg = "tileSize",
										},
									},
								},
								CustomColor = {
									name = "Coloring Method",
									type = "group",
									order = 3,
									inline = true,
									args = {
										ClassColoring = {
											name = "Class Coloring",
											type = "toggle",
											desc = "Use class coloring for the border. Enabling this will override the custom color.",
											order = 2,
											get = GetValue,
											set = SetValue,
											arg = "backdropClass",
										},
										Color = {
											name = "Color",
											type = "color",
											order = 3,
											disabled = function() return db.backdropClass end,
											width = "double",
											get = GetColor,
											set = SetColor,
											hasAlpha = true,
											arg = "BackgroundColor",
										},
									},
								},
							},
						},
						Border = {
							name = "Border",
							type = "group",
							inline = true,
							order = 2,
							args = {
								Texture = {
									name = "Texture Settings",
									type = "group",
									order = 2,
									inline = true,
									args = {
										Texture = {
											name = "Texture",
											type = "select",
											order = 1,
											dialogControl = mediaWidgets and "LSM30_Border" or nil,
											values = Media:HashTable("border"),
											width = "full",
											get = GetValue,
											set = SetValue,
											arg = "border",
										},
										BorderSize = {
											name = "Border Size",
											type = "range",
											order = 4,
											min = 1,
											max = 64,
											width = "full",
											step = 0.1,
											arg = "borderSize",
										},
										BorderInset = {
											name = "Border Inset",
											type = "range",
											order = 5,
											min = -32,
											max = 32,
											width = "full",
											step = 0.1,
											arg = "borderInset",
										},
									},
								},
								CustomColor = {
									name = "Coloring Method",
									type = "group",
									order = 3,
									inline = true,
									args = {
										ClassColoring = {
											name = "Class Coloring",
											type = "toggle",
											desc = "Use class coloring for the border. Enabling this will override the custom color.",
											order = 2,
											get = GetValue,
											set = SetValue,
											arg = "borderClass",
										},
										Color = {
											name = "Custom Color",
											type = "color",
											order = 3,
											disabled = function()
												return db.borderClass
											end,
											get = GetColor,
											set = SetColor,
											hasAlpha = true,
											arg = "BorderColor",
										},
									},
								},
							},
						},
					},
				},
				PowerText = {
					name = "Power Text",
					type = "group",
					order = 40,
					disabled = function() return db.useBlizz end,
					args = {
						Toggles = {
							name = "Toggles",
							type = "group",
							inline = true,
							order = 1,
							args = {
								Amount = {
									name = "Enable Text",
									type = "toggle",
									order = 1,
									arg = "amount",
								},
								Header1 = {
									name = "",
									type = "header",
									order = 2,
								},
								Level = {
									name = "Show Power Level",
									type = "toggle",
									order = 3,
									arg = "level",									
								},
								Percent = {
									name = "Show Percent",
									type = "toggle",
									order = 4,
									arg = "percent",
								},
							},
						},
						Text = {
							name = "Font Settings",
							type = "group",
							inline = true,
							order = 2,
							disabled = function() return not db.amount end,
							args = {
								Font = {
									name = "Font",
									type = "select",
									order = 1,
									dialogControl = "LSM30_Font",
									values = Media:HashTable("font"),
									width = "full",								
									get = GetValue,
									set = SetValue,
									arg = {"StatusBarText","font"},
								},
								Size = {
									name = "Size",
									type = "range",
									order = 2,									
									min = 4,
									max = 24,
									step = 1,
									arg = {"StatusBarText","size"},
								},
								Style = {
									name = "Style",
									type = "select",
									order = 3,
									values = FontStyle,
									arg = {"StatusBarText","style"},
								},
							},
						},
						Coloring = {
							name = "Coloring Method",
							type = "group",
							order = 3,
							inline = true,
							disabled = function() return not db.amount end,
							args = {
								ClassColor = {
									name = "Class Coloring",
									type = "toggle",
									order = 4,
									get = GetValue,
									set = SetValue,
									arg = {"StatusBarText","colorClass"},
								},
								CustomColor = {
									name = "Custom Color",
									type = "color",
									order = 5,
									get = GetColor,
									set = SetColor,
									disabled = function() if not db.amount then return true else return db.StatusBarText.colorClass end end,
									arg = {"StatusBarText","color"}
								},
							},
						},
						Shadow = {
							name = "Text Shadow",
							type = "group",
							inline = true,
							order = 4,
							disabled = function() return not db.amount end,
							args = {
								ShadowColor = {
									name = "Shadow Color",
									type = "color",
									order = 7,
									get = GetColor,
									set = SetColor,
									hasAlpha = true,
									arg = {"StatusBarText","shadow"},
								},
								ShadowDistance = {
									name = "Shadow Offset",
									type = "range",
									order = 8,
									min = -2,
									max = 2,
									step = 0.01,
									arg = {"StatusBarText","shadowOffset"},
								},
							},
						},
						Placement = {
							name = "Text Placement",
							type = "group",
							order = 5,
							inline = true,
							disabled = function() return not db.amount end,
							args = {
								Alignment = {
									name = "Alignment",
									type = "select",
									
									order = 10,
									values = FullAlign,
									arg = {"StatusBarText","align"},
								},
								Anchor = {
									name = "Anchor",
									type = "select",
									order = 11,
									values = FullAlign,
									arg = {"StatusBarText","anchor"},
								},
								Header3 = {
									name = "",
									type = "header",
									order = 12,
								},
								ofx = {
									name = "Offset X",
									type = "range",
									order = 13,
									min = -120,
									max = 120,
									step = 1,
									arg = {"StatusBarText","ofx"},
								},
								ofy = {
									name = "Offset Y",
									type = "range",
									order = 14,
									min = -120,
									max = 120,
									step = 1,
									arg = {"StatusBarText","ofy"},
								},
							},
						},						
					},
				},
				LabelText = {
					name = "Label Text",
					type = "group",
					order = 30,
					disabled = function() return db.useBlizz end,
					args = {
						Toggles = {
							name = "Toggles",
							type = "group",
							inline = true,
							order = 1,
							args = {
								Label = {
									name = "Show Label",
									type = "toggle",
									order = 1,
									width = "full",
									arg = "label",
								},
							},
						},
						Text = {
							name = "Font Settings",
							type = "group",
							inline = true,
							order = 2,
							disabled = function() return not db.label end,
							args = {
								Font = {
									name = "Font",
									type = "select",
									order = 1,
									dialogControl = "LSM30_Font",
									values = Media:HashTable("font"),
									width = "full",								
									get = GetValue,
									set = SetValue,
									arg = {"LabelText","font"},
								},
								Size = {
									name = "Size",
									type = "range",
									order = 2,									
									min = 4,
									max = 24,
									step = 1,
									arg = {"LabelText","size"},
								},
								Style = {
									name = "Style",
									type = "select",
									order = 3,
									values = FontStyle,
									arg = {"LabelText","style"},
								},
							},
						},
						Coloring = {
							name = "Coloring Method",
							type = "group",
							order = 3,
							inline = true,
							disabled = function() return not db.label end,
							args = {
								ClassColor = {
									name = "Class Coloring",
									type = "toggle",
									order = 4,
									get = GetValue,
									set = SetValue,
									arg = {"LabelText","colorClass"},
								},
								CustomColor = {
									name = "Custom Color",
									type = "color",
									order = 5,
									get = GetColor,
									set = SetColor,
									disabled = function() if not db.label then return true else return db.LabelText.colorClass end end,
									arg = {"LabelText","color"}
								},
							},
						},
						Shadow = {
							name = "Text Shadow",
							type = "group",
							inline = true,
							order = 4,
							disabled = function() return not db.label end,
							args = {
								ShadowColor = {
									name = "Shadow Color",
									type = "color",
									order = 7,
									get = GetColor,
									set = SetColor,
									hasAlpha = true,
									arg = {"LabelText","shadow"},
								},
								ShadowDistance = {
									name = "Shadow Offset",
									type = "range",
									order = 8,
									min = -2,
									max = 2,
									step = 0.01,
									arg = {"LabelText","shadowOffset"},
								},
							},
						},
						Placement = {
							name = "Text Placement",
							type = "group",
							order = 5,
							inline = true,
							disabled = function() return not db.label end,
							args = {
								Alignment = {
									name = "Alignment",
									type = "select",
									
									order = 10,
									values = FullAlign,
									arg = {"LabelText","align"},
								},
								Anchor = {
									name = "Anchor",
									type = "select",
									order = 11,
									values = FullAlign,
									arg = {"LabelText","anchor"},
								},
								Header3 = {
									name = "",
									type = "header",
									order = 12,
								},
								ofx = {
									name = "Offset X",
									type = "range",
									order = 13,
									min = -120,
									max = 120,
									step = 1,
									arg = {"LabelText","ofx"},
								},
								ofy = {
									name = "Offset Y",
									type = "range",
									order = 14,
									min = -120,
									max = 120,
									step = 1,
									arg = {"LabelText","ofy"},
								},
							},
						},
					},
				},
				Placement = {
					name = "Placement",
					type = "group",
					order = 20,
					args = {
						Placement = {
							name = "Placement",
							type = "group",
							inline = true,
							order = 2,
							args = {
								x = {
									name = "X",
									type = "range",
									order = 3,
									min = -1200,
									max = 1200,
									step = 1,
									arg = "x",
								},
								y = {
									name = "Y",
									type = "range",
									order = 4,
									min = -1200,
									max = 1200,
									step = 1,
									arg = "y",
								},
								Header2 = {
									name = "",
									order = 5,
									type = "header",
								},
								FrameStrata = {
									name = "Frame Strata",
									order = 6,
									type = "select",
									values = FrameStratas,
									arg = "frameStrata",
								},
								FrameLevel = {
									name = "Frame Level",
									order = 7,
									type = "range",
									min = 1,
									max = 32,
									step = 1,									
									arg = "frameLevel",
								},
							},
						},
					},
				},
			},
		}
	end
	return options
end

local intoptions = nil;
local function GetIntOptions()
	if not intoptions then
		intoptions = {
			name = GetAddOnMetadata("SimplePowerBar", "title").." v"..GetAddOnMetadata("SimplePowerBar", "version"),
			handler = SimplePowerBar,
			type = "group",
			args = {
				note = {
					type = "description",
					name = "You can access the "..GetAddOnMetadata("SimplePowerBar", "title").." v"..GetAddOnMetadata("SimplePowerBar", "version").." options by typing: /spb",
					order = 10,
				},
				openoptions = {
					type = "execute",
					name = "Open Config",
					width = "full",
					func = function() 
						SimplePowerBar:OpenOptions()
					end,
					order = 20,
				},
			},
		};
	end
	return intoptions;
end

function SimplePowerBar:OpenOptions()
	HideUIPanel(InterfaceOptionsFrame)
	HideUIPanel(GameMenuFrame)
	if not options then SimplePowerBar:SetUpOptions() end
	LibStub("AceConfigDialog-3.0"):Open("SimplePowerBar");
end

function SimplePowerBar:ChatCommand(input)
	SimplePowerBar:OpenOptions();
end

function SimplePowerBar:ConfigRefresh()
	local db = self.db.profile;
	Update()
end

function SimplePowerBar:SetUpInitialOptions()
	-- Chat Command
	--self:RegisterChatCommand("/spb", "ChatCommand");
	
	-- Interface panel options
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("SimplePowerBar Dialog", GetIntOptions);
	
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SimplePowerBar Dialog", "SimplePowerBar");
end

function SimplePowerBar:SetUpOptions()
	local db = self.db.profile;
	
	-- Options Window
	GetOptions();
	
	options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db);
	options.args.profiles.order = 10000;
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("SimplePowerBar", options);
	LibStub("AceConfigDialog-3.0"):SetDefaultSize("SimplePowerBar", 750, 450)
end