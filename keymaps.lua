
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

vim.g.listchars='eol:↵,trail:~,tab:>-,nbsp:␣'

-- Wordstar Stuf/
keymap("", "<c-c>", "<nop>", opts)
keymap("", "<c-q>", "<nop>", opts)
keymap("", "<c-z>", "<nop>", opts)
keymap("", "<c-w>", "<nop>", opts)
keymap("", "<c-r>", "<nop>", opts)

keymap("", "<C-e>", "<Up>", opts)
keymap("", "<C-x>", "<Down>", opts)
keymap("", "<C-d>", "<Right>", opts)
keymap("", "<C-s>", "<Left>", opts)
keymap("", "<C-f>", "<S-Right>", opts)
keymap("", "<C-a>", "<S-Left>", opts)
keymap("", "<C-q><C-d>", "<End>", opts)
keymap("", "<C-t>", "diw", opts)
keymap("", "<C-y>", "dd", opts)
keymap("", "<C-u>", "u", opts)
keymap("", "<A-u>", ":redo", opts)
keymap("", "<C-g>", "<Del>", opts)
keymap("", "<C-q><C-y>", "d$", opts)
keymap("n", "<C-k><C-b>", "v", opts)
keymap("", "<C-q><C-s>", "<Home>", opts)
keymap("", "<C-q><C-c>", "<C-End>", opts)
keymap("", "<C-q><C-r>", "<C-Home>", opts)
keymap("", "<C-k><C-k>", "y", opts)
keymap("n", "<C-Space>", "P", opts)
keymap("n", "<leader><space>", "yyP", opts)
keymap("n", "<leader>cc", ":e ~/.config/nvim/init.lua", opts)
keymap("v", "<A-c>", "<C-v>", opts)


-- inset mode
keymap("i", "<C-e>", "<Up>", opts)
keymap("i", "<C-x>", "<Down>", opts)
keymap("i", "<C-d>", "<Right>", opts)
keymap("i", "<C-s>", "<Left>", opts)
keymap("i", "<C-f>", "<S-Right>", opts)
keymap("i", "<C-a>", "<S-Left>", opts)
keymap("i", "<C-q><C-d>", "<End>", opts)
keymap("i", "<C-q><C-s>", "<Home>", opts)
-- terminal
keymap("t", "<C-q>", "<C-\\><C-n>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<leader>wa", "<C-\\><C-n><C-w><BS>", opts)
keymap("t", "<leader>wd", "<C-\\><C-n><C-w><C-l>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
 --autocmd BufWritePre *.zig lua vim.lsp.buf.formatting_sync()

keymap("n", "<c-q><c-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap("", "<C-l>", "<cmd>lua require('telescope.builtin').resume()<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>a", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
keymap("n", "<leader>k", ":GitGutterNextHunk<CR>", opts)
keymap("n", "<leader>j", ":GitGutterPrevHunk<CR>", opts)
keymap("n", "<leader>2", ":bprevious<CR>", opts)
keymap("n", "<leader>3", ":bnext<CR>", opts)
keymap("n", "<leader>wx", "<C-w><C-o>", opts)
keymap("n", "<leader>ws", "<C-w><C-j>", opts)
keymap("n", "<leader>ww", "<C-w><C-k>", opts)
keymap("n", "<leader>wa", "<C-w><BS>", opts)
keymap("n", "<leader>wd", "<C-w><C-l>", opts)
keymap("n", "<leader>wf", ":vs<CR>", opts)
keymap("n", "<leader>/", ":noh<CR>", opts)

-- map <leader>x", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

local scroll_keys = {}

scroll_keys['<C-w>'] = {'scroll', {'-1', 'true', '350'}}
scroll_keys['<C-z>'] = {'scroll', {'1', 'true', '350'}}
scroll_keys['<C-c>'] = {'scroll', {'0.8', 'true', '100'}}
scroll_keys['<C-r>'] = {'scroll', {'-0.8', 'true', '100'}}
require('neoscroll.config').set_mappings(scroll_keys)


