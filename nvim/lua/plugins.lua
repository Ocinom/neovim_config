return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.cmd([[colorscheme duskfox]])
        end
    },
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "c", "rust", "bash", "html", "css",
                    "javascript", "json", "python", "zig", "yaml", "xml" },
				sync_install = false,
				highlight = { 
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
				indent = { enable = true },
			})
		end,
	},
    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = false,
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },

        config = function ()
            local lsp = require("lsp-zero")
            lsp.preset("recommended")

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "rust_analyzer",
                    "eslint",
                    "lua_ls",
                    "bashls",
                    "pyright",
                },
                diagnostic = {
                    refreshSupport = false,
                },
                handlers = {
                    lsp.default_setup,
                },
            })

            local cmp = require("cmp")
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<leader><Up>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<leader><Down>'] = cmp.mapping.select_next_item(cmp_select),
                ['<leader><CR>'] = cmp.mapping.confirm({ select = true }),
                ['<leader><Space>'] = cmp.mapping.complete(),
            })

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<leader><Up>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<leader><Down>'] = cmp.mapping.select_next_item(cmp_select),
                    ['`<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<leader><Space>'] = cmp.mapping.complete(),
                })
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require('telescope').setup({
                pickers = {
                    find_files = {
                        hidden = true
                    },
                    live_grep = {
                        additional_args = function (opts)
                           return {"--hidden"} 
                        end
                    },
                }
            })
            -- require("telescope").load_extension("noice")
            -- require("telescope.builtin").colorscheme("cyberdream")
        end
    },
    {
        "ThePrimeagen/harpoon",
        lazy = false,
    },
    {
        "mbbill/undotree",
        lazy = false,
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
    {
        "jiangmiao/auto-pairs",
        lazy = false,
    },
    {
        "preservim/nerdtree",
        lazy = false,
    },
    {
        "tomtom/tcomment_vim",
        lazy = false,
    },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --     },
    --     dependencies = {
    --        "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     },
    --     config = function ()
    --         require("noice").setup({
    --             lsp = {
    --                 override = {
    --                     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                     ["vim.lsp.util.stylize_markdown"] = true,
    --                     ["cmp.entry.get_documentation"] = true,
    --                 },
    --             },
    --             presets = {
    --                 bottom_search = true, -- use a classic bottom cmdline for search
    --                 command_palette = true, -- position the cmdline and popupmenu together
    --                 long_message_to_split = true, -- long messages will be sent to a split
    --                 inc_rename = false, -- enables an input dialog for inc-rename.nvim
    --                 lsp_doc_border = false, -- add a border to hover docs and signature help
    --             },
    --             commands = {
    --                 errors = {
    --                     view = "split",
    --                 },
    --             },
    --         })
    --     end
    -- },
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = true,
                }
            })
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
    },
    {
        "IogaMaster/neocord",
        event = "VeryLazy",
        config = function ()
            require("neocord").setup({
                log_level = "warn",

                -- Text Options
                editing_text = "Making code spaghetti for %s",
                file_explorer_text = "Lost in the sauce: %s",
                git_commit_text = "Generating merge conflicts...",
                plugin_manager_text = "Breaking configs...",
                reading_text = "Reading %s",
                workspace_text = "Working on stuff",
                line_number_text = "Line %s of %s",
                terminal_text = "Using Terminal",
            })
        end,
    },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                app = 'browser',
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end
    }
    -- {
    --     "iamcco/markdown-preview.nvim",
    -- },
}
