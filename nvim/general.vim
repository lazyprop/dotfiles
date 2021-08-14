syntax enable
set wildignore=*.o,*.obj,*.bak,*.exe

set relativenumber
set number
autocmd TermOpen * setlocal nonumber norelativenumber

set encoding=UTF-8
set noswapfile " swapfiles are unnecessary and a PITA
set nowrap

filetype plugin indent on

" indentation
set autoindent " maintain current indentation when new line
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible

set splitright  " automatically open new split panes to right
set splitbelow  " automatically open new split panes to below

" disable auto comment on hitting enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set undofile    " enable saving undo history to a file
set autochdir   " set current directory to the file currently editing
set autoread    "  autoload file changes

let mapleader = " "  " map leader to <Space>

" use ctrl+backspace to delete previous word
inoremap <C-h> <C-w>
tnoremap <C-h> <C-w>
cnoremap <C-h> <C-w>

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" make Y consistent with C and D
nnoremap Y y$

""""""""""""""""""""""""""""""""""""""""
" completion
""""""""""""""""""""""""""""""""""""""""
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
inoremap <s-Tab> <C-P>
