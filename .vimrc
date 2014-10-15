set nocompatible " Necesary for lots of cool vim things set nocompatible

""" Vim addon manager """
"" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on
"
"" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on
"
"" put this line first in ~/.vimrc
"set nocompatible | filetype indent plugin on | syn on
"
"fun SetupVAM()
"	let c = get(g:, 'vim_addon_manager', {})
"	let g:vim_addon_manager = c
"	let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
"	let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
"	" let g:vim_addon_manager = { your config here see "commented version" example and help
"	if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
"		execute '!git clone --depth=1
"		git://github.com/MarcWeber/vim-addon-manager '
"					\shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
"	endif
"	call vam#ActivateAddons([
"				\ 'fugitive',
"				\ 'The_NERD_tree',
"				\ 'ctrlp',
"				\ 'EasyMotion',
"				\ 'LaTeX-Suite_aka_Vim-LaTeX',
"				\ 'Indent_Guides',
"				\ 'keepcase'
"				\], {'auto_install' : 0})
"	" Also See "plugins-per-line" below
"endfun
"call SetupVAM()

""" Pathogen """
execute pathogen#infect()
syntax on
filetype plugin indent on
"""

autocmd FileType * setlocal formatoptions=cqt

syntax on
filetype on
autocmd BufNewFile,BufRead *.icc set filetype=c
set spelllang=en_us
set spellfile=/data/school/research/kamland/dissertation/phd_thesis/vim/spell/en.utf-8.add
set hlsearch
set ignorecase
set smartcase
set incsearch
if $TMUX == '' " don't use unnamed register when using tmux
	set clipboard=unnamed
endif
let mapleader = ","
set cindent
set tw=80
set pastetoggle=<F4>
"set autoindent
"set nu
set backspace=indent,eol,start
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

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

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
set cino+=(0 "Indent align for function variables on more than one line.
set cino+=:0 "Indent 0 for switch case labes.
set cino+=g0 "Indent 0 for scope declaration of class members.

""""""fortran
"set tabstop=6 softtabstop=6 shiftwidth=6 expandtab

""""""bash script
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

""""""mapping
map! jk <Esc>


let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkblue
hi IndentGuidesEven ctermbg=black

" Go to tab by number.
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
noremap <leader>d gT
noremap <leader>f gt

" Go to last active tab.
let g:lasttab = 1
nmap <leader>s :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Split pane.
nmap <silent> <leader>- :new<cr>
nmap <silent> <leader><bar> :vnew<cr>

" Select the pane split.
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
