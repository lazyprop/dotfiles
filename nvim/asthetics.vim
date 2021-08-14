"""""""""""""""""""""""""""""""""""""""
"   colorscheme
"""""""""""""""""""""""""""""""""""""""
function! RemoveBg()
    "highlight clear CursorLine
    highlight Normal ctermbg=none guibg=none
    "highlight LineNr ctermbg=none guibg=none
    "highlight Folded ctermbg=none guibg=none
    "highlight NonText ctermbg=none guibg=none
    "highlight SpecialKey ctermbg=none guibg=none
    "highlight VertSplit ctermbg=none guibg=none
    "highlight SignColumn ctermbg=none guibg=none
endfunction

autocmd ColorScheme * call RemoveBg()

set termguicolors
set t_Co=256
let NERDTreeHighlightCursorline=0
"set cursorline

colorscheme base16-default-dark


"""""""""""""""""""""""""""""""""""""""
"   statusline (lightline)
"""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'base16_default_dark',
      \ }
set laststatus=2

"""""""""""""""""""""""""""""""""""""""
"   nerdtree
"""""""""""""""""""""""""""""""""""""""
noremap <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""
" vim startify
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>st :Startify<CR>
let g:startify_bookmarks = [
            \ '~/.config/nvim/',
            "\ '~/play/',
            \]

let g:startify_lists = [
            \ {'type': 'bookmarks' , 'header': ['Bookmarks']}
            \]

