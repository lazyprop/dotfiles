" make J, K move MORE
"nnoremap J <c-d>
"nnoremap K <c-u>

" make <c-j>, <c-k>, <c-l>, and <c-h> scroll the screen.
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap <c-l> zl
nnoremap <c-h> zh

" make <a-j>, <a-k>, <a-l>, and <a-h> move to window.
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
nnoremap <a-h> <c-w>h


let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Space>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Space>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-Space>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-Space>l :TmuxNavigateRight<cr>
"nnoremap <silent> <C-Space> n :TmuxNavigatePrevious<cr>
