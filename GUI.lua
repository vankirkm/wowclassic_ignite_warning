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

--create frame
function GUI:MakeFrame()
    frame = getglobal("MainFrame")
    frame.resize = CreateFrame("Frame", "Resize", self.frame)
	frame.resize:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
	frame.resize:SetSize(12, 12)
	frame.resizeTexture = frame.resize:CreateTexture()
	frame.resizeTexture:SetTexture([[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]])
	frame.resizeTexture:SetDesaturated(true)
	frame.resizeTexture:SetPoint("TOPLEFT", frame.resize)
    frame.resizeTexture:SetPoint("BOTTOMRIGHT", frame.resize, "BOTTOMRIGHT", 0, 0)
    frame:Show()
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