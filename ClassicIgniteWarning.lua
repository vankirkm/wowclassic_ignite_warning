local ClassicIgniteWarning = {}
ClassicIgniteWarning = LibStub("AceAddon-3.0"):NewAddon("ClassicIgniteWarning", "AceConsole-3.0", "AceComm-3.0", "AceEvent-3.0")
_G["ClassicIgniteWarning"] = CIW
local GUI = _G.ClassicIgniteWarningGUI
local cfg = _G.defaultConfig
print(cfg.backdrop)

local LSM = LibStub("LibSharedMedia-3.0")
LSM:Register("statusbar", "CIW Default", [[Interface\ChatFrame\ChatFrameBackground]])
LSM:Register("font", "NotoSans SemiCondensedBold", [[Interface\AddOns\wowclassic_ignite_warning\Fonts\NotoSans-SemiCondensedBold.ttf]])
LSM:Register("font", "Standard Text Font", _G.STANDARD_TEXT_FONT)
-------------------------------------
--            VARIABLES            --
-------------------------------------
local defaultTexture = "CIW Default"
local isShown = true
local defaultFont = "NotoSans SemiCondensedBold"
local playerName = UnitName("player")

--backdrop settings
local backdrop = {
    bgFile = defaultTexture,
	edgeFile = defaultTexture,
    tile = defaultConfig.backdrop.tile,
    tileSize = defaultConfig.backdrop.tileSize,
    edgeSize = defaultConfig.backdrop.edgeSize,
    insets = {
    left = defaultConfig.backdrop.inset,
    right = defaultConfig.backdrop.inset,
    top = defaultConfig.backdrop.inset,
    bottom = defaultConfig.backdrop.inset,},
}

-------------------------------------
--            FUNCTIONS            --
-------------------------------------

function ClassicIgniteWarning:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
    print("getting mages in group...")
    GUI:MakeFrame()
end

function ClassicIgniteWarning:OnEnable()
    -- Called when the addon is enabled
end

function ClassicIgniteWarning:OnDisable()
    -- Called when the addon is disabled
end



function ClassicIgniteWarning:UNIT_THREAT_LIST_UPDATE(event, unitTarget)
	-- now handle it!
	--print("there was a threat update")
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


-----------------------------------
--         FRAME FUNCTIONS       -- 
-----------------------------------

--create frame
function ClassicIgniteWarning:MakeFrame()
    f = CreateFrame("Frame", "CIWMain", UIParent)
    f:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -100, 300)
    f:SetBackdrop(backdrop)
    f:SetSize(200,161)
	f:SetBackdropColor(0, 0, 0, 0.4)
	f:SetBackdropBorderColor(0, 0, 0, 1)
    f:SetResizable("true")
    f:SetMovable("true")
    f:SetClampedToScreen("true")

    -----resize button settings-----
    f.resize = CreateFrame("Frame", nil, f)
	f.resize:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f.resize:SetSize(12, 12)
	f.resizeTexture = f.resize:CreateTexture()
	f.resizeTexture:SetTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]])
	f.resizeTexture:SetDesaturated(true)
	f.resizeTexture:SetPoint("TOPLEFT", f.resize)
    f.resizeTexture:SetPoint("BOTTOMRIGHT", f.resize, "BOTTOMRIGHT", 0, 0)
    f.resize:SetScript("OnMouseDown", function(self, button)
        f:SetMinResize(136, 18)
	    f:SetMaxResize(512, 1024)
	    f:SetScript("OnSizeChanged", UpdateSize)
        f:StartSizing("BOTTOMRIGHT")
        f:SetUserPlaced(true)
    end)

    f.resize:SetScript("OnMouseUp", function(self, button)
        f:StopMovingOrSizing()
    end)

    -----header settings-----
    f.header = CreateFrame("StatusBar", nil, f)
    f.header:SetMinMaxValues(0, 100)
    
	-- Backdrop for header
    CreateBackdrop(f.header)
    f.header:SetSize(cfg.frame.width, 18)
    f.header:SetMovable("true")
    f.header:SetResizable("true")
    f.header:SetClampedToScreen(true)
    f.header:SetStatusBarTexture(defaultTexture)
    f.header:SetPoint("TOPLEFT", f, 0, 0)
    f.header:SetPoint("TOPRIGHT", f, 0, 0)
	f.header:SetStatusBarColor(0, 0, 0, 0.8)
	f.header.backdrop:SetBackdropColor(0, 0, 0, 0)
    f.header.backdrop:SetBackdropBorderColor(0, 0, 0, 0.8)
    f.header:SetScript("OnMouseDown", StartDrag)
    f.header:SetScript("OnMouseUp", StopDrag)

    -----Header Text-----
    f.header.text = f.header:CreateFontString(nil, "OVERLAY")
    f.header.text:SetFont(LSM:Fetch("font", "NotoSans SemiCondensedBold"), 12, "OUTLINE")
    f.header.text:SetText(format("%s%s", "Classic Ignite Warning", ""))
    f.header.text:SetVertexColor(1, 1, 1, 1)
    f.header.text:SetPoint("LEFT", 4, 0)

    f.header:Show()
end

function StartDrag(pframe)
    pframe = pframe:GetParent()
    print("pframe")
    pframe:StartMoving()
end

function StopDrag(pframe)
    pframe = pframe:GetParent()
    pframe:StopMovingOrSizing()
end

function ClassicIgniteWarning:ToggleGUI()
    if not isShown then
        f:Show()
        isShown = true
    else
        f:Hide()
        print("Classic Ignite Warning GUI has been toggled off")
        isShown = false
    end
end

function CreateBackdrop(parent)
	local frame = CreateFrame("Frame", nil, parent)
    frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
    frame:SetBackdrop(backdrop)
	frame:SetBackdropColor(1, 1, 1, 0.08)
	frame:SetBackdropBorderColor(0, 0, 0, 1)
    frame:SetResizable("true")
	parent.backdrop = frame
end

local function UpdateSize(f)
	cfg.frame.width = f:GetWidth() - 2
	cfg.frame.height = f:GetHeight()
end
















SLASH_IW_SLASHCMD1 = "/iw"
SLASH_IW_SLASHCMD2 = "/ignitewarning"
SlashCmdList["IW_SLASHCMD"] = function(arg)
	arg = arg:lower()

	if arg == "toggle" then
		GUI:ToggleGUI()
	else
		print("To toggle Classic Ignite Warning on or off, type /iw toggle")
	end
end