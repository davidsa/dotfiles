return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "€", ui.toggle_quick_menu)

		vim.keymap.set("n", "ˇ", ui.nav_prev)
		vim.keymap.set("n", "¯", ui.nav_next)
	end,
}
