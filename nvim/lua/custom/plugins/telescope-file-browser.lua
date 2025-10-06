return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require 'telescope'

    require('telescope').setup {

      -- defaults = {
      --   layout_strategy = 'vertical', -- or 'horizontal'
      --   layout_config = {
      --     height = 0.3, -- full height
      --     width = 0.3, -- full width
      --     preview_height = 0.5, -- tweak preview size
      --   },
      -- },
      extensions = {
        file_browser = {

          -- theme = 'ivy',
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ['i'] = {
              -- your custom insert mode mappings
            },
            ['n'] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }

    -- Load the extension after telescope.setup
    telescope.load_extension 'file_browser'

    -- Keybindings
    vim.keymap.set('n', '<space>b', '<cmd>Telescope file_browser<CR>', { noremap = true, silent = true, desc = 'File browser (cwd)' })
    vim.keymap.set(
      'n',
      '<space>B',
      '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
      { noremap = true, silent = true, desc = 'File browser (buffer dir)' }
    )
  end,
}
