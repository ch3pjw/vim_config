"Line numbers on:
set nu
set history=1000
"Show line,column percentage% at the bottom
set ruler

"Handle backgrounded buffered better
set hidden
"Make the terminal title reflect the current file
set title
"Stifle interruptive prompts such as "Press ENTER or type command to continue"
set shortmess=atI

"Set up colours nicey:
set t_Co=256
runtime! plugin plugin/guicolorscheme.vim
GuiColorScheme rdark

"Highlight trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"Set the textwidth, turn off automatic wrapping and highlight a column:
set textwidth=79
set formatoptions-=t
set colorcolumn=+2
highlight ColorColumn ctermbg=235

"Highlight overlength lines:
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

"Highlight current line:
set cursorline
highlight CursorLine cterm=underline ctermbg=bg
"Add more context around the current line when scrolling
set scrolloff=3

"Make braket matching less visually confusing:
highlight MatchParen cterm=bold ctermbg=black ctermfg=white
"Match more things for jumping with %
runtime macros/matchit.vim

"Hightlight search patterns and do so as they are typed
set hlsearch
set incsearch

"Swap ` and ' so that jumping to marks jumps to the line AND column with '
nnoremap ' `
nnoremap ` '

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

"make vim save and load the folding of the document each time it loads
"also places the cursor in the last place that it was left.
" FIXME: Fights with pymode opening up docs and stuff
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"Enable pathogen for smart package management stuff
execute pathogen#infect()

"------------------------------------------------------------------------------
" Python mode specific options
"------------------------------------------------------------------------------
let g:pymode_lint_ignore = "E301,"
let g:pymode_lint_checker = ['pyflakes', 'pep8', 'pep257', 'pylint']
let g:pymode_lint_unmodified = 1
" Map some keys to jump between errors in file
nmap ! :PymodeLint<CR>
nmap ]1 :cnext<CR>
nmap [1 :cprev<CR>
nmap [! :cfirst<CR>
nmap ]! :clast<CR>
