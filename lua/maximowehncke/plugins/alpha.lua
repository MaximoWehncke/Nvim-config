return {
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = {
			"MaximilianLloyd/ascii.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = require("ascii").art.text.neovim.sharp

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", " New File", "<cmd>ene<CR>"),
				dashboard.button("SPC ee", " Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
				dashboard.button("SPC ff", "󰱼 Find File", "<cmd>Telescope find_files<CR>"),
				dashboard.button("SPC fs", " Find Word", "<cmd>Telescope live_grep<CR>"),
				dashboard.button(
					"SPC wr",
					"󰁯 Restore Session For Current Directory",
					"<cmd>AutoSession restore<CR>"
				),
				dashboard.button("q", " Quit NVIM", "<cmd>qa<CR>"),
			}

			alpha.setup(dashboard.opts)

			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},
}
