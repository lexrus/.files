set nocompatible
filetype off

syntax on
colorscheme dracula

" Plugins
call plug#begin('~/.vim/bundle')

if filereadable(expand("~/.vimplug"))
  source ~/.vimplug
endif

call plug#end()

set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmode=longest,list,full

" Folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" 80 column layout concerns
highlight OverLength ctermbg=89 ctermfg=197 guibg=#331111
match OverLength /\%81v.\+/

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Podfile is Ruby
autocmd BufRead,BufNewFile Podfile set filetype=ruby

" Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" Plugin settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Nerd Tree
map <C-l> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YoutCompleteMe
highlight Pmenu ctermfg=119 ctermbg=0 guifg=#87ff5f guibg=#000000
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']

" ultisnips @seealso http://stackoverflow.com/a/22253548
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<s-tab>'

" Go lang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Mutliple Cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_swift = {
  \ 'ctagstype': 'swift',
  \ 'kinds' : [
    \ 'n:Enums',
    \ 't:Typealiases',
    \ 'p:Protocols',
    \ 's:Structs',
    \ 'c:Classes',
    \ 'f:Functions',
    \ 'v:Variables',
    \ 'e:Extensions'
  \ ],
  \ 'sort' : 0
\ }

