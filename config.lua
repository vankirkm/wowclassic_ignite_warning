-----------------------------
-- Default Config
-----------------------------
local defaultTexture = "CIW Default"
local defaultFont = "NotoSans SemiCondensedBold"

_G.defaultConfig = {}
-- general
defaultConfig.general = {
	welcome				= true,									-- display welcome message
	updateFreq			= 0.2,									-- how often the threat bars update
	rawPercent			= false,								-- use raw percent
	downscaleThreat		= true,									-- downscale threat so 1 damage = 1 threat
	minimap				= false,								-- toggle for minimap icon
	ignorePets			= false,								-- toggle for ignoring pets
	hideOOC				= false,								-- hide frame when out of combat
	hideSolo			= false,								-- hide frame when not in a group
	hideOpenWorld		= false,								-- hide frame when not in an instance
	hideInPVP			= true,									-- hide frame when in battlegrounds
	hideAlways			= false,								-- hide frame always
}

-- frame settings
defaultConfig.frame = {
	test				= false,								-- toggle for test mode
	scale				= 1,									-- global scale
	width				= 217,									-- frame width
	height				= 161,									-- frame height
	locked				= false,								-- toggle for movable
	strata				= "3-MEDIUM",							-- frame strata
	position			= {"TOPLEFT", "UIParent", "TOPLEFT", 50, -200},	-- frame position
	color				= {0, 0, 0, 0.35},						-- frame background color
	headerShow			= true,									-- show frame header
	headerColor			= {0, 0, 0, 0.8},						-- frame header color
}

-- backdrop settings
defaultConfig.backdrop = {
	bgTexture			= defaultTexture,						-- backdrop texture
	bgColor				= {1, 1, 1, 0.1},						-- backdrop color
	edgeTexture			= defaultTexture,						-- backdrop edge texture
	edgeColor			= {0, 0, 0, 1},							-- backdrop edge color
	tile				= false,								-- backdrop texture tiling
	tileSize			= 0,									-- backdrop tile size
	edgeSize			= 1,									-- backdrop edge size
	inset				= 0,									-- backdrop inset value
}

