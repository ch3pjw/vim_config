"Settings for eclim
"let g:EclimProjectTreeAutoOpen = 1
"let g:EclimProjectTreeExpandPathOnOpen = 1
"let g:EclimProjectTreeSharedInstance = 1

"-----------------------------------------
" General settings:
"-----------------------------------------
"Line numbers on:
set nu

"Set up colours nicey:
set t_Co=256
runtime! plugin plugin/guicolorscheme.vim
GuiColorScheme rdark

"Highlight trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"Highlight 81st column:
set colorcolumn=81
highlight ColorColumn guibg=red ctermbg=red

"Highlight overlength lines:
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

"Highlight current line:
set cursorline
highlight CursorLine cterm=underline

"Make braket matching less visually confusing:
highlight MatchParen cterm=bold ctermbg=black ctermfg=white

set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set wildmode=longest,list,full
set wildmenu
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
