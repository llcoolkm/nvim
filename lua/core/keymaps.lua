-- function to assist with keymapping
function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return {
  -- [[ Basic Keymaps ]]
  --  See `:help map()`

  -- Clear highlights on search when pressing <Esc> in normal mode
  --  See `:help hlsearch`
  map('n', '<Esc>', '<cmd>nohlsearch<CR>'),

  -- Diagnostic keymaps
  map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' }),

  -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
  -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
  -- is not what someone will guess without a bit more experience.
  --
  -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
  -- or just use <C-\><C-n> to exit terminal mode
  map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }),

  -- Window and buffer handling
  --  Use CTRL+<hjkl> to switch between windows
  --  See `:help wincmd` for a list of all window commands
  map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' }),
  map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' }),
  map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' }),
  map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }),
  map('n', '<Tab>', ':bn!<Enter>', { desc = 'Go to next buffer' }),
  map('n', '<S-Tab>', ':bp!<Enter>', { desc = 'Go to previous buffer' }),
  map('n', '<leader>bd', ':bd<Enter>', { desc = 'close the current buffer' }),
  map('n', '<leader>bl', ':FlyBuf<Enter>', { desc = 'open up a list of all buffers in a float' }),
  map('n', '<C-w>d', ':bp<bar>sp<bar>bn<bar>bd<CR>', { desc = 'close the current buffer' }),

  -- neo-tree
  map('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Open or close file browser' }),

  -- terraform
  map('n', '<leader>ti', ':!terraform init -no-color<CR>', { desc = 'terraform init' }),
  map('n', '<leader>tv', ':!terraform validate -no-color<CR>', { desc = 'terraform validate' }),
  map('n', '<leader>tp', ':!terraform plan -no-color<CR>', { desc = 'terraform plan' }),
  map('n', '<leader>ta', ':!terraform apply -no-color -auto-approve<CR>', { desc = 'terraform apply' }),

  -- Toggles
  map('n', '<leader>n', ':set number!<Enter>:set relativenumber!<Enter>'),
  map('n', '<Leader>g', ':Gitsigns toggle_signs<Enter>', { desc = 'Toggle Gitsigns' }),
  map('n', '<Leader>l', ':set list!<Enter>', { desc = 'Toggle list mode' }),
  map('n', '<Leader>p', ':set paste!<Enter>', { desc = 'Toggle paste mode' }),

  -- Remove trailing carriage returns (comes from git show normally)
  map('n', '<leader>cr', ':%s/\\r\\+$//e<CR>', { desc = 'Remove Windows carriage returns ^M' }),

  -- Augment Code AI
  map('n', '<leader>ac', ':Augment chat<CR>', { desc = 'Augment chat' }),
  map('n', '<leader>an', ':Augment chat-new<CR>', { desc = 'Augment chat-new' }),
  map('n', '<leader>as', ':Augment status<CR>', { desc = 'Augment status' }),
  map('n', '<leader>at', ':Augment chat-toggle<CR>', { desc = 'Augment chat-toggle' }),
}
