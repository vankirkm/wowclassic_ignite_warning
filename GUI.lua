local GUI = {}
_G["ClassicIgniteWarningGUI"] = GUI
local cfg = _G.defaultConfig
print(cfg.backdrop)



-------------------------------------
--            VARIABLES            --
-------------------------------------
local isShown = true
local defaultTexture = "CIW Default"
local defaultFont = "NotoSans SemiCondensedBold"
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
    bottom = defaultConfig.backdrop.inset,},
}



-----------------------------------
--         FRAME FUNCTIONS       -- 
-----------------------------------

--create frame
function GUI:MakeFrame()
    f = CreateFrame("Frame", "CIWMain", UIParent)
    f:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -100, 300)
    f:SetBackdrop(backdrop)
    f:SetSize(200,161)
	f:SetBackdropColor(0, 0, 0, 0.4)
	f:SetBackdropBorderColor(0, 0, 0, 1)
    f:SetResizable("true")
    f:SetMovable("true")

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
    f.header:SetSize(f:GetWidth(), 20)
    f.header:SetMovable("true")
    f.header:SetStatusBarTexture(defaultTexture)
	f.header:SetPoint("TOPLEFT", f, 0, 0)
	f.header:SetStatusBarColor(0, 0, 0, 0.8)
	f.header.backdrop:SetBackdropColor(0, 0, 0, 0)
    f.header.backdrop:SetBackdropBorderColor(0, 0, 0, 0.8)
    f.header:SetScript("OnMouseDown", StartDrag)
    f.header:SetScript("OnMouseUp", StopDrag)

    -----Header Text-----
    f.header.text = f.header:CreateFontString(nil, "OVERLAY", defaultFont)
    f.header.text:SetText(format("%s%s", "Classic Ignite Warning", ""))
    f.header.text:SetPoint("LEFT", 4, 0)
    f.header.text:Show()
    
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

function CreateBackdrop(parent)
	local frame = CreateFrame("Frame", nil, parent)
    frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
    frame:SetBackdrop(backdrop)
	frame:SetBackdropColor(1, 1, 1, 0.08)
	frame:SetBackdropBorderColor(0, 0, 0, 1)
    frame:SetResizable("true")
	parent.backdrop = frame
end

function MakeFontString(parent)
	local fs = parent:CreateFontString(nil, "ARTWORK")
	fs:SetFont("Fonts\\NotoSans-SemiCondensedBold.ttf", 12, "OUTLINE")
	return fs
end