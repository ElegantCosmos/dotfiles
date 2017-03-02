set nocompatible " Necesary for lots of cool vim things set nocompatible

""" Pathogen VIM plugin runtime path manager """
call pathogen#infect()

syntax on
filetype plugin indent on

""" Recognize .tex files as plaintex for correct vim spell checking """
let g:tex_flavor = "tex"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" YCM Debugging.
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

" YCM work-around to select from word list using c-j and c-k.
function! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
endfunction

function! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
endfunction
inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
" End of YCM work-around.

autocmd FileType * setlocal formatoptions=cqt

autocmd BufNewFile,BufRead *.icc set filetype=c
set wildmode=longest,list,full " BASH-like tab completion in file search
set wildmenu " list menu in file search
set spelllang=en_us
set hlsearch
"set scrolloff=2
set ignorecase
set smartcase
set incsearch
if $TMUX == '' " don't use unnamed register when using tmux
	set clipboard=unnamed
endif
let mapleader = ","
set cindent
"set tw=80
set pastetoggle=<F4>
"set autoindent
"set nu
set backspace=indent,eol,start
set nojoinspaces
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

colorscheme default
"colorscheme darkblue
""" Transparent background.
highlight Normal ctermbg=none
highlight Search ctermbg=LightYellow

"tab settings
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab "default tab setting
noremap <leader>T :set tabstop=4 softtabstop=4 shiftwidth=4<CR>
noremap <leader>t :set tabstop=2 softtabstop=2 shiftwidth=2<CR>
noremap <leader>e :set expandtab<CR>
noremap <leader>E :set noexpandtab<CR>
set cino+=(0 "Indent align for function variables on more than one line.
set cino+=:0 "Indent 0 for switch case labes.
set cino+=g0 "Indent 0 for scope declaration of class members.

""""""fortran
"set tabstop=6 softtabstop=6 shiftwidth=6 expandtab

""""""bash script
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

""" fold method
set foldmethod=indent
set foldopen-=search "Do not open fold during search
highlight Folded ctermbg=Black
au BufRead * normal zR

""""""mapping
map! jk <Esc>


let g:indent_guides_auto_colors = 0
highlight IndentGuidesOdd  ctermbg=none
highlight IndentGuidesEven ctermbg=Black

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
        let dir=fnamemodify(a:file, ':h')
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
set undodir=~/.vimundo

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
