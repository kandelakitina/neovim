" MinPac Manager Things
" =====================

" MinPac package manager to load first
packadd minpac 			
call minpac#init()

" Update packs
command! PackUpdate call minpac#update() 			

" Clean deleted packs
command! PackClean call minpac#clean() 				

" Show status of addons
command! PackStatus packadd minpac | call minpac#status()

" Show pathtime
command! RuntimePath :echo join(split(&runtimepath, ','), "\n") 

" ==============
" Add packs here
" ==============

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary')

" ========================
" Add custom mappings here
" ========================

let mapleader = "\<Space>"
nmap 0 ^

" Edit your vimrc in a new tab and source it

nmap <leader>vi :tabedit $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" Move up and down by visible lines if current line is wrapped

nmap j gj
nmap k gk

" ==================================
" Fuzzy Finder Settings and Mappings
" ==================================

" Mapping fuzzy finder to leader-o
nnoremap <leader>o :<C-u>FZF<CR> 

" Search in current buffer (for lines)
nmap <leader>f :BLines<CR>

" Search through history of opened files	
nmap <leader>h :History<CR>

" Search through buffers	
nmap <leader>b :Buffers<CR>

" Fuzzy finder to use ripgrep 
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Enable per-command history
" History files will be stored in the specified directory
" When set, CTRL-N and CTRL-P will be bound to 'next-history' and
" 'previous-history' instead of 'down' and 'up'.

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Insert mode completion

imap <c-x><c-f> <plug>(fzf-complete-path)

" =================================
" Terminal Mode Mappings & Settings
" =================================

" Bind leader-Esc to go Normal mode when in terminal
tnoremap <leader><Esc> <C-\><C-n>

" Show terminal cursor when in Normal mode
if has('nvim')
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Alt-hjkl to switch between panes in Terminal mode
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif

" ========
" Settings
" ========

set scrolloff=4                 " Keep at least 4 lines below cursor

" Tabspaces 2
" -----------
set tabstop=2
set shiftwidth=2
set expandtab
