vim.cmd [[
    let mapleader = ' '
    " disable auto comment on hitting enter
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]]

vim.cmd [[
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

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
]]


vim.cmd [[
    " use ctrl+backspace to delete previous word

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
]]

vim.cmd [[
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

    set conceallevel=2



    """"""""""""""""""""""""""""""""""""""""
    " writing
    """"""""""""""""""""""""""""""""""""""""
    let g:pencil#wrapModeDefault = 'hard'
    let g:pencil#cursorwrap = 0

    function! Writing()
        setl textwidth=80
        setl tabstop=2
        setl shiftwidth=2
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
        autocmd FileType tex,latex call Writing()

        autocmd User GoyoEnter set scrolloff=999
        autocmd User GoyoEnter set cursorline
    augroup end

    let g:goyo_width = 81

    """"""""""""""""""""""""""""""""""""""""
    " latex
    """"""""""""""""""""""""""""""""""""""""
    let g:UltiSnipsExpandTrigger='<tab>'
    let g:UltiSnipsJumpForwardTrigger='<tab>'
    let g:UltiSnipsJumpBackwardTrigger='<s-tab>'


    """"""""""""""""""""""""""""""""""""""""
    " neorg
    """"""""""""""""""""""""""""""""""""""""

    "lua << EOF
        "require('neorg').setup {
            "-- Tell Neorg what modules to load
            "load = {
                "["core.defaults"] = {}, -- Load all the default modules
                "["core.norg.concealer"] = {}, -- Allows for use of icons
                "["core.norg.dirman"] = { -- Manage your directories with Neorg
                    "config = {
                        "workspaces = {
                            "my_workspace = "~/play/neorg"
                        "}
                    "}
                "},
                "["core.highlights"] = {},
            "},
        "}
    "EOF


    """"""""""""""""""""""""""""""""""""""""
    " latex
    """"""""""""""""""""""""""""""""""""""""
    let g:livepreview_previewer = 'zathura'


    """"""""""""""""""""""""""""""""""""""""
    " neuron
    """"""""""""""""""""""""""""""""""""""""


]]

require 'nerveux'.setup {
--- path to neuron executable (default: neuron in PATH)
--neuron_cmd = "neuron",

--- no trailing slash, (default: current directory)
neuron_dir = "/home/iv/zettelkasten",

--- Use the cache, significantly faster (default: false)
--use_cache = true,

--- start the neuron daemon to keep the cache up to date (default: false)
start_daemon = true,

--- show zettel titles inline as virtual text (default: false)
virtual_titles = true,

--- Automatically create mappings (default: false)
create_default_mappings = true,

--- The Highlight Group used for the inline zettel titles (default: Special)
virtual_title_hl = "Special",
virtual_title_hl_folge = "Repeat",

--- `kill -9` the pid of the daemon at exit (VimPreLeave), only valid is
-- start_daemon is true (default: false)
kill_daemon_at_exit = true,

--- You can overwrite this table partially
-- and your settings will get merged with the defaults
-- You can also disable a single mapping by settings it's value to an empty string.
mappings = {

   -- Search all your zettels
   -- * then `<CR>` to edit
   -- * or `<Tab>` to insert the selected zettel ID under your cursor
   search_zettels = "gzz" ,

   -- Search the backlinks to the current zettel 
   backlinks_search = "gzb" ,

   -- Search the only the uplinks to the current zettel 
   uplinks_search = "gzu" ,

   -- Create a new zettel via neuron and :edit it
   new = "gzn" ,

   -- Search for content inside all the zettels
   search_content = "gzs" ,

   -- Insert the ID of the previously visited zettel
   insert_link = "gzl" ,

   -- Insert the ID of the previously visited zettel, but as a folgezettel
   insert_link_folge = "gzL" ,

   -- Open the zettel ID that's under the cursor
   follow = "<CR>" ,

   -- Show the help
   help = "gz?" ,
}
}

