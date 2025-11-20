return {
	"hinell/move.nvim",
	config = function()
		local opts = { noremap = true, silent = true }

		-- Move lines up/down with Ctrl+Up/Down
		vim.keymap.set("n", "<C-Up>", ":MoveLine -1<CR>", opts)
		vim.keymap.set("n", "<C-Down>", ":MoveLine 1<CR>", opts)

		-- Move words left/right with Ctrl+Shift+Left/Right
		vim.keymap.set("n", "<C-S-Left>", ":MoveWord -1<CR>", opts)
		vim.keymap.set("n", "<C-S-Right>", ":MoveWord 1<CR>", opts)

		-- Move blocks up/down in visual mode with Ctrl+Up/Down
		vim.keymap.set("x", "<C-Up>", ":MoveBlock -1<CR>", opts)
		vim.keymap.set("x", "<C-Down>", ":MoveBlock 1<CR>", opts)

		-- Move blocks left/right in visual mode with Ctrl+Left/Right
		vim.keymap.set("v", "<C-Left>", ":MoveHBlock -1<CR>", opts)
		vim.keymap.set("v", "<C-Right>", ":MoveHBlock 1<CR>", opts)
	end,
}
