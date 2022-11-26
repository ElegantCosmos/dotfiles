set nocompatible " Necesary for lots of cool vim things set nocompatible

""" Pathogen VIM plugin runtime path manager """
call pathogen#infect()

""" Color scheme
"colorscheme molokai
"let g:molokai_original = 1
colorscheme tender
let g:rehash256 = 1

""" Syntax colors
"syntax on
syntax enable

" Search
set hlsearch
highlight clear Search
highlight Search cterm = bold ctermfg = White ctermbg = DarkGreen
set incsearch

set synmaxcol=9999
filetype plugin on
filetype indent on

""" Recognize .tex files as plaintex for correct vim spell checking """
let g:tex_flavor = "tex"
let g:tex_comment_nospell = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "horizontal"

autocmd FileType * setlocal formatoptions=cqt

set wildmode=longest,list,full " BASH-like tab completion in file search
set wildmenu " list menu in file search
set spelllang=en_us
set scrolloff=1
set ignorecase
set smartcase
set nrformats-=octal
"if $TMUX == '' " don't use unnamed register when using tmux
"	set clipboard = unnamed
"endif
let mapleader=' ' 
set textwidth=80
set pastetoggle=<F4>
"set nu
set smarttab
set complete-=i
set backspace=indent,eol,start
set nojoinspaces
set laststatus=2
set formatoptions=cqt
"set shellcmdflag = ic
set shell=bash\ -l
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
			\ 'left' : '',
			\ 'left_alt': '',
			\ 'right' : '',
			\ 'right_alt' : '',
			\ 'space' : ' '}

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""Gundo
nnoremap <F5> :GundoToggle<CR>

"tab settings
set noexpandtab "default tab setting
"set expandtab "default tab setting
set tabstop=4 softtabstop=4 shiftwidth=4 "default tab setting
"set tabstop=2 softtabstop=2 shiftwidth=2 "default tab setting
noremap <leader>T :set tabstop=4 softtabstop=4 shiftwidth=4<CR>
noremap <leader>t :set tabstop=2 softtabstop=2 shiftwidth=2<CR>
noremap <leader>e :set expandtab<CR>
noremap <leader>E :set noexpandtab<CR>

" Python file indentation commands
augroup python_files
autocmd!
autocmd FileType python setlocal noexpandtab
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4
augroup END

set cino+=N-s
set cino+=(0 "Indent align for function variables on more than one line.
set cino+=:0 "Indent 0 for switch case labes.
set cino+=g0 "Indent 0 for scope declaration of class members.


""" Shortcuts for compilation and execution
noremap <leader>m :!make<CR>
noremap <leader>x :!source setup.sh; python3 %<CR>
noremap <leader>xx :!source setup.sh; python3 %; openlatest<CR>
noremap <leader>x1 :!source setup.sh; python3 %; openlatest 1<CR>
noremap <leader>x2 :!source setup.sh; python3 %; openlatest 2<CR>
noremap <leader>x3 :!source setup.sh; python3 %; openlatest 3<CR>
noremap <leader>x4 :!source setup.sh; python3 %; openlatest 4<CR>
noremap <leader>x5 :!source setup.sh; python3 %; openlatest 5<CR>


""""""fortran
"set tabstop = 6 softtabstop = 6 shiftwidth = 6 expandtab

""""""bash script
"set tabstop = 4 softtabstop = 4 shiftwidth = 4 noexpandtab

""""""mapping
map! jk <Esc>

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
nmap <leader>a :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Split pane.
nmap <silent> <leader>- :new<cr>
nmap <silent> <leader><bar> :vnew<cr>

" Select the pane split.
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

""" Function to create necessary parent directories upon file save """
function! s:MkNonExDir(file, buf)
	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
		let dir = fnamemodify(a:file, ':h')
		if !isdirectory(dir)
			call mkdir(dir, 'p')
		endif
	endif
endfunction
augroup BWCCreateDir
	autocmd!
	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""" Call printer prompt at :print commant
set printexpr=PrintFile(v:fname_in)
function PrintFile(fname)
	call system("gtklp " . a:fname)
	call delete(a:fname)
	return v:shell_error
endfunc

" Use an undo file
set undofile
" Set directory to store the undo history
set undodir=~/.vim/undo//,.
" set creation of backup files and designate common directory them
set backup
set backupdir=~/.vim/backup//,.
" set common directory for swap files
set directory=~/.vim/swp//,.

" search in normal mode while keeping search text in middle of screen
nnoremap <silent> <F4> :call <SID>SearchMode()<CR>
function s:SearchMode()
	if !exists('s:searchmode') || s:searchmode == 0
		echo 'Search next: scroll hit to middle if not on same page'
		nnoremap <silent> n n:call <SID>MaybeMiddle()<CR>
		nnoremap <silent> N N:call <SID>MaybeMiddle()<CR>
		let s:searchmode = 1
	elseif s:searchmode == 1
		echo 'Search next: scroll hit to middle'
		nnoremap n nzz
		nnoremap N Nzz
		let s:searchmode = 2
	else
		echo 'Search next: normal'
		nunmap n
		nunmap N
		let s:searchmode = 0
	endif
endfunction

" If cursor is in first or last line of window, scroll to middle line.
function s:MaybeMiddle()
	if winline() == 1 || winline() == winheight(0)
		normal! zz
	endif
endfunction

"""" Highlighting for spelling
"highlight clear SpellBad
"highlight SpellBad cterm = underline ctermfg = Red
"highlight SpellRare cterm = underline
"highlight SpellCap cterm = underline
"highlight SpellLocal cterm = underline
"highlight SpellBad gui = undercurl " Set style for gVim
"syn match myExCapitalWords +\<\w*[_0-9A-Z-]\w*\>+ contains = @NoSpell " don't check words that include '_', numbers, capital letters
"
"""" Transparent background.
"highlight Normal cterm = none ctermbg = none
highlight DiffAdd cterm = none ctermfg = White ctermbg = DarkBlue
highlight DiffDelete cterm = none ctermfg = White ctermbg = DarkGray
highlight DiffChange cterm = none ctermfg = White ctermbg = DarkYellow
highlight DiffText cterm = bold ctermfg = White ctermbg = DarkRed
"highlight clear LineNr
"highlight clear SignColumn
"highlight LineNr ctermfg = 237

""" Indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
highlight IndentGuidesEven ctermbg = 234
highlight IndentGuidesOdd ctermbg = None

""" Selection highlight color
highlight Visual term = reverse cterm = reverse gui = none

""" fold method
set foldmethod=indent
set foldopen-=search "Do not open fold during search
au BufRead * normal zR
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

""" Status line.
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
"set statusline+=%#StatusLine#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
