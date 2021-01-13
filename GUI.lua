local GUI = {}
_G["ClassicIgniteWarningGUI"] = GUI

local AceGUI = LibStub("AceGUI-3.0")

local playerName = UnitName("player")

local f = AceGUI:Create("Frame")
f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) end)
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

function GUI:Show()
    f:Show()
end