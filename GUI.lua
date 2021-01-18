local GUI = {}
_G["ClassicIgniteWarningGUI"] = GUI

local cfg = _G.defaultConfig
print(cfg.backdrop)
-------------------------------------
--            VARIABLES            --
-------------------------------------
local isShown = true

local AceGUI = LibStub("AceGUI-3.0")

local playerName = UnitName("player")
local defaultTexture = "CIW Default"

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



-----------------------------------
--         FRAME FUNCTIONS       -- 
-----------------------------------

--create frame
function GUI:MakeFrame()
    f = CreateFrame("Frame", "CIWMain", UIParent)
    f:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
    f:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
    f:SetBackdrop(backdrop)
	f:SetBackdropColor(1, 1, 1, 0.1)
	f:SetBackdropBorderColor(0, 0, 0, 1)
    f:SetResizable("true")

    -----resize button settings-----
    f.resize = CreateFrame("Frame", "Resize", f)
	f.resize:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f.resize:SetSize(12, 12)
	f.resizeTexture = f.resize:CreateTexture()
	f.resizeTexture:SetTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]])
	f.resizeTexture:SetDesaturated(true)
	f.resizeTexture:SetPoint("TOPLEFT", f.resize)
    f.resizeTexture:SetPoint("BOTTOMRIGHT", f.resize, "BOTTOMRIGHT", 0, 0)
    f.resize:SetScript("OnMouseDown", function(self, button)
        f:StartSizing("BOTTOMRIGHT")
        f:SetUserPlaced(true)
    end)

    f.resize:SetScript("OnMouseUp", function(self, button)
        f:StopMovingOrSizing()
    end)

    -----header settings-----
    f.header = CreateFrame("StatusBar", nil, f)
    f.headerTexture = f.header:CreateTexture()
    f.header:SetMinMaxValues(100, 100)
    f.header:SetSize(f:GetWidth() , 100)
    f.headerTexture:SetTexture([[Interface\ChatFrame\ChatFrameBackground]])
    f.header:SetPoint("TOPLEFT", f)
    f.headerTexture:SetPoint("TOPLEFT", f.header)
    f.headerTexture:SetSize(f:GetWidth() , 20)
    f.header:SetStatusBarColor(0, 0, 0, 0.8)
    f:Show()
end

function GUI:ToggleGUI()
    if not isShown then
        f:Show()
        isShown = true
    else
        f:Hide()
        print("Classic Ignite Warning GUI has been toggled off")
        isShown = false
    end
end