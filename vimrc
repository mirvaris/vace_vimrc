" My Extensions
" ----------------------------------------------------------------

" leader'i , olarak set ediyorum. elime daha rahat geliyor
let mapleader = ","

" desert candir. Consoles linux'de DejaVu'ya donusecek
colorscheme desert
set guifont=Consolas:h11

" swap ve backup dosyalarindan kurtulma
set nobackup
set noswapfile

" tab ve indentation'i (shift width) 4e set etme
set ts=4
set sw=4
set cindent

" vertical split'de yenisini default sag tarafta yaratma
set splitright

" jj ile esc yapilmasini saglar
inoremap jj <Esc>
" inoremap jk <Esc>

" Command mode'a gecmek icin : kullanmak yerine  ; kullanabilme
nnoremap ; :

" insert mode'da backspace yapildiginda satir biterse ust satirdan devam etme
set backspace=indent,eol,start

" cursor'in nerede oldugunu gosterme
set ruler

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
nnoremap <leader>src :source $MYVIMRC<cr>

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
noremap <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR> 

" cshtml uzantili dosyalari html gibi renklendir
au BufNewFile,BufRead *.cshtml set filetype=html

" Pathogen
call pathogen#infect() 
call pathogen#helptags()

" CtrlP ile aranan dosyalardan cikarilacaklar
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|cvs)$',
	\ 'file': '\v\.(exe|so|dll|class)$',
	\ }

" Java'da property'nin ustune gelip ,gs ile getter setter yaratma
nnoremap <leader>gs maviw<esc>bb"tyew"kyegg/}<CR>NO<CR><esc>d0a	public <esc>"tpa get<esc>"kpb3lgUlea() {}<esc>i<CR><esc>Oreturn this.<esc>"kpa;<esc>jo<CR><esc>d0a	public void set<esc>"kpb3lgUlea()<esc>i<esc>"tpa <esc>"kpA {}<esc>i<CR><esc>Othis.<esc>"kpa = <esc>"kpa;<esc>:nohlsearch<CR>`a

" bir sonraki parantezin ici
" :onoremap in( :<c-u>normal! f(vi(<cr>
