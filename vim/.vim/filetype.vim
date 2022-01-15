" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
	autocmd! BufNewFile,BufRead *.icc set filetype=cpp
augroup END
