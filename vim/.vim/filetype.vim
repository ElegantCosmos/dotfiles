" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
	autocmd! BufNewFile,BufRead *.icc set filetype=cpp
	autocmd BufNewFile,BufRead *.i set filetype=mcnp
	autocmd BufNewFile,BufRead *.inp set filetype=mcnp
augroup END
