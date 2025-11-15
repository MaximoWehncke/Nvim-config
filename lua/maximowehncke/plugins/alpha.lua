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

			-- Get all neovim ASCII arts
			local neovim_arts = require("ascii").art.text.neovim

			-- Get all the keys (art names) and pick a random one
			local art_names = {}
			for name, _ in pairs(neovim_arts) do
				table.insert(art_names, name)
			end

			-- Pick random art
			math.randomseed(os.time())
			local random_art = neovim_arts[art_names[math.random(#art_names)]]

			-- Set header to random art
			dashboard.section.header.val = random_art

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
