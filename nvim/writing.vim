""""""""""""""""""""""""""""""""""""""""
"   vimwiki
""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{
            \ 'path': '~/tmp/wiki',
            \ 'index': 'home',
            \ 'syntax': 'markdown',
            \ 'ext': '.md',
            \ 'automatic_nexted_syntaxes': 1,
            \ 'auto_tags': 1
            \ }]

" don't consider non vimwiki .md files .vimwiki files
let g:vimwiki_global_ext = 0 


""""""""""""""""""""""""""""""""""""""""
" vim markdown
""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_auto_extension_ext = 'txt'

let g:vim_markdown_folding_disabled = 1     " disable folding
let g:vim_markdown_strikethrough = 1        " use ~~ to strikethrough
let g:vim_markdown_auto_insert_bullets = 1

" disable automatic indentation when inserting new list item
let g:vim_markdown_new_list_item_indent = 2

let g:vim_markdown_math = 1 " enable LaTeX math

let g:vim_markdown_fenced_languages = [
            \ "py=python",
            \ "c=c",
            \ "hs=haskell",
            \ "c++=cpp",
            \ "vim=vim",
            \ "rkt=racket",
            \ "lisp=lisp",
            \ "scm=scheme",
            \ "md=markdown",
            "\ "rs=rust",
            \ ]



""""""""""""""""""""""""""""""""""""""""
" writing
""""""""""""""""""""""""""""""""""""""""
let g:pencil#wrapModeDefault = 'hard'
let g:pencil#cursorwrap = 0

function! Writing()
    setl textwidth=80
    nnoremap <buffer> Q gqap
endfunction

augroup writing
    autocmd!
    "autocmd FileType markdown,md,mkd call pencil#init()
    autocmd FileType markdown,md,mkd call Writing()
    "autocmd FileType text,txt call pencil#init()
    autocmd FileType text,txt call Writing()
    "autocmd FileType vimwiki call pencil#init()
    autocmd FileType vimwiki call Writing()

    autocmd User GoyoEnter set scrolloff=999
    autocmd User GoyoEnter set cursorline
augroup end

""""""""""""""""""""""""""""""""""""""""
" latex
""""""""""""""""""""""""""""""""""""""""
function! ToPdf()
    exec "!pandoc -s -f markdown -t html -c style.css -o output.pdf ".shellescape("%")
endfunction

autocmd filetype markdown,md,mkd nnoremap <Leader>mk :call ToPdf()<CR>
