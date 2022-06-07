local modes = {
  normal = 'n',
  insert = 'i',
  visual = 'v',
  visual_block = 'x',
  command = 'c',
  terminal = 't',
  -- add more mode here if you want
}

opts = { noremap = true, silent = true }

function set_keymap(keys)
  for mode, map in pairs(keys) do
    local key_mode = modes[mode]
    for key, value in pairs(map) do
      vim.api.nvim_set_keymap(key_mode, key, value, opts)
    end
  end
end
