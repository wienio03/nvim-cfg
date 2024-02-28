--leader as space
vim.g.mapleader = " "

local keymap = vim.keymap

--general

--single character deletion
keymap.set("n", "x", '"_x')

--incrementation and decrementation
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

--multiple windows and tabs
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

--file sourcing
keymap.set("n", "<leader><leader>", ":so<CR>")

------------------------------------------

--plugins

--maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

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

--UndoTree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
