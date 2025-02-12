require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})
require("relative-motions"):setup({
	show_numbers = "relative_absolute",
	show_motion = false,
	only_motions = true,
	enter_mode = "first",
})
require("starship"):setup()
