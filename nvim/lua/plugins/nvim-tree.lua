return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  
  config = function()
    -- custom mappings
    local set = vim.keymap.set
    set("n", "<leader>nf", ":NvimTreeFocus<CR>", { desc = "Opens and focuses on File Tree if closed" })
    set("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "Toggles File Tree" })

    -- call setup
    require("nvim-tree").setup {}
  end,
}
