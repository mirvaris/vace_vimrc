" My Extensions
" ----------------------------------------------------------------
colorscheme desert
set guifont=Consolas:h11

" swap ve backup dosyalarindan kurtulma
set nobackup
set noswapfile

" tab ve indentation'i (shift width) 4e set etme
set ts=4
set sw=4
set cindent

" jj ile esc yapilmasini saglar
inoremap jj <Esc>

" Command mode'a gecmek icin : kullanmak yerine  ; kullanabilme
nnoremap ; :

" ,/ ile search highlight'larini kaldirma. 
" /asdf gibi sacma bi search yapmaya gerek kalmiyor ve 
" search history de oldugu gibi kalmis oluyor
nmap <silent> ,/ :nohlsearch<CR>

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

" F4 ile uzerinde bulunulan kelimeyi ayni dizindeki dosyalarda arama
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR> 

" cshtml uzantili dosyalari html gibi renklendir
au BufNewFile,BufRead *.cshtml set filetype=html

" Pathogen
call pathogen#infect() 
call pathogen#helptags()
