wowclassic_ignite_warning = { }


-------------------------------------
--            VARIABLES            --
-------------------------------------

local _G		= _G
local select	= _G.select
local unpack	= _G.unpack
local type		= _G.type
local floor		= _G.math.floor
local min		= _G.math.min
local strbyte	= _G.string.byte
local format	= _G.string.format
local strlen	= _G.string.len
local strsub	= _G.string.sub
local strmatch	= _G.string.match

local pairs		= _G.pairs
local tinsert	= _G.table.insert
local sort		= _G.table.sort
local wipe		= _G.table.wipe 

local GetTime				= _G.GetTime
local GetNumGroupMembers	= _G.GetNumGroupMembers
local GetNumSubgroupMembers	= _G.GetNumSubgroupMembers
local GetInstanceInfo		= _G.GetInstanceInfo
local IsInRaid				= _G.IsInRaid
local UnitAffectingCombat	= _G.UnitAffectingCombat
local UnitClass				= _G.UnitClass
local UnitExists			= _G.UnitExists
local UnitIsFriend			= _G.UnitIsFriend
local UnitCanAssist			= _G.UnitCanAssist
local UnitIsPlayer			= _G.UnitIsPlayer
local UnitName				= _G.UnitName
local UnitReaction			= _G.UnitReaction
local UnitIsUnit 			= _G.UnitIsUnit
local FindAuraByName		= AuraUtil.FindAuraByName

local screenWidth			= floor(GetScreenWidth())
local screenHeight			= floor(GetScreenHeight())




-------------------------------------
--            FUNCTIONS            --
-------------------------------------

function wowclassic_ignite_warning:getMages()
    message("Getting mages in group...")
end

function OnChatEvent(self, event, ... )
    local args = { ... }

    local localizedClass, englishClass, localizedRace, englishRace, sex, name, realm = GetPlayerInfoByGUID(args[12]) 

-- Deal with PlayerInfo as needed

end

local function CreateBackdrop(parent, cfg)
	local f = CreateFrame("Frame", nil, parent)
	f:SetPoint("TOPLEFT", parent, "TOPLEFT", -cfg.inset, cfg.inset)
	f:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", cfg.inset, -cfg.inset)
	-- Backdrop Settings
	local backdrop = {
		bgFile = LSM:Fetch("statusbar", cfg.bgTexture),
		edgeFile = LSM:Fetch("statusbar", cfg.edgeTexture),
		tile = cfg.tile,
		tileSize = cfg.tileSize,
		edgeSize = cfg.edgeSize,
		insets = {
			left = cfg.inset,
			right = cfg.inset,
			top = cfg.inset,
			bottom = cfg.inset,
		},
	}
	f:SetBackdrop(backdrop)
	f:SetBackdropColor(unpack(cfg.bgColor))
	f:SetBackdropBorderColor(unpack(cfg.edgeColor))

	parent.backdrop = f
end



wowclassic_ignite_warning:getMages()
wowclassic_ignite_warning:CreateBackdrop()

SLASH_IW_SLASHCMD1 = "/iw"
SLASH_IW_SLASHCMD2 = "/ignitewarning"
SlashCmdList["IW_SLASHCMD"] = function(arg)
	arg = arg:lower()

	if arg == "toggle" then
		print("Wow Classic Ignite Warning has been toggled on")
	end
end