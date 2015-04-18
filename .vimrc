
set nocompatible

if has("win32")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" Vundle ile bundle'lari kurma
filetype off                   " required!
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    let path='~/.vim/bundle'
endif

call vundle#begin(path) 

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" Plugins to insall
" Required for vundle
Plugin 'L9'  
Plugin 'molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'Gundo'
Plugin 'repeat.vim'
Plugin 'surround.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'heartsentwined/vim-emblem'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'majutsushi/tagbar'
Plugin 'lukaszkorecki/CoffeeTags' 
Plugin 'tpope/vim-vinegar'
Plugin 'junegunn/seoul256.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'FuzzyFinder'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'wincent/Command-T'
Plugin 'tpope/vim-projectionist'
Plugin 'elzr/vim-json'

"Plugins for sql formatting
Plugin 'Align'
Plugin 'SQLUtilities'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" leader'i , olarak set ediyorum. elime daha rahat geliyor
let mapleader = ","
let maplocalleader = " "

" Temp'i yazma hakki olan bir yere set etme
" let $TMP = "E:/Temp"

colorscheme molokai
if has("win32")
    set guifont=Consolas:h11
else
    set guifont="Droid Sans Mono 10"
end

" swap ve backup dosyalarindan kurtulma
set nobackup
set noswapfile

" tab ve indentation'i (shift width) 4e set etme
set ts=2
set sw=2
set expandtab

" Cursor'in bulundugu satiri highlight etme
set cursorline

set ttyfast

set relativenumber

" vertical split'de yenisini default sag tarafta yaratma
set splitright
set splitbelow

" jj ile esc yapilmasini saglar
inoremap jj <Esc>

" j ve k file satiri yerine screen satirina gore hareket ediyor
nnoremap j gj
nnoremap k gk


" Search'de perl style arama icin
"nnoremap / /\v
"vnoremap / /\v
"nnoremap ? ?\v
"vnoremap ? ?\v

" Hizli substitude
nnoremap <leader>s :%s/\v
vnoremap <leader>s :'<'>s/\v

" Default case insensitive arama ama uppercase geciyorsa sensitve'e donme
set ignorecase
set smartcase

" Sustitute'lari default global yapma
" set gdefault

" Yazarken search resulti gosterme
set incsearch
set showmatch
set hlsearch

" insert mode'da backspace yapildiginda satir biterse ust satirdan devam etme
set backspace=indent,eol,start

" cursor'in nerede oldugunu gosterme
set ruler

" command completion daha bi cobariyo
set wildmenu
set wildmode=list:longest

set showmode
set showcmd

"Default encoding utf-8 
set encoding=utf-8 nobomb

" Tablar arasinda kolay gezme
noremap <S-H> gT
noremap <S-L> gt

" Y ile satir sonuna kadar yank'lama. C ve D gibi
nnoremap Y y$

" cd. ile working directory'yi file'in bulundugu folder'a set etme
cnoremap cd. lcd %:p:h


" ,/ ile search highlight'larini kaldirma.
" /asdf gibi sacma bi search yapmaya gerek kalmiyor ve
" search history de oldugu gibi kalmis oluyor
nnoremap <silent> <leader>/ :nohlsearch<CR>

" ,rc ile bu dosyayi vertical splitte acma
" ,sorc ile de bu dosyayi calistirma
" boylece vim'i kapatip acmak gerekmiyor
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>rcs :source $MYVIMRC<cr>

" source current file
nnoremap <leader>rs :source %<cr>

" Paste edilen text'i visual olarak secmeye yarar
nnoremap <leader>v V`]

" fold blocklarini daha sade gosterme
set foldtext=getline(v:foldstart)
set fillchars=fold:\

" alt ve yon tuslari ile satirin yerini degistirme
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Smart way to move between windows
noremap <c-j> <c-W>j
noremap <c-k> <c-W>k
noremap <c-h> <c-W>h
noremap <c-l> <c-W>l

"Bos satirlari silme
nnoremap <leader><space> :%s/\s\+$//g<CR>:nohlsearch<CR>


" Plugin ayarlari --------------------------------------------------------

" F4 ile uzerinde bulunulan kelimeyi ayni dizindeki dosyalarda arama. Ack'a  hizli erisim
noremap <F4> :execute "Ack -i " . expand("<cword>") . " **" <Bar> cw<CR>
nnoremap <leader>a :Ack -i

" Gundo Toggle'i cagirma
nnoremap <F5> :GundoToggle<CR>

" FuzzyFinder ayarlari
nnoremap <leader>nf :FufFile<CR>
nnoremap <leader>nb :FufBuffer<CR>
nnoremap <leader>nr :FufRenewCache<CR>

" CtrlP ile aranan dosyalardan cikarilacaklar
let g:ctrlp_map = '<a-n>'
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn|cvs|idea)$',
\ 'file': '\v\.(exe|so|dll|class)$',
\ }

" YankRing icin kisa yol
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Ultisnip

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Tagbar'i acmak icin
nmap <F8> :TagbarToggle<CR>

"Markdown filelarini otomatik algilamasi
autocmd BufNewFile,BufReadPost *.md set filetype=markdow

" vimrc her source'landiginda autocmd'lar yeniden yaratilmasin diye
" bu sekilde bir kontrol koyuluyor. Eger bu kisma birsey eklenirse
" vimrc source'lanmadan onde :autocmd! 'i calistirin
if !exists("rc_autocommands")
    let rc_autocommands = 1
" plsql.vim sadace plsql uzuntili dosyalar icin calisiyor.
" Asagidaki ile genisletiyoruz
    autocmd BufRead *.pkb set syntax=plsql
    autocmd BufRead *.pks set syntax=plsql
    autocmd BufRead *.sql set syntax=plsql
endif

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:sparkupNextMapping="<C-S-n>"

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

"JSON Plugin
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"JSON Format
nnoremap <silent><leader>fj :%!python -m json.tool<CR>

"SQL Format
vnoremap <silent><leader>fs :SQLUFormatter<CR>

"Tablularize
vnoremap <leader>tt :Tabularize /\t<CR>
vnoremap <leader>t, :Tabularize /\,<CR>
vnoremap <leader>t| :Tabularize /|<CR>
