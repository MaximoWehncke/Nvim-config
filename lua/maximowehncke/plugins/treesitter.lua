return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- disable deprecated module
			vim.g.skip_ts_context_commentstring_module = true

			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },

				ensure_installed = {
					"c",
					"lua",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"java",
					"bash",
					"json",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"dockerfile",
					"gitignore",
					"query",
					"vim",
					"vimdoc",
					"yaml",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	{
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("nvim-treesitter.configs").setup({
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
								["aa"] = "@parameter.outer",
								["ia"] = "@parameter.inner",
								["ab"] = "@block.outer",
								["ib"] = "@block.inner",
								["al"] = "@loop.outer",
								["il"] = "@loop.inner",
								["ai"] = "@conditional.outer",
								["ii"] = "@conditional.inner",
								["a/"] = "@comment.outer",
								["i/"] = "@comment.inner",
							},
						},

						move = {
							enable = true,
							set_jumps = true, -- whether to set jumps in the jumplist
							goto_next_start = {
								["]f"] = "@function.outer",
								["]c"] = "@class.outer",
								["]a"] = "@parameter.inner",
							},
							goto_next_end = {
								["]F"] = "@function.outer",
								["]C"] = "@class.outer",
								["]A"] = "@parameter.inner",
							},
							goto_previous_start = {
								["[f"] = "@function.outer",
								["[c"] = "@class.outer",
								["[a"] = "@parameter.inner",
							},
							goto_previous_end = {
								["[F"] = "@function.outer",
								["[C"] = "@class.outer",
								["[A"] = "@parameter.inner",
							},
						},

						swap = {
							enable = true,
							swap_next = {
								["<leader>a"] = "@parameter.inner",
							},
							swap_previous = {
								["<leader>A"] = "@parameter.inner",
							},
						},

						lsp_interop = {
							enable = true,
							border = "none",
							floating_preview_opts = {},
							peek_definition_code = {
								["<leader>df"] = "@function.outer",
								["<leader>dF"] = "@class.outer",
							},
						},
					},
				})
			end,
		},
	},
}
