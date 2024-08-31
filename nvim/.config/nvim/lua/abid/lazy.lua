local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
-- vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{
		'sainnhe/everforest',
		name = "everforest",
		priority = 1000,
		config = function()
			-- vim.g.everforest_background = 'soft'
			-- vim.g.everforest_better_performance = 1
			-- vim.cmd.colorscheme 'everforest'
		end
	},
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'dracula'
		end
	},
	{
		"tanvirtin/monokai.nvim",
		name = "monokai",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'monokai_pro'
		-- end
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme 'gruvbox'
		end
	},
	{
		"Shatur/neovim-ayu",
		name = "ayu",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'ayu-mirage'
		-- end
	},
	{
		"wilmanbarrios/palenight.nvim",
		name = "palenight",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'palenight'
		-- end
	},
	{
		"metalelf0/jellybeans-nvim",
		name = "jellybeans",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'rose-pine-main'
		-- end
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'rose-pine-main'
		-- end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'rose-pine-main'
		-- end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'catppuccin-macchiato'
		-- end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "javascript", "html", "css", "typescript", "lua" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- List of parsers to ignore installing (or "all")
				ignore_install = {},

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true
				}
			}
		end
	},
	-- {
	-- 	"neoclide/coc.nvim",
	-- 	branch = "release"
	-- },
	{
		"jiangmiao/auto-pairs"
	},
	{
		"xiyaowong/transparent.nvim"
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require('lualine').setup({
				options = {
					-- theme = 'ayu_mirage',
					section_separators = '',
					component_separators = ''
				}
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				highlights = {
					buffer_selected = { italic = false }
				}
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				pickers = {
					find_files = {
						theme = 'dropdown',
						hidden = true
					},
					live_grep = {
						theme = 'dropdown',
					}
				}
			})
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- main = 'ibl',
		config = function()
			require("ibl").setup()
			-- require("ibl").setup {
			-- 	char = "│",
			-- 	-- context_char = "│",
			-- 	show_current_context = true,
			-- 	show_current_context_start = true,
			-- 	-- whitespace = {
			-- 	-- 	remove_blankline_trail = false
			-- 	-- }
			-- }
		end
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
			{ 'hrsh7th/cmp-emoji' },
			{ 'hrsh7th/cmp-buffer' }
		}
	},
	{
		"airblade/vim-gitgutter"
	},
	{
		"mattn/emmet-vim"
	},
	{ 'folke/trouble.nvim' }
})
