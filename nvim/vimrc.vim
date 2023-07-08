call plug#begin()

" Everything NERDTree related
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

Plug 'dense-analysis/ale'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'feline-nvim/feline.nvim'

Plug 'nvim-tree/nvim-web-devicons'

Plug 'terrortylor/nvim-comment'

Plug 'windwp/nvim-autopairs'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'akinsho/bufferline.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'rust-lang/rust.vim'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

" Python venv
let g:python3_host_prog = '/home/monico/.pyenv/bin/python3.11'

" Set leader key
let mapleader = '`'

" Enable if you want NERDTree to open on startup
" autocmd VimEnter * NERDTree

" NERDTree keybind
nnoremap <leader>t :NERDTreeToggle<CR>

" Window navigation
nnoremap <leader><Left> <C-w><Left>
nnoremap <leader><Right> <C-w><Right>
nnoremap <leader><Up> <C-w><Up>
nnoremap <leader><Down> <C-w><Down>

" Ctrl-up and ctrl-down to navigate faster
nnoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
nnoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
inoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
inoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
vnoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
vnoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>

" Coc remaps
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"


" Color Scheme
colorscheme catppuccin-mocha


set number

set mouse=a

function! AddTag(tag)
	return ':s/\S.*\S/<' . a:tag . '>&<\/' . a:tag . '>/ | noh'
endfunction

function! RemoveTag(tag)
	return a:tag ? ':s/<\/\=' . a:tag . '>//g | noh' : ':s/.*\zs<\/\w\+>// | :s/<\w\+>// | noh'
endfunction

command -nargs=1 ATag :execute AddTag('<args>')
command -nargs=? RTag :execute RemoveTag('<args>')

command -nargs=0 Strong :execute AddTag('strong')
command -nargs=0 Nostrong :execute RemoveTag('strong')

command -nargs=0 Emph :execute AddTag('em')
command -nargs=0 Noemph :execute RemoveTag('em')


" let g:expand_kws = {"world": "this works!",}
"
" function! Check_expand() abort
" 	let word = expand("<cword>")
" 	if has_key(g:expand_kws, word)
" 		return g:expand_kws[word]
" 	else
" 		return "."
" 	endif
" endfunction
"
" function! Insert_dot() abort
" 	execute "normal A."
" endfunction
"
" function! Kw_replace() abort
" 	let word = Check_expand()
" 	execute "normal bdwi" + word
" endfunction
"
" inoremap  . <Esc>echo Check_expand == "." ? Insert_dot() : Kw_replace()<CR>
