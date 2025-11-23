return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- local colors = {
		-- 	blue = "#65D1FF",
		-- 	green = "#3EFFDC",
		-- 	violet = "#FF61EF",
		-- 	yellow = "#FFDA7B",
		-- 	red = "#FF4A4A",
		-- 	fg = "#c3ccdc",
		-- 	bg = "#112638",
		-- 	inactive_bg = "#2c3043",
		-- 	dark_bg = "#1a1a1a",
		-- 	inactive_fg = "#606060",
		-- }

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				disabled_filetypes = { "packer", "NvimTree" },
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = false,
				padding = 4,
				always_divide_middle = false,
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "branch" },
				lualine_x = { "diff" },
				lualine_y = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {},
		})

		vim.opt.laststatus = 0
	end,
}
