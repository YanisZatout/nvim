local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("Protected call to treesitter failed in treesitter.lua")
	return
end

configs.setup({
	ensure_installed = { "c", "cpp", "python", "lua", "rust" },
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		--[[ disable = { "css" }, -- list of language that will be disabled ]]
	},
	autopairs = {
		enable = true,
	},

	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
	},
	playground = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding xor succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = true,

			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					[")m"] = "@function.outer",
					["))"] = "@class.outer",
				},
				goto_next_end = {
					[")M"] = "@function.outer",
					["))"] = "@class.outer",
				},
				goto_previous_start = {
					["(m"] = "@function.outer",
					["(("] = "@class.outer",
				},
				goto_previous_end = {
					["(M"] = "@function.outer",
					["(("] = "@class.outer",
				},
			},
		},
	},
})
