vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.clipboard = "unnamedplus"

-- VSCode içindeyken VSCode komutlarını Neovim keymap ile çağır
local function vscode_action(command)
  return function()
    local ok, vscode = pcall(require, "vscode")
    if ok then
      vscode.action(command)
    else
      vim.fn.VSCodeNotify(command)
    end
  end
end

if vim.g.vscode then
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }
-- Productivity mappings
map("n", "<leader>ss", vscode_action("workbench.action.gotoSymbol"), vim.tbl_extend("force", opts, { desc = "Search symbols in file" }))
map("n", "<leader>sS", vscode_action("workbench.action.showAllSymbols"), vim.tbl_extend("force", opts, { desc = "Search symbols in workspace" }))
map("n", "<leader>sp", vscode_action("workbench.actions.view.problems"), vim.tbl_extend("force", opts, { desc = "Show problems" }))
map("n", "<leader>sr", vscode_action("workbench.action.openRecent"), vim.tbl_extend("force", opts, { desc = "Open recent" }))
-- LSP/code navigation via VSCode
map("n", "gd", vscode_action("editor.action.revealDefinition"), vim.tbl_extend("force", opts, { desc = "Go to definition" }))
map("n", "gr", vscode_action("editor.action.goToReferences"), vim.tbl_extend("force", opts, { desc = "Go to references" }))
map("n", "gi", vscode_action("editor.action.goToImplementation"), vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
map("n", "K", vscode_action("editor.action.showHover"), vim.tbl_extend("force", opts, { desc = "Hover" }))

-- Problems navigation
map("n", "]d", vscode_action("editor.action.marker.next"), vim.tbl_extend("force", opts, { desc = "Next problem" }))
map("n", "[d", vscode_action("editor.action.marker.prev"), vim.tbl_extend("force", opts, { desc = "Previous problem" }))

-- Terminal / Git / UI
map("n", "<leader>tt", vscode_action("workbench.action.terminal.toggleTerminal"), vim.tbl_extend("force", opts, { desc = "Toggle terminal" }))
map("n", "<leader>gg", vscode_action("workbench.view.scm"), vim.tbl_extend("force", opts, { desc = "Source control" }))
map("n", "<leader>z", vscode_action("workbench.action.toggleZenMode"), vim.tbl_extend("force", opts, { desc = "Zen mode" }))
map("n", "<leader>u", vscode_action("workbench.action.toggleSidebarVisibility"), vim.tbl_extend("force", opts, { desc = "Toggle sidebar" }))

-- Editor splits
map("n", "<leader>wv", vscode_action("workbench.action.splitEditorRight"), vim.tbl_extend("force", opts, { desc = "Split editor right" }))
map("n", "<leader>ws", vscode_action("workbench.action.splitEditorDown"), vim.tbl_extend("force", opts, { desc = "Split editor down" }))
map("n", "<leader>wh", vscode_action("workbench.action.focusLeftGroup"), vim.tbl_extend("force", opts, { desc = "Focus left group" }))
map("n", "<leader>wl", vscode_action("workbench.action.focusRightGroup"), vim.tbl_extend("force", opts, { desc = "Focus right group" }))

-- Formatting
map("n", "<leader>f", vscode_action("editor.action.formatDocument"), vim.tbl_extend("force", opts, { desc = "Format document" }))
  -- File navigation
  map("n", "<leader>sf", vscode_action("workbench.action.quickOpen"), vim.tbl_extend("force", opts, { desc = "Find files" }))
  map("n", "<leader>sg", vscode_action("workbench.action.findInFiles"), vim.tbl_extend("force", opts, { desc = "Search in files" }))
  map("n", "<leader>e", vscode_action("workbench.view.explorer"), vim.tbl_extend("force", opts, { desc = "Explorer" }))

  -- Editor / buffer navigation
  map("n", "<leader>bd", vscode_action("workbench.action.closeActiveEditor"), vim.tbl_extend("force", opts, { desc = "Close editor" }))
  map("n", "<leader>bo", vscode_action("workbench.action.closeOtherEditors"), vim.tbl_extend("force", opts, { desc = "Close other editors" }))
  map("n", "<S-l>", vscode_action("workbench.action.nextEditor"), vim.tbl_extend("force", opts, { desc = "Next editor" }))
  map("n", "<S-h>", vscode_action("workbench.action.previousEditor"), vim.tbl_extend("force", opts, { desc = "Previous editor" }))

  -- Code actions
  map("n", "<leader>ca", vscode_action("editor.action.codeAction"), vim.tbl_extend("force", opts, { desc = "Code action" }))
  map("n", "<leader>rn", vscode_action("editor.action.rename"), vim.tbl_extend("force", opts, { desc = "Rename symbol" }))

  -- Navigation history
  map("n", "<leader>h", vscode_action("workbench.action.navigateBack"), vim.tbl_extend("force", opts, { desc = "Go back" }))
  map("n", "<leader>l", vscode_action("workbench.action.navigateForward"), vim.tbl_extend("force", opts, { desc = "Go forward" }))
end

-- lazy.nvim kurulum
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Surround: sa, sd, sr
  {
    "nvim-mini/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
    end,
  },

  -- Terminal Neovim için Telescope. VSCode içinde gerek yok.
  {
    "nvim-telescope/telescope.nvim",
    cond = function()
      return not vim.g.vscode
    end,
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search in files" },
      { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    },
    config = function()
      require("telescope").setup({})
    end,
  },
})


