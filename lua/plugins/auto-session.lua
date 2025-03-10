vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {

      auto_restore_last_session = true,
      log_level = 'error',
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        previewer = false,
        theme_conf = { border = true },
      },
      suppressed_dirs = { '~/' },

      vim.keymap.set('n', '<leader>fs', require('auto-session.session-lens').search_session, { noremap = true }),
    }
  end,
}
