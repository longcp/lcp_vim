set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-syntastic/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""
" config
"""""""""""""""""""""""""""""
set nu!
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=3
set tags=tags;
set hlsearch
set incsearch
"set paste
set autoindent 
set cindent
"set incsearch

"""""""""""""""""""""""""""""
" tarbar config
"""""""""""""""""""""""""""""
"nmap <Leader>tb :TagbarToggle<CR>		"快捷键设置
let g:tagbar_ctags_bin='ctags'			"ctags程序的路径
let g:tagbar_width=30					"窗口宽度的设置
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()	"如果是c语言的程序的话，tagbar自动开启

"""""""""""""""""""""""""""""
" nerdtree config
"""""""""""""""""""""""""""""
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""
" miniBufExpl config
"""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
map <F9> :MBEbp<CR>
map <F10> :MBEbn<CR>

"""""""""""""""""""""""""""""
" vim-airline config
"""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""
" autocmd config, remember last edit position
"""""""""""""""""""""""""""""
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

"""""""""""""""""""""""""""""
" cscope config
"""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>

"""""""""""""""""""""""""""""
" auto complete ( [ ' "
"""""""""""""""""""""""""""""
