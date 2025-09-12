-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Open full screen
wezterm.on("gui-startup", function()
	local mux = wezterm.mux
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- Hide tab bar
config.enable_tab_bar = false

-- Only allow resizing decorations
config.window_decorations = "RESIZE"

-- Full opacity
config.window_background_opacity = 1

-- Reload config when file changes
config.automatically_reload_config = true

-- Set theme
config.color_scheme = "Catppuccin Macchiato"

-- Font
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

return config
