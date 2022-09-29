local home = os.getenv("HOME")
local db = require("dashboard")
db.custom_footer = "My version of Neovim"
db.preview_file_Path = "/home/zatout/Documents/These_yanis/templates/logo_CNRS.png"
db.preview_file_height = 120 -- number type
db.preview_file_width = 120 -- number type
db.preview_command = "ueberzug"
db.custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session                  ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Open Personal dotfiles                  ",
		action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
		shortcut = "SPC f d",
	},
}
