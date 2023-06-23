local lsp_handler = require('handlers')
lsp_handler.setup()


--require('lspconfig').hls.setup{
    --cmd = {
        --"/home/iv/play/haskell-language-server/dist-newstyle/build/x86_64-linux/ghc-8.10.7/haskell-language-server-1.6.1.1/x/haskell-language-server/build/haskell-language-server/haskell-language-server",
        --"--lsp"
    --},
    --on_attach = lsp_handler.on_attach
--}


-- completion
local cmp = require('cmp')
cmp.setup {
  completion = {
    autocomplete = false, -- disable auto-completion.
  },
}

_G.vimrc = _G.vimrc or {}
_G.vimrc.cmp = _G.vimrc.cmp or {}
_G.vimrc.cmp.lsp = function()
  cmp.complete({
    config = {
      sources = {
        { name = 'nvim_lsp' }
      }
    }
  })
end
_G.vimrc.cmp.snippet = function()
  cmp.complete({
    config = {
      sources = {
        { name = 'vsnip' }
      }
    }
  })
end

vim.cmd([[
  inoremap <C-x><C-o> <Cmd>lua vimrc.cmp.lsp()<CR>
  inoremap <C-x><C-s> <Cmd>lua vimrc.cmp.snippet()<CR>
]])
