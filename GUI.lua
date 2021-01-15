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
    bottom = defaultConfig.backdrop.inset,}
}



-----------------------------------
--         FRAME FUNCTIONS       -- 
-----------------------------------

--create frame
function GUI:MakeFrame()
    f = getglobal("MainFrame")
    f:SetResizable("true")
    f.resize = CreateFrame("Frame", "Resize", self.f)
	f.resize:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f.resize:SetSize(12, 12)
	f.resizeTexture = f.resize:CreateTexture()
	f.resizeTexture:SetTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]])
	f.resizeTexture:SetDesaturated(true)
	f.resizeTexture:SetPoint("TOPLEFT", f.resize)
    f.resizeTexture:SetPoint("BOTTOMRIGHT", f.resize, "BOTTOMRIGHT", 0, 0)
    f.resize:SetScript("OnMouseDown", function(f, button)
        if button == "LeftButton" then
            f:SetMovable("false")
            print("doodoo")
            f.isSizing = true
            f:StartSizing("BOTTOMRIGHT")
            f:SetUserPlaced(true)
        end
    end)
    f:Show()
end

function GUI:ToggleGUI()
    if not isShown then
        frame:Show()
        isShown = true
    else
        frame:Hide()
        print("Classic Ignite Warning GUI has been toggled off")
        isShown = false
    end
end