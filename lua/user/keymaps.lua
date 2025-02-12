local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Resizing splits
-- keymap("n","<Leader>+", ':exe "resize " . (winheight(0) * 3/2)<CR>', opts)
-- keymap("n","<Leader>-", ':exe "resize " . (winheight(0) * 2/3)<CR>', opts)
keymap("n", "<Leader>x", ":let @/=''<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- Find files
keymap("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", opts) -- Find files
keymap("n", "<leader>fb", " <cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope git_files<cr>", opts) -- In current git directory
keymap("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", opts) -- In commits
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts) -- In commits

-- Telescope dap for debugger --
keymap("n", "<leader>ds", ":Telescope dap frames<CR>", opts)
-- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>', opts)
keymap("n", "<leader>db", ":Telescope dap list_breakpoints<CR>", opts)

-- Treesitter --
keymap("n", "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", opts) -- Toggle playground

-- Highlighting

keymap("v", "<F1>", ":<c-u>HSHighlight 1<CR>", opts) -- Highlight creation
keymap("v", "<F2>", ":<c-u>HSRmHighlight<CR>", opts) -- Highlight deletion

-- NvimTree --
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
-- Buffer --
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)

--[[ -- Tagbar -- ]]
--[[ keymap("n", "<leader>z", "<cmd>TagbarToggle<CR>", opts) ]]

-- Incremental Remap --
keymap("n", "<leader>rn", ":IncRename ", opts)

-- azerty remaps --
keymap("v", ";", ".", { noremap = true })
keymap("n", "m", "$", opts)
keymap("v", ".", ":normal.<CR>", { noremap = true })

keymap("n", "c*", "*Ncgn", opts)
keymap("n", "c#", "#NcgN", opts)
keymap("n", "cg*", "g*Ncgn", opts)
keymap("n", "cg#", "g#Ncgn", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "µ", "#", { noremap = false, silent = true })
keymap("n", "²", ".", { noremap = false, silent = true })
      -- Incrementing and decrementing --
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)
keymap("x", "+", "<C-a>", opts)
keymap("x", "-", "<C-x>", opts)

keymap("", "'", "<C-]>", opts)
