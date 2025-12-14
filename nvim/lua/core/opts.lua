-- LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.opt

-- General
set.title = true
set.titlestring = "virgin"
set.number = true
set.relativenumber = true
set.cursorline = true
set.ruler = true
set.termguicolors = true
set.showmatch = true

-- Indentation
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2


-- Search
set.ignorecase = true
set.smartcase = true
set.gdefault = true
set.incsearch = true
set.hlsearch = true
set.wrapscan = true


-- UI
set.mouse = "a"
set.clipboard= "unnamedplus"
