set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Vundle ile bundle'lari kurma
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Kurulacak bundle'lar
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim'}
Bundle 'wincent/Command-T'
Bundle 'gmarik/vim-markdown'
Bundle 'L9'
Bundle 'molokai'
Bundle 'jQuery'
Bundle 'Gundo'
Bundle 'FuzzyFinder'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/UltiSnips'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/syntastic'



" leader'i , olarak set ediyorum. elime daha rahat geliyor
let mapleader = ","
let maplocalleader = "  "

" desert candir. Consoles linux'de DejaVu'ya donusecek
colorscheme molokai
set guifont=Consolas:h11

" swap ve backup dosyalarindan kurtulma
set nobackup
set noswapfile

" tab ve indentation'i (shift width) 4e set etme
set ts=4
set sw=4
set cindent
set expandtab

" Cursor'in bulundugu satiri highlight etme
set cursorline

set ttyfast

set relativenumber

" vertical split'de yenisini default sag tarafta yaratma
set splitright

" jj ile esc yapilmasini saglar
inoremap jj <Esc>
" inoremap jk <Esc>

" j ve k file satiri yerine screen satirina gore hareket ediyor
nnoremap j gj
nnoremap k gk

" Command mode'a gecmek icin : kullanmak yerine  ; kullanabilme
nnoremap ; :

" Search'de perl style arama icin
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

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

" Tablar arasinda kolay gezme
noremap <S-H> gT          
noremap <S-L> gt

" Y ile satir sonuna kadar yank'lama. C ve D gibi
nnoremap Y y$

" cd. ile working directory'yi file'in bulundugu folder'a set etme
cnoremap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" ,/ ile search highlight'larini kaldirma. 
" /asdf gibi sacma bi search yapmaya gerek kalmiyor ve 
" search history de oldugu gibi kalmis oluyor
nnoremap <silent> <leader>/ :nohlsearch<CR>

" ,rc ile bu dosyayi vertical splitte acma
" ,sorc ile de bu dosyayi calistirma
" boylece vim'i kapatip acmak gerekmiyor
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>rrc :source $MYVIMRC<cr>

" Paste edilen text'i visual olarak secmeye yarar
nnoremap <leader>v V`]

" fold blocklarini daha sade gosterme
set foldtext=getline(v:foldstart)
set fillchars=fold:\ 

" alt ve yon tuslari ile satirin yerini degistirme
nnoremap <a-j> :m+<CR>==
nnoremap <a-k> :m-2<CR>==
inoremap <a-j> <Esc>:m+<CR>==gi
inoremap <a-k> <Esc>:m-2<CR>==gi
vnoremap <a-j> :m'>+<CR>gv=gv
vnoremap <a-k> :m-2<CR>gv=gv

" Smart way to move between windows
noremap <c-j> <c-W>j
noremap <c-k> <c-W>k
noremap <c-h> <c-W>h
noremap <c-l> <c-W>l

" F4 ile uzerinde bulunulan kelimeyi ayni dizindeki dosyalarda arama
noremap <F4> :execute "Ack -i " . expand("<cword>") . " **" <Bar> cw<CR> 

" Ack ile hizli search icin
nnoremap <leader>a :Ack -i 

" snipmate icin gerekli bu
filetype plugin indent on

" FuzzyFinder ayarlari
nnoremap <leader>f  :FufFile<CR>
nnoremap <leader>b  :FufBuffer<CR>

" CtrlP ile aranan dosyalardan cikarilacaklar
let g:ctrlp_map = '<c-o>'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|cvs)$',
	\ 'file': '\v\.(exe|so|dll|class)$',
	\ }

" YankRing icin kisa yol
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Java'da property'nin ustune gelip ,gs ile getter setter yaratma
nnoremap <leader>gs maviw<esc>bb"tyew"kyegg/}<CR>NO<CR><esc>d0a	public <esc>"tpa get<esc>"kpb3lgUlea() {}<esc>i<CR><esc>Oreturn this.<esc>"kpa;<esc>jo<CR><esc>d0a	public void set<esc>"kpb3lgUlea()<esc>i<esc>"tpa <esc>"kpA {}<esc>i<CR><esc>Othis.<esc>"kpa = <esc>"kpa;<esc>:nohlsearch<CR>`a

nnoremap <leader><space> :%s/\s\+$//g<CR>:nohlsearch<CR>
" bir sonraki parantezin ici
" :onoremap in( :<c-u>normal! f(vi(<cr>

" Taglist plugini icin Toggle
nnoremap <leader>t :TagbarToggle<cr>


" vimrc her source'landiginda autocmd'lar yeniden yaratilmasin diye
" bu sekilde bir kontrol koyuluyor. Eger bu kisma birsey eklenirse
" vimrc source'lanmadan onde :autocmd!  'i calistirin
if !exists("rc_autocommands")
    let rc_autocommands = 1

    " plsql.vim sadace plsql uzuntili dosyalar icin calisiyor.
    " Asagidaki ile genisletiyoruz
    autocmd BufRead *.pkb set syntax=plsql
    autocmd BufRead *.pks set syntax=plsql
    autocmd BufRead *.sql set syntax=plsql

    autocmd BufRead *mylog.txt setlocal guifont=Consolas:h09
    autocmd BufRead *doitmyway.txt setlocal guifont=Consolas:h09
endif

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

