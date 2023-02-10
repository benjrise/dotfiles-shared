
set clipboard=unnamed
imap jj <Esc>
vmap ll <Esc> 

" Move up and down at start of each line
nmap <C-k> -
nnoremap <C-J> <C-M>

" Move up and down by half page
nnoremap <s-J> <C-D>zz
nnoremap <s-k> <C-U>zz

" Add the below line to current line
nnoremap <s-U> <s-J>

" Change increment bindings not working
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>

" H and L for moving to beginning and end of line
nmap H ^
nmap L $
