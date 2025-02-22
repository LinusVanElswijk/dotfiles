require("relative-motions"):setup({
	show_numbers = "relative_absolute",
	show_motion = false,
	only_motions = true,
	enter_mode = "first",
})
require("starship"):setup({ config_file = "~/.config/yazi/starship.toml" })
