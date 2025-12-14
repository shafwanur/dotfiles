-- LSP servers contained in root/lsp
-- Add to the list below for them to be enabled
vim.lsp.enable({
  "lua-language-server",
  "rust-analyzer",
  "ts_ls",
  "pyright",
  "clangd",
  "bashls"
})

-- Native completion and custom keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local set = vim.keymap.set
    local buf = vim.lsp.buf
    
    local opts = {
      noremap = true,
      silent = true,
      buffer = ev.buf
    }

    -- The following keymaps are shared by all LSPs
    set("n", "gd", buf.definition, opts)
    set("n", "gD", buf.declaration, opts)
    set("n", "gr", buf.references, opts)
    set("n", "gi", buf.implementation, opts)
    set("n", "K", buf.hover, opts)
    set("n", "<leader>rn", buf.rename, opts)
    set("n", "<leader>ca", buf.code_action, opts)

    -- formats code if available
    if client.server_capabilities.documentFormattingProvider then
      set("n", "F", buf.format, opts)
    end

    -- Completion setup
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

  end,
})

vim.cmd("set completeopt+=noselect")

vim.o.winborder = "rounded"

-- Native diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor lline
    -- current_line = true,
  -- },
})

-- Enables inlay hints
vim.lsp.inlay_hint.enable(true)


-- RUST ONLY
-- Runs `cargo fmt` on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

