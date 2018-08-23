call plug#begin('~/.vim/plugged')
" Plugins go here
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
call plug#end()


set expandtab
set shiftwidth=4
set smarttab


set ruler

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

set backup
set backupext=~

set encoding=utf8

try
    lang en_US
catch
endtry

set ignorecase
set smartcase


let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


set wildmenu

set history=500


filetype plugin on
filetype indent on

set autoread

nmap <leader>w :w!<cr>

command W w !sudo tee % > /dev/null


set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif


set hid


set backspace=eol,start,indent
set whichwrap+=<,>,h,l


if has('mouse')
  set mouse=a
endif


set hlsearch
set incsearch


set showmatch 
set mat=2



set noerrorbells
set novisualbell
set t_vb=
set tm=500


syntax enable

set ffs=unix,dos,mac


set nobackup
set nowb
set noswapfile

set shiftwidth=4
set tabstop=4


set lbr
set tw=500


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l




" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

set number
set relativenumber
cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>

" Ctrl-Shift-V to paste properly in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
    set paste
      return ""
endfunction

