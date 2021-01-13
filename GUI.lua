local GUI = {}
_G["ClassicIgniteWarningGUI"] = GUI

-------------------------------------
--            VARIABLES            --
-------------------------------------
local isShown = true

local AceGUI = LibStub("AceGUI-3.0")

local playerName = UnitName("player")

local f = AceGUI:Create("Frame")
f:SetCallback("OnClose",function(widget) f:Hide() isShown = false print(isShown) end)
f:SetTitle("AceGUI-3.0 Example")
f:SetStatusText("Status Bar")
f:SetLayout("Flow")
-- Create a button
local btn = AceGUI:Create("Button")
btn:SetWidth(170)
btn:SetText("Button !")
btn:SetCallback("OnClick", function() print("Click!") end)
-- Add the button to the container
f:AddChild(btn)

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