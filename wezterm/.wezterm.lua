local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.initial_cols = 120
-- config.initial_rows = 28

config.font_size = 21
config.color_scheme = 'rose-pine'

return config
