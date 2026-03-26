vim.filetype.add {
  extension = {
    razor = 'razor',
    cshtml = 'razor',
  },
}

-- -- Disable expensive LSP features for razor files to prevent slowness
-- vim.api.nvim_create_autocmd('LspAttach', {
--   pattern = { '*.razor', '*.cshtml' },
--   callback = function(args)
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     -- Inlay hints are expensive in mixed HTML/C# razor files
--     vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
--     -- Semantic tokens are the main perf killer: Roslyn re-sends the full token
--     -- list on every keystroke for razor files (cross-language analysis is costly)
--     if client then
--       vim.lsp.semantic_tokens.stop(bufnr, client.id)
--     end
--     -- Don't recompute diagnostics on every keystroke
--     vim.diagnostic.config { update_in_insert = false }
--     -- Disable signature help: fires textDocument/signatureHelp on every keystroke inside tags
--     vim.lsp.handlers['textDocument/signatureHelp'] = function() end
--   end,
-- })

return {
  'seblyng/roslyn.nvim',
  ft = { 'cs', 'razor', 'cshtml', 'vb' },
  opts = {
    broad_search = true,
    config = {
      -- Batch text change notifications: without this, every keystroke triggers
      -- a full re-analysis of the mixed HTML/C# document on the Roslyn server
      -- flags = { debounce_text_changes = 300 },
      settings = {
        ['csharp|inlay_hints'] = {
          -- csharp_enable_inlay_hints_for_implicit_object_creation = true,
          -- csharp_enable_inlay_hints_for_implicit_variable_types = true,

          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          csharp_enable_inlay_hints_for_types = true,
          dotnet_enable_inlay_hints_for_indexer_parameters = true,
          dotnet_enable_inlay_hints_for_literal_parameters = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          dotnet_enable_inlay_hints_for_other_parameters = true,
          dotnet_enable_inlay_hints_for_parameters = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ['csharp|code_lens'] = {
          dotnet_enable_references_code_lens = true,
        },

        ['csharp|symbol_search'] = {
          dotnet_search_reference_assemblies = true,
        },
      },
    },
    filewatching = false,
  },
}
