local M = {}

M.apply_to_config = function(config, wezterm, opts) 
	local os = require("os")
	local io = require("io")
	local JSON = ""
	local theme = opts.theme_fallback or ""
	local opacity = opts.opacity_fallback or 1
	local blur = opts.blur_fallback or 0
	
	if opts.theme_path then 
		M.theme_path = opts.theme_path 
	else 
		M.theme_path = os.getenv("HOME").."/.config/theme_conf" 
	end

	wezterm.add_to_config_reload_watch_list(M.theme_path)
	local JSON_file = io.open(M.theme_path .. "/themes.json", "r")
	if (JSON_file) then JSON = JSON_file:read("*a") JSON_file:close() end
	JSON = wezterm.json_parse(JSON)
	
	if JSON.default == "external" then 
		local external = io.open(M.theme_path .. "/external", "r") 
		if (external) then JSON.default = external:read("*l") external:close() end
	end

	local default = JSON[JSON.default]
	local theme = JSON.default

	if (default) then 

		if (default.rest) then theme=default.rest end
		if (default.wezterm) then theme=default.wezterm end 
		if (default.opacity) then opacity=default.opacity end
		if (default.blur) then blur=default.blur end
	end

	config.window_background_opacity = opacity
	config.color_scheme = theme
	-- MacOS support is technically planned
	-- config.macos_window_background_blur = blur
	-- Blur on Gnome is done through Gnome, not Wezterm
end

return M
