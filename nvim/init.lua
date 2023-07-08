-- Loading vimscript configs
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
local tscope = require('telescope')
local bline = require('bufferline')
local blank = require('indent_blankline')
local catp = require('catppuccin')

-- Treesitter
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

-- Nvim-autopairs <CR> mapping with COC
npairs.setup {
	map_cr = false,
}
_G.MUtils= {}

MUtils.completion_confirm=function()
	if vim.fn["coc#pum#visible"]() ~= 0 then
		return vim.fn["coc#pum#confirm"]()
	else
		return npairs.autopairs_cr()
	end
end
remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})

-- Telescope layout setup
tscope.setup{
	defaults = {
		layout_strategy= 'vertical',
		layout_config = { height = 0.75},
	},
}

-- remaps
remap('n', '<C-f>', ':Telescope find_files<CR>', {noremap = true})
remap('n', '<C-q>', ':bNext<CR>', {noremap = true})
remap('n', '<C-a>', ':bprevious<CR>', {noremap = true})
remap('n', '<C-z>', ':bdelete<CR>', {noremap = true})
remap('n', '<C-x>', ':bdelete!<CR>', {noremap = true})
remap('n', '<C-c>', ':qa!<CR>', {noremap = true})
remap('n', '<C-\\>', ':CommentToggle<CR>', {noremap = true})
remap('v', '<C-\\>', ":'<,'>CommentToggle<CR>", {noremap = true})
remap('i', '<C-\\>', "<esc>:CommentToggle<CR>i", {noremap = true})

-- Bufferline setup
vim.opt.termguicolors = true
bline.setup{
	options = {
		diagnostics = "coc",
		color_icons = true,
		hover = {
			enabled = true,
			reveal = {'close'},
		},
		separator_style = "slope",
		indicator = {
			style = 'underline',
		},
	}
}

-- Indent Blanklines configs & colors
vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#F38BA8 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#FAB387 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#F9E2AF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#A6E3A1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#94E2D5 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#F5E0DC gui=nocombine]]

-- Indent Blanklines
blank.setup {
	show_end_of_line = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
    	},
	show_current_context = true,
	show_current_context_start = true,
}

-- Catppuccin & Integration w/ coc and feline
catp.setup {
	coc_nvim = true,

	virtual_text = {
		errors = { "italic" },
		hints = { "italic" },
		warnings = { "italic" },
		information = { "italic" },
	},

	underlines = {
		errors = { "underline" },
		hints = { "underline" },
		warnings = { "underline" },
		information = { "underline" },
	},
	indent_blankline = {
		enabled = true,
		colored_indent_levels = true,
	},
}

local ctp_feline = require('catppuccin.groups.integrations.feline')
local clrs = require("catppuccin.palettes").get_palette()
local U = require "catppuccin.utils.colors"

ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "",
        file = "",
        lsp = {
            server = "",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    sett = {
        text = U.vary_color({ mocha = clrs.base }, clrs.surface0),
        bkg = U.vary_color({ mocha = clrs.crust }, clrs.surface0),
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = true -- show if the file has been modified
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})

-- Feline statusline setup
require("feline").setup({
	components = ctp_feline.get(),
})

require('nvim_comment').setup()
