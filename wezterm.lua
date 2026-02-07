local wezterm = require("wezterm")

-- local function themeCycler(window, _)
-- 	local allSchemes = wezterm.color.get_builtin_schemes()
-- 	local currentMode = wezterm.gui.get_appearance()
-- 	local currentScheme = window:effective_config().color_scheme
-- 	local darkSchemes = {}
-- 	local lightSchemes = {}
--
-- 	for name, scheme in pairs(allSchemes) do
-- 		if scheme.background then
-- 			local bg = wezterm.color.parse(scheme.background) -- parse into a color object
-- 			local h, s, l, a = bg:hsla()
-- 			if l < 0.4 then
-- 				table.insert(darkSchemes, name)
-- 			else
-- 				table.insert(lightSchemes, name)
-- 			end
-- 		end
-- 	end
-- 	local schemesToSearch = currentMode:find("Dark") and darkSchemes or lightSchemes
-- 	for i = 1, #schemesToSearch, 1 do
-- 		if schemesToSearch[i] == currentScheme then
-- 			local overrides = window:get_config_overrides() or {}
-- 			overrides.color_scheme = schemesToSearch[i + 1]
-- 			wezterm.log_info("Switched to: " .. schemesToSearch[i + 1])
-- 			window:set_config_overrides(overrides)
-- 			return
-- 		end
-- 	end
-- end

return {
	-- keys = {
	-- 	{ key = "t", mods = "ALT", action = wezterm.action_callback(themeCycler) },
	-- 	{ key = "Escape", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
	-- },
	font = wezterm.font({
		family = "MesloLGM Nerd Font Mono",
		weight = "Bold",
	}),
	font_size = 12.0,
	color_scheme = "Tomorrow Night (Gogh)",
	-- color_scheme = "Tokyo Night Moon",
	-- color_scheme = "Tokyo Night",
	-- color_scheme = "palenight",
}
