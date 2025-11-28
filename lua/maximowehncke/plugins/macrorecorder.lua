return {
	"chrisgrieser/nvim-recorder",
	dependencies = "rcarriga/nvim-notify", -- optional, for notifications
	opts = {
		-- Slot configuration (which registers to use for macros)
		slots = { "a", "b", "c", "d", "e" },

		-- Display recording status
		mapping = {
			startStopRecording = "q",
			playMacro = "Q",
			switchSlot = "<C-q>",
			editMacro = "cq",
			deleteAllMacros = "dq",
			yankMacro = "yq",
			addBreakPoint = "##", -- Use "##" in your macro to add a breakpoint
		},

		-- Use nerdfont icons (set to false if you don't have nerd fonts)
		useNerdfontIcons = true,

		-- Customize recording display
		dapSharedKeymaps = false,
	},
	config = function(_, opts)
		require("recorder").setup(opts)

		-- Optional: Add keymaps if you want different keys
		-- vim.keymap.set("n", "q", function() require("recorder").recordMacro() end, { desc = "Record macro" })
		-- vim.keymap.set("n", "Q", function() require("recorder").playMacro() end, { desc = "Play macro" })
	end,
}
