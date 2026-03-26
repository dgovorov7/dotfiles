return {
  'olimorris/codecompanion.nvim',
  version = '^18.0.0',
  lazy = true,
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
  keys = {
    { '<leader>cc', '<cmd>CodeCompanion cli<cr>', desc = 'CodeCompanion CLI' },
  },
  config = function()
    require('codecompanion').setup {
      --   strategies = {
      --     chat = { adapter = 'ollama' },
      --     inline = { adapter = 'ollama' },
      --   },
      --   interactions = {
      --     cli = {
      --       agent = 'claude_code',
      --       agents = {
      --         claude_code = {
      --           cmd = 'claude',
      --           args = {},
      --           description = 'Claude Code CLI',
      --           provider = 'terminal',
      --         },
      --       },
      --     },
      --   },
      --   opts = {
      --     log_level = 'DEBUG',
      --   },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
