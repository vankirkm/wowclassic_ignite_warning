ClassicIgniteWarning = LibStub("AceAddon-3.0"):NewAddon("ClassicIgniteWarning", "AceConsole-3.0")


-------------------------------------
--            VARIABLES            --
-------------------------------------



-------------------------------------
--            FUNCTIONS            --
-------------------------------------

function ClassicIgniteWarning:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	print("getting mages in group...")
end

function ClassicIgniteWarning:OnEnable()
    -- Called when the addon is enabled
end

function ClassicIgniteWarning:OnDisable()
    -- Called when the addon is disabled
end




function ClassicIgniteWarning:getMages()
    print("getting mages in group...")
end

function OnChatEvent(self, event, ... )
    local args = { ... }

    local localizedClass, englishClass, localizedRace, englishRace, sex, name, realm = GetPlayerInfoByGUID(args[12]) 

-- Deal with PlayerInfo as needed

end

SLASH_IW_SLASHCMD1 = "/iw"
SLASH_IW_SLASHCMD2 = "/ignitewarning"
SlashCmdList["IW_SLASHCMD"] = function(arg)
	arg = arg:lower()

	if arg == "toggle" then
		print("Wow Classic Ignite Warning has been toggled on")
	end
end