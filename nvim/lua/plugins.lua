local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]



vim.g.livepreview_previewer = 'zathura'

return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Utils
    use 'christoomey/vim-tmux-navigator'
    use 'nvim-lua/plenary.nvim'
    use 'preservim/nerdtree'

    -- Aesthetics
    use 'chriskempson/base16-vim'
    use 'itchyny/lightline.vim'
    use 'mike-hearn/base16-vim-lightline'
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    use {
        'pyrho/nerveux.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function() require"nerveux".setup() end,
    }


    -- Languages
    use 'lervag/vimtex'
    use 'xuhdev/vim-latex-live-preview'
    use 'neovimhaskell/haskell-vim'


    -- LSP and Completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'junegunn/goyo.vim'
    use 'junegunn/vim-easy-align'
end)


