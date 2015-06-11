syn match texText "\<\w\+\>" transparent contained contains=@Spell
syn region texFigure matchgroup=texSection start='\\begin\s*{\s*figure\s*}' end='\\end\s*{\s*figure\s*}' transparent contains=texText
"syn region texCaption matchgroup=texSection start='\\caption\s*{' end='}' contains=@Spell
