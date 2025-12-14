return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.0",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    -- custom keymaps
    local set = vim.keymap.set
    local builtin = require("telescope.builtin")

    -- goes into nvim config folder from anywhere
    local pull_dotfiles = function()
      builtin.find_files( { cwd = vim.fn.stdpath("config") })
    end

    set("n", "<C-d>", pull_dotfiles, { desc = "Find nvim config dir" })
    set("n", "<C-f>", builtin.find_files, { desc = "Find files in cwd" })
    set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

 end
}

