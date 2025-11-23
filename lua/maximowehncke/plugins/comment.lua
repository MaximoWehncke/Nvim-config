return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		local comment = require("Comment")
		local ts_pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

		comment.setup({
			pre_hook = function(ctx)
				local ft = vim.bo.filetype

				-- Only use context-commentstring for filetypes that need dynamic commentstring
				local dynamic = {
					tsx = true,
					jsx = true,
					javascriptreact = true,
					typescriptreact = true,
					svelte = true,
					html = true,
					vue = true,
				}

				if dynamic[ft] then
					return ts_pre_hook(ctx)
				end
			end,
		})
	end,
}
