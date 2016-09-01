autocmd FileType python setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
autocmd FileType php setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
autocmd FileType sh setl tabstop=4|setl shiftwidth=4|setl softtabstop=4
autocmd FileType ruby setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType html setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType yaml setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType htmldjango setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType css setl tabstop=2|setl shiftwidth=2|setl softtabstop=2
autocmd FileType scss setl tabstop=2|setl shiftwidth=2|setl softtabstop=2

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
map <leader>r :SyntasticReset<CR>

imap jj <Esc>

set runtimepath^=~/.vim/bundle/ctrlp.vim

execute pathogen#infect()

set wildignore+=*.pyc,bin/*,lib/*

" better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" folding
set foldmethod=syntax
set foldlevel=99
nnoremap <space> za

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

if !empty(glob("~/.local.vimrc"))
  source ~/.local.vimrc
endif

" powerline
set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" buffergator
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"
