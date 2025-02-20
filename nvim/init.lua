vim.cmd('syntax on')


vim.opt.expandtab = true 
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "

vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true })

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use({ "miikanissi/modus-themes.nvim" })
  use 'chriskempson/base16-vim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'willothy/flatten.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ms-jpq/coq_nvim'
  use 'doctorfree/cheatsheet.nvim'
  use 'folke/which-key'
end)

vim.cmd [[
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-Space>h :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-Space>j :TmuxNavigateDown<cr>
  nnoremap <silent> <C-Space>k :TmuxNavigateUp<cr>
  nnoremap <silent> <C-Space>l :TmuxNavigateRight<cr>
]]

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.opt.termguicolors = true
vim.cmd('colorscheme base16-default-dark')
vim.cmd(':highlight Normal ctermbg=black guibg=black')
vim.cmd('set colorcolumn=80')

vim.keymap.set({ "n" }, "<leader>l", "<cmd>noh<CR>")


local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup({})
vim.cmd('let g:rust_recommended_style = v:false') -- respect my indent settings
lspconfig.clangd.setup({})
vim.diagnostic.disable() 

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'rust', 'c', 'python', 'cpp' },
  highlight = { enable = true },
  indent = { enable = false },
  textobjects = { enable = true },
})


vim.g.coq_settings = {
  keymap = { recommended = false },
  auto_start = false,
  clients = {
    tmux = { enabled = true },
  },
}
