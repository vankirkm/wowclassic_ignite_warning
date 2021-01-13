local options = {
	type = "group",
	name = "Classic Ignite Warning Options",
	args = {}
}

options.args["minimapButton"] = {
	order = 0,
	type = "toggle",
	name = "Hide Minimap Butto",
	desc = "This does nothing. It's simpy a test to see if this works in-game.",
}

LibStub("AceConfig-3.0"):RegisterOptionsTable("ClassicIgniteWarning-options", options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ClassicIgniteWarning-options", "ClassicIgniteWarning")