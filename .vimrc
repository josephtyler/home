autocmd FileType python setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
autocmd FileType sh setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
autocmd FileType ruby setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType html setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType htmldjango setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType css setl tabstop=2|setl shiftwidth=2|setl softtabstop=2

" remove all trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

set hlsearch
set expandtab
set number
set laststatus=2
set t_Co=256
set noswapfile
syntax enable
" let g:solarized_termcolors=256

syntax on
colorscheme codeschool

let mapleader = ","
let NERDTreeQuitOnOpen=1

nmap <C-l> gt
nmap <C-h> gT

map <leader>e :bufdo e!<CR>
map <leader>w :bufdo w!<CR>
map <leader>q :bufdo q!<CR>
map <leader>c :nohlsearch<CR>
map <C-n> :NERDTreeToggle<CR>

imap jj <Esc>

set runtimepath^=~/.vim/bundle/ctrlp.vim

execute pathogen#infect()

set wildignore+=*.pyc,bin/*,lib/*

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

if !empty(glob("~/.local.vimrc"))
  source ~/.local.vimrc
endif
