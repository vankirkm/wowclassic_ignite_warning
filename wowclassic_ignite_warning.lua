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

wowclassic_ignite_warning:getMages()