set nocompatible " Necesary for lots of cool vim things set nocompatible

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun SetupVAM()
	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = c
	let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
	let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
	" let g:vim_addon_manager = { your config here see "commented version" example and help
	if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
		execute '!git clone --depth=1
		git://github.com/MarcWeber/vim-addon-manager '
					\shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
	endif
	call vam#ActivateAddons(['fugitive', 'The_NERD_tree', 'ctrlp', 'Syntastic', 'EasyMotion', 'LaTeX-Suite_aka_Vim-LaTeX'], {'auto_install' : 0})
	" Also See "plugins-per-line" below
endfun
call SetupVAM()


autocmd FileType * setlocal formatoptions=cqt

syntax on
set spelllang=en_us
set spellfile=/data/school/research/kamland/dissertation/phd_thesis/vim/spell/en.utf-8.add
set hlsearch
set ignorecase
set smartcase
set incsearch
set clipboard=unnamed
let mapleader = ","
set cindent
set tw=80
set pastetoggle=<F4>
"set autoindent
"set nu
set laststatus=2
set formatoptions=cqt
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=[%{&fo}] "show format option list"
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

""""""Gundo
nnoremap <F5> :GundoToggle<CR>

colorscheme darkblue
"colorscheme default
"tab settings
""""""c-like languages
"set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
"set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

""""""fortran
"set tabstop=6 softtabstop=6 shiftwidth=6 expandtab

""""""bash script
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

""""""mapping
"map jk <Esc>
map! jk <Esc>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
"imap <C-d> <C-[>diwi
" Fix keycodes
map ^[OH <Home>
map ^[OF <End>
imap ^[OH <Home>
imap ^[OF <End>

" TERM variable set by screen
"if $TERM == 'screen'
"  set term = xterm
"endif
vmap ,x :!tidy -q -i --show-errors 0<CR>

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkblue
hi IndentGuidesEven ctermbg=black

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
let g:lasttab = 1
nmap <leader>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
