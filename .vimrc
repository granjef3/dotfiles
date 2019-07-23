""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Necessary for cool features of vim
set nocompatible

" Enable syntax highlighting
syntax enable

" If you want mouse support
set mouse=a

" https://github.com/numirias/security
set nomodeline

" Make windows use ~/.vim too, I don't want to use _vimfiles
if has('win32') || has('win64')
    set runtimepath^=~/.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug
" Automatic installaion of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" fancy status lines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot' " Syntax, colour schemes and the line

Plug 'jreybert/vimagit' " git status thing TODO(LEARN)
Plug 'tpope/vim-fugitive' " git wrapper TODO(LEARN)
Plug 'airblade/vim-gitgutter' " git diff stuff in the gutter TODO(Explore alternative vim-signify)

Plug 'tpope/vim-sleuth' " autodetect buffer settings
Plug 'tpope/vim-repeat' " make . (repeat) work for more plugins

Plug 'tpope/vim-endwise' " add end after if etc
Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-unimpaired' " add complementary pairs of mappings [b and ]b are here! TODO(LEARN)
Plug 'tpope/vim-surround' " commands for surrounds TODO(LEARN, EXTEND)
Plug 'tpope/vim-commentary' " comment and uncomment lines TODO(LEARN)
Plug 'mattn/emmet-vim' " make html input suck less TODO(LEARN)

" fzf searching, need to bind to ctrl-p
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/syntastic' " syntax checking

Plug 'Yggdroot/indentLine' " show indent level
Plug 'terryma/vim-multiple-cursors' " sublime text style multiple cursors TODO(LEARN)
Plug 'Lokaltog/vim-easymotion' " god tier navigation stuff
Plug 'andymass/vim-matchup' " stuff for %. vim-surround, vim-sandwitch, are related

Plug 'christoomey/vim-tmux-navigator' " TODO(LEARN)
Plug 'godlygeek/tabular' " align text TODO(LEARN)

" Tab Completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Undo tree
Plug 'simnalamburt/vim-mundo'

" Project auto-cd
Plug 'airblade/vim-rooter'

" explore adding targets.vim, vim-projectionist, ctrlsf.vim
" learn fugitive linewise commit commands
" learn how to do git diffs in fugitive
" see if vim-sandwitch beats vim-surround
" learn vim-matchup, tabular, coc.nvim, etc etc

" Enable file type detection. Do this after Vundle calls
call plug#end()

filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mousehide
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" fuck swap files
set noswapfile

" backup files (~) in a common location if possible
set backupdir=~/.vim/backup/,~/tmp,.
set backup

" turn on undo files, put them in a common location
set undodir=~/.vim/undo/
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Fast saving
nnoremap <leader>w :w!<cr>

" Force saving files that require root permission
cmap w!! !runas /noprofile /user:Administrator 'w %'

" Make sure airline is always showing
set laststatus=2

" Always show current position
set ruler

" Smart line numbers
autocmd FocusLost   * call LineNumberSet(1)
autocmd FocusGained * call LineNumberSet(0)
autocmd InsertEnter * call LineNumberSet(1)
autocmd InsertLeave * call LineNumberSet(0)

function! LineNumberSet(state)
  if(a:state == 1)
    set norelativenumber
    set number
    highlight LineNr ctermfg=yellow
  else
    set relativenumber
    highlight LineNr ctermfg=green
  endif
endfunction

noremap <leader>m :call LineNumberSet(&relativenumber)<cr>

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2


" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set tm=500

"This unsets the "last search pattern" register by hitting return
nnoremap <cr> :noh<cr><cr>

" turn off ctrl-c in insert mode
inoremap <C-c> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
colorscheme gruvbox

set termguicolors
set background=dark
syntax enable

" Highlight eol whitespace
match Todo /\s\+$/

let g:airline_powerline_fonts = 1

if has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, splits and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Smart way to move between splits
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Close the current buffer
nmap <leader>q :Bclose<cr>

" Close current buffer and delete split
nmap <leader>qq :bd!<cr>

" Close all the buffers
nmap <leader>qa :%bd!<cr>

" Switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" exit terminal in nvim like normal
" <Esc> works for <C-[> too
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fix emmmets leader
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key='<C-y>'

" make syntastic not suck
let g:syntastic_always_populate_loc_list = 1

" indentline char
let g:indentLine_char = '┊'
:set list lcs=tab:\┊\·

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme                        = 'gruvbox'
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled = 1

" EasyMotion
let g:EasyMotion_smartcase         = 1
let g:EasyMotion_do_mapping        = 0
let g:EasyMotion_off_screen_search = 1

" autoclose
let g:AutoClosePreserveDotReg = 0

" stock vim bindings suck
" replace with easymotion ones
nmap f <Plug>(easymotion-s)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-bd-t)
nmap <Leader>t <Plug>(easymotion-bd-t2)

" Gif config
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Mundo
nnoremap <leader>u :MundoToggle<cr>

" FZF
nnoremap <leader>p :Files<cr>

command! -bang -nargs=* Rgg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <leader>o :Rgg<cr>
nnoremap <leader>b :Buffers<cr>

" CoC

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=250

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" git plugin config

" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = 'ﰣ'
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

" Open vimagit pane
nnoremap <leader>gm :Magit<CR>

" Open fugitive pane
nnoremap <Leader>gs :Gstatus<CR>

" Show commits for every source line
nnoremap <Leader>gb :Gblame<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" conceal level for markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Javascript tab size/linting
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
let g:syntastic_javascript_checkers = ['eslint']
