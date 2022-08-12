" MinPac Manager Things
" ---------------------

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
call minpac#add('preservim/nerdtree', {'type': 'opt'})
call minpac#add('easymotion/vim-easymotion')
call minpac#add('tversteeg/registers.nvim')
call minpac#add('norcalli/nvim-colorizer.lua')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('lyokha/vim-xkbswitch')


" Colorizer options
" -----------------
set termguicolors
lua require'colorizer'.setup()

" Colorscheme
" ------------

call minpac#add('ayu-theme/ayu-vim')
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Change background color when in Insert mode
autocmd InsertEnter * hi Normal guibg=#190f19
autocmd InsertLeave * hi Normal guibg=#0F1419

" ========================
" Add custom mappings here
" ========================

let mapleader = "\<Space>"

" Cycle tabs left and right
nmap <C-h> :tabp<cr>
nmap <C-l> :tabn<cr>

" NERDTree
" --------
nmap <leader>e :NERDTreeToggle<cr>

" Edit your vimrc in a new tab and source it

nmap <leader>vi :tabedit $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" Move up and down by visible lines if current line is wrapped

nmap j gj
nmap k gk

" Fuzzy Finder Settings and Mappings
" ----------------------------------

" Search for files
nnoremap <leader>o :Files<CR> 

" Search for git files
nnoremap <leader>f :GFiles:<CR>

" Search through buffers	
nmap <leader>b :Buffers<CR>

" Search text in current buffer (for lines)
nmap <leader>l :BLines<CR>

" Search history of opened files	
nmap <leader>h :History<CR>

" Search commands history
nmap <leader>ch :History:<CR>

" Search log
nmap <leader>sl :History/<CR>

" Search help
nmap <leader>sh :Helptags<CR>

" Search tags in current buffer
nmap <leader>st :BTags<CR>

" Search marks
nmap <leader>sm :Marks<CR>

" Fuzzy finder to use ripgrep 
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Enable per-command history
" History files will be stored in the specified directory
" When set, CTRL-N and CTRL-P will be bound to 'next-history' and
" 'previous-history' instead of 'down' and 'up'.

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Insert mode completion

imap <c-x><c-f> <plug>(fzf-complete-path)

" Terminal Mode
" -------------

" Bind leader-Esc to go Normal mode when in terminal
tnoremap <leader><Esc> <C-\><C-n>

" Show terminal cursor when in Normal mode
if has('nvim')
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Windows and Splits
" ------------------

" Alt-hjkl to switch between panes 
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

" Keep at least 4 lines below cursor
set scrolloff=4

" Enable syntax highlighting
syntax on

" Enable enhanced tab autocomplete
set wildmenu                    

" Complete till longest string, then open menu
set wildmode=list:longest,full  

" Tabspaces 2
" -----------
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" Folding
" -------
" set foldmethod=indent
