require 'plugins'
require 'legacy'
require 'nvim-tree'

require 'utils'
require 'aesthetics'
--require 'lsp-config'

local options = {
    autochdir = true,
    autoindent = true,
    autoread = true,
    backup = false,
    colorcolumn = '80',
    conceallevel = 2,
    expandtab = true,
    fileencoding = 'utf-8',
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 2,
    mouse = 'a',
    number = true,
    relativenumber = true,
    shiftwidth = 4,
    showcmd = true,
    showmatch = false,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    wrap = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


-- colors

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.g.tmux_navigator_no_mappings = 1
set_keymap({
    normal = {
        ['<C-Space>h'] = ':TmuxNavigateLeft<cr>',
        ['<C-Space>j'] = ':TmuxNavigateDown<cr>',
        ['<C-Space>k'] = ':TmuxNavigateUp<cr>',
        ['<C-Space>l'] = ':TmuxNavigateRight<cr>',
    },
    insert = {
        ['<C-h>'] = '<C-w>',
    },
    command = {
        ['<C-h>'] = '<C-w>',
    },
})


local keymap = {
    normal = {
        ['<C-n>'] = ':NERDTreeToggle<CR>',
        ['<leader>l']  =  ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>',
    }
}

set_keymap(keymap)
