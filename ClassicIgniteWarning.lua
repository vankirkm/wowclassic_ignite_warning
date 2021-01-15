local ClassicIgniteWarning = {}
ClassicIgniteWarning = LibStub("AceAddon-3.0"):NewAddon("ClassicIgniteWarning", "AceConsole-3.0", "AceComm-3.0", "AceEvent-3.0")
_G["ClassicIgniteWarning"] = CIW
defaultConfig = {}

-------------------------------------
--            VARIABLES            --
-------------------------------------



-------------------------------------
--            FUNCTIONS            --
-------------------------------------

function ClassicIgniteWarning:MakeFrame()
    local f = CreateFrame("Frame", nil, UIParent)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetPoint("CENTER", UIParent, "CENTER")
    f:SetBackdrop({
        bgFile = defaultTexture, tile = true, tileSize = 20,
        edgeFile = defaultTexture, edgeSize = 32,
        insets = { left = 10, right = 10, top = 10, bottom = 10 }
    })
    f:SetBackdropColor(0.8,0.8,0.8,1)
	f:SetBackdropBorderColor(0.8,0.8,0.8,1)
	f:Show()
end

function ClassicIgniteWarning:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	print("getting mages in group...")
	ClassicIgniteWarning:MakeFrame()
end

function ClassicIgniteWarning:OnEnable()
    -- Called when the addon is enabled
end

function ClassicIgniteWarning:OnDisable()
    -- Called when the addon is disabled
end



function ClassicIgniteWarning:UNIT_THREAT_LIST_UPDATE(event, unitTarget)
	-- now handle it!
	print("there was a threat update")
end


function ClassicIgniteWarning:getMages()
    print("getting mages in group...")
end

function OnChatEvent(self, event, ... )
    local args = { ... }

    local localizedClass, englishClass, localizedRace, englishRace, sex, name, realm = GetPlayerInfoByGUID(args[12]) 

-- Deal with PlayerInfo as needed

end

ClassicIgniteWarning:RegisterEvent("UNIT_THREAT_LIST_UPDATE")


SLASH_IW_SLASHCMD1 = "/iw"
SLASH_IW_SLASHCMD2 = "/ignitewarning"
SlashCmdList["IW_SLASHCMD"] = function(arg)
	arg = arg:lower()

	if arg == "toggle" then
		ClassicIgniteWarningGUI:ToggleGUI()
	else
		print("To toggle Classic Ignite Warning on or off, type /iw toggle")
	end
end