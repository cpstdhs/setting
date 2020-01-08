" Syntax Highlighting
if has("syntax")
	syntax on
endif
set autoindent
set cindent
set background=dark
syntax enable
colorscheme monokai

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')
	 
	" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Syntastic'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
  
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
  
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

" delimitMate
let delimitMate_expand_cr=1
	" Keep Plugin commands between vundle#begin/end.
	 
	" vim-airline
	 
	" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo at http://vim-scripts.org/vim/scripts.html; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
function! Execute()
    :w
if expand('%:e') == 'c'
        !gcc -o %:r %
        !./%:r
elseif expand('%:e') == 'cpp'
        !g++ -o %:r %
        !./%:r
elseif expand('%:e') == 'py'
        !python %
elseif expand('%:e') == 'py3'
        !python3 %
elseif expand('%:e') == 'php'
        !php %
elseif expand('%:e') == 'js'
        !node %
elseif expand('%:e') == 'fsx'
        !fsharpc -o %:r %
        !./%:r
else
        !bash %
endif
endfunction
function! Bufs()
    let i = bufnr('$')
    let j = 0
    while i >= 1
        if buflisted(i)
            let j+=1
        endif
        let i-=1
    endwhile
    return j
endfunction
function! SaveQuite()
if Bufs() == 1
    :wq
else
    :w
    :bd
endif
endfunction
function! Quite()
if Bufs() == 1
    :q!
else
    :bd!
endif
endfunction
nmap <CR> :call Execute()<CR>
nmap q <Nop>
nmap wq :call SaveQuite()<CR>
nmap Q :call Quite()<CR>
nmap W :w!<CR>
