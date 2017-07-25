syntax on
set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set number
"set vb
filetype plugin on
set t_Co=256
autocmd BufEnter * :syntax sync fromstart
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

if &compatible
  set nocompatible
endif
set runtimepath+=/home/ken/.vim/bundles/dein.vim

if dein#load_state('/home/ken/.vim/plugins/')
  call dein#begin('/home/ken/.vim/plugins')

  call dein#add('/home/ken/.vim/bundles/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-syntastic/syntastic')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

map <silent> <C-n> :NERDTreeFocus<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
