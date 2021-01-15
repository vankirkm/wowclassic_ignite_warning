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
-- Create a button
local btn = AceGUI:Create("Button")
btn:SetWidth(170)
btn:SetText("Button !")
btn:SetCallback("OnClick", function() print("Click!") end)
-- Add the button to the container

function GUI:ToggleGUI()
    if not isShown then
        f:Show()
        print("Classic Ignite Warning GUI has been toggled on")
        isShown = true
    else
        f:Hide()
        print("Classic Ignite Warning GUI has been toggled off")
        isShown = false
    end
end