-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.automatically_reload_config = true

-- set theme
config.color_scheme = "Catppuccin Macchiato"

-- font
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

-- Open full screen
wezterm.on("gui-startup", function()
	local mux = wezterm.mux
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
