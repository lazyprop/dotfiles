call plug#begin()

Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kevinhwang91/rnvimr'
Plug 'soywod/himalaya', {'rtp': 'vim'}
Plug 'sirver/ultisnips'

" wiki
"Plug 'vimwiki/vimwiki'
Plug 'vhyrro/neorg' | Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'

" writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

" languages
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'
Plug 'jsborjesson/vim-uppercase-sql' " technically not a programming language
Plug 'guns/vim-sexp'
Plug 'wlangstroth/vim-racket'
Plug 'manicmaniac/coconut.vim'
Plug 'whonore/Coqtail'
 
" asthetics
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'mhinz/vim-startify'


call plug#end()

source $XDG_CONFIG_HOME/nvim/general.vim
source $XDG_CONFIG_HOME/nvim/movement.vim
source $XDG_CONFIG_HOME/nvim/asthetics.vim
source $XDG_CONFIG_HOME/nvim/writing.vim

nnoremap <Leader>sv :source $MYVIMRC<CR>

"""""""""""""""""""
" search
"""""""""""""""""""
set showcmd         " Show (partial) command in status line.
set noshowmatch     " Show matching brackets.
set ignorecase      " Do case insensitive matching
"set smartcase› ›   " Do smart case matching
set incsearch       " Incremental search
"set autowrite› ›   " Automatically save before commands like :next and :make
"set hidden››       " Hide buffers when they are abandoned
set mouse=a
set hlsearch

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" make n always search forward and N backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" make ; always find forward and , backward
nnoremap <expr> ; getcharsearch().forward ? ';' : ','
nnoremap <expr> , getcharsearch().forward ? ',' : ';'


" use tmux prefix for vim
"nnoremap <C-Space> <C-w>

""""""""""""""""""""""""""""""""""""""""
"   competitive programming
""""""""""""""""""""""""""""""""""""""""
function InitIO()
    vsplit in
    split out
endfunction

function! InitCP()
    exec "%!cat ~/play/competitive/template.cpp"
    write
endfunction

function! AutoTest()
    exec "!g++ ".shellescape("%")
    exec "!./a.out < in > out"
    exec "!rm a.out"
endfunction

autocmd filetype cpp nnoremap <Leader>cp :call InitCP()<CR>
autocmd filetype cpp nnoremap <Leader>io :call InitIO()<CR>
autocmd filetype cpp nnoremap <Leader>mk :w<bar> call AutoTest()<CR>


""""""""""""""""""""""""""""""""""""""""
" vim-scheme
""""""""""""""""""""""""""""""""""""""""
let g:scheme_split_size=15
let g:sexp_enable_insert_mode_mappings = 0

""""""""""""""""""""""""""""""""""""""""
" haskell
""""""""""""""""""""""""""""""""""""""""
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 2
