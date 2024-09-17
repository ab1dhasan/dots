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
		-- config = function()
		-- 	vim.cmd.colorscheme 'dracula'
		-- end
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
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		opts = {
			transparent = true,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-storm")
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- opts = {
		-- 	transparent_background = true,
		-- },
		-- config = function(_, opts)
		-- 	require("catppuccin").setup(opts)
		-- 	vim.cmd.colorscheme("catppuccin-macchiato")
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
	-- {
	-- 	"xiyaowong/transparent.nvim"
	-- },
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
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	-- main = 'ibl',
	-- 	config = function()
	-- 		require("ibl").setup()
	-- 		-- require("ibl").setup {
	-- 		-- 	char = "│",
	-- 		-- 	-- context_char = "│",
	-- 		-- 	show_current_context = true,
	-- 		-- 	show_current_context_start = true,
	-- 		-- 	-- whitespace = {
	-- 		-- 	-- 	remove_blankline_trail = false
	-- 		-- 	-- }
	-- 		-- }
	-- 	end
	-- },
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			require('mini.indentscope').setup()
		end
	},
	-- {
	-- 	'VonHeikemen/lsp-zero.nvim',
	-- 	branch = 'v2.x',
	-- 	dependencies = {
	-- 		-- LSP Support
	-- 		{ 'neovim/nvim-lspconfig' },          -- Required
	-- 		{ 'williamboman/mason.nvim' },        -- Optional
	-- 		{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
	--
	-- 		-- Autocompletion
	-- 		{ 'hrsh7th/nvim-cmp' },  -- Required
	-- 		{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
	-- 		{ 'L3MON4D3/LuaSnip' },  -- Required
	-- 		{ 'hrsh7th/cmp-emoji' },
	-- 		{ 'hrsh7th/cmp-buffer' },
	-- 		{ 'hrsh7th/cmp-path' },
	-- 		{ 'hrsh7th/cmp-cmdline' },
	-- 		{ 'saadparwaiz1/cmp_luasnip' }
	-- 	}
	-- },
	-- {
	-- 	"airblade/vim-gitgutter"
	-- },
	{
		"mattn/emmet-vim"
	},
	{ 'folke/trouble.nvim' },
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = " <author> • <date> • <summary> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require('neoscroll').setup({})
		end
	},
	{ 'mg979/vim-visual-multi' },
	{
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip'
	},
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- },
	{
		'lewis6991/gitsigns.nvim',
		config = function ()
			require('gitsigns').setup {
				signs = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged_enable = true,
				signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				sign_priority = 1,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
			}
		end
	},
	{'akinsho/git-conflict.nvim', version = "*", config = true},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require'lsp_signature'.setup(opts) end
	}
})
