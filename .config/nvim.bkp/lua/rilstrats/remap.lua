local nnoremap = require("rilstrats.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- telescope
nnoremap ("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap ("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap ("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap ("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
