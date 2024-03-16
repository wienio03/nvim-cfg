--leader as space
vim.g.mapleader = " "

local keymap = vim.keymap

--general

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")

--single character deletion
keymap.set("n", "x", '"_x')

--file sourcing
keymap.set("n", "<leader><leader>", ":so<CR>")

------------------------------------------

--plugins

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

--ToggleTerm
local term_counter = 0
local is_any_toggled = false
keymap.set("n", "<leader>tt", function()
	term_counter = term_counter + 1
	is_any_toggled = true
	vim.cmd("ToggleTerm" .. term_counter)
end)

keymap.set("n", "<leader>tc", function()
	if is_any_toggled then
		vim.cmd("ToggleTerm" .. term_counter)
		term_counter = term_counter - 1
		if term_counter < 1 then
			is_any_toggled = false
			return
		end
	end
end)
