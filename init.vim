" MinPac Manager Things {{{1
" --------------------------
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



" Addons list {{{1
" ----------------
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary')
call minpac#add('preservim/nerdtree')
call minpac#add('ggandor/leap.nvim')
call minpac#add('tversteeg/registers.nvim')
call minpac#add('norcalli/nvim-colorizer.lua')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('lyokha/vim-xkbswitch')
call minpac#add('mbbill/undotree')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('tpope/vim-fugitive')
call minpac#add('ayu-theme/ayu-vim')
call minpac#add('chentoast/marks.nvim')


" ALE Linting Plugin. Delete when install something better
call minpac#add('dense-analysis/ale')

" Addons Required Settings {{{1:
" ------------------------
" Marks
:lua require'marks'.setup { default_mappings = true, signs = true, mappings = {}, builtin_marks = { "'", "<", ">", ".", "`", "[", "]" } }

" Leap addon - turn on keybinds (s, S)
:lua require('leap').set_default_keymaps()



" Leader Key Mapping {{{1
" ------------------------
let mapleader = " "

" Windows, Buffers, Splits and Tabs mappings {{{1
" ------------------
" Cycle through and close buffers 
nmap <C-k> :bnext<cr>
nmap <C-j> :bprevious<cr>
nnoremap <C-q> :bd<cr>

" Cycle tabs left and right
nmap <C-h> :tabp<cr>
nmap <C-l> :tabn<cr>

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

" Bind leader-Esc to go Normal mode when in terminal
tnoremap <leader><Esc> <C-\><C-n>



" Fuzzy Finder Settings and Mappings {{{1
" ----------------------------------
" Search for files
nnoremap <leader>o :Files<CR> 

" Search for git files
nnoremap <leader>g :GFiles:<CR>

" Search through buffers	
nnoremap <leader>b :Buffers<CR>

" Search text in current buffer (for lines)
nnoremap <leader>f :BLines<CR>

" Search history of opened files	
nnoremap <leader>r :History<CR>

" Search through all commands
nnoremap <leader>c :Commands<CR>

" Search commands history
nnoremap <leader>lc :History:<CR>

" Search log
nnoremap <leader>ls :History/<CR>

" Search help
nnoremap <leader>h :Helptags<CR>

" Search tags in current buffer
nnoremap <leader>st :BTags<CR>

" Search marks
nnoremap <leader>sm :Marks<CR>

" Fuzzy finder to use ripgrep 
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Enable per-command history
" History files will be stored in the specified directory
" When set, CTRL-N and CTRL-P will be bound to 'next-history' and
" 'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)


" NERDTree Settings and Mappings {{{1
nmap <leader>e :NERDTreeToggle %<cr>

" NERDTree to follow the current buffer
" (this will make NERDTree persistent)
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif


" Other Settings and Mappings {{{1
" -------------------
" Expands %% to the active file directory path in Command line
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

nmap <leader>g :UndotreeToggle<cr>

" Edit your vimrc in a new tab and source it
nmap <leader>vi :tabedit $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>



" Visual Customisation Settings {{{1
" -----------------------------  
" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" Colorizer addon options
set termguicolors
lua require'colorizer'.setup()

" Colorscheme
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Change background color when in Insert mode
autocmd InsertEnter * hi Normal guibg=#190f19
autocmd InsertLeave * hi Normal guibg=#0F1419

" Show terminal cursor when in Normal mode
if has('nvim')
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif



" Random settings {{{1
" --------
" Keep at least 4 lines below cursor
set scrolloff=4

" Enable syntax highlighting
syntax on

" Enable enhanced tab autocomplete
set wildmenu                    

" Complete till longest string, then open menu
set wildmode=list:longest,full  


" Search Settings {{{2
" ---------------
set ignorecase
set smartcase

" Tabspaces 2 {{{2
" -----------
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on


" Tags {{{2
" ---------
" Look for tags recursiverly in parent folders
set tags=tags;

" Generate tags when saving files. Add other filetypes:
autocmd BufWritePost *.py silent! !crags -R &


" Folding {{{2
" ------------
set foldmethod=marker
" }}}
