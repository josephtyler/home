autocmd FileType python setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
autocmd FileType ruby setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType html setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType htmldjango setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType css setl tabstop=2|setl shiftwidth=2|setl softtabstop=2

set hlsearch
set expandtab
set number
set laststatus=2
set t_Co=256
syntax enable
" let g:solarized_termcolors=256

syntax on
colorscheme django

let mapleader = ","

nmap <C-l> gt
nmap <C-h> gT

com! SD !sudo /var/zimbio/START_DJANGO &
map <leader>s :w<CR>:SD<CR>
map <leader>e :bufdo e!<CR>
map <leader>w :bufdo w!<CR>
map <leader>q :bufdo q!<CR>
map <leader>c :nohlsearch<CR>
map <C-n> :NERDTreeToggle<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim

execute pathogen#infect() 
