" Vim config for Tino Kiviharju 2014-11-29
" Inspired by https://github.com/joedicastro/dotfiles/tree/master/vim

set nocompatible
filetype off

" First time install
let VundleExists=0
let vundle_readme=expand($HOME.'/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let VundleExists=1
endif

" Run :PluginInstall if plugins are not autoinstalled
if has('vim_starting')
  set rtp+=~/.vim/bundle/Vundle.vim
endif

" Vundle + Plugins
call vundle#begin()
" List plugins here
Plugin 'airblade/vim-gitgutter'
Plugin 'gmarik/Vundle.vim.git'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
"Plugin 'klen/python-mode.git' // conflicts with jedi-vim
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'majutsushi/tagbar'
Plugin 'maxmeyer/vim-taskjuggler'
Plugin 'nanotech/jellybeans.vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'rodjek/vim-puppet'
"Plugin 'Rykka/clickable.vim'  See: https://github.com/Rykka/clickable.vim/issues/4
"Plugin 'Rykka/riv.vim'        See: https://github.com/Rykka/riv.vim/issues/86
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'tkharju/snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vimez/vim-tmux'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
call vundle#end()

filetype plugin indent on


if VundleExists == 1
    echo "Installing Plugins"
    echo ""
    :PluginInstall
endif

let mapleader = ","
" we do need , for it's original purpose (opposite of ;)
noremap \ ,

" basic settings
scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set splitright                  " open splits on the right side
set splitbelow                   " open vertical splits below
set mouse=a                     " support mouse
set complete-=i

" search
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" history and undo
set history=1000
set undofile
set undoreload=1000

" zsh like matches
set wildmenu
set wildmode=full
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" tabs etc
set expandtab                  " spaces instead of tabs
set tabstop=2                  " a tab = four spaces
set shiftwidth=2               " number of spaces for auto-indent
set softtabstop=2              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" text width
set textwidth=80
set colorcolumn=81

" color scheme
syntax enable
set background=dark
colorscheme jellybeans
set t_Co=256                   " 256 colors for the terminal

" resize buffers if window size changes
au VimResized * exe "normal! \<c-w>="
nnoremap <silent> + :exe "vertical resize +5"<CR>
nnoremap <silent> - :exe "vertical resize -5"<CR>

" open new file for editing
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe 

" open split
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" system clipboard
map <Leader>y "*y
map <Leader>p "+p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" turn on the spell checking and set the English language
nmap <Leader>se :setlocal spell spelllang=en<CR>

" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>

" use vim contrib plugin. Can match e.g. html tags with %
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" fix typos
iabbrev teh the
iabbrev TK Tino Kiviharju
iabbrev tinohaltu Tino Kiviharju <tino.kiviharju@haltu.fi>
iabbrev tinogmail Tino Kiviharju <tino.kiviharju@gmail.com>
iabbrev @@ tino.kiviharju@gmail.com

" Autocomplete %% to folder of current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" don't have to reach for ESC button. Just do jk
inoremap jk <esc>

" single quote word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" double quote word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" create new file if does not exist
map gf :e <cfile><CR>

" search
set path+=**
set suffixesadd=.py,.txt,.rst,.sls,.pp,.html,.png,.jpg,.jpeg,.gif

" hide highlighted search results with F3
nnoremap <F3> :set hlsearch!<CR>

" save as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" auto reload changes to this file
autocmd! BufWritePost vimrc source %

" Use ranger as file browser
fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>x :call RangerChooser()<CR>

" plugin settings

" tagbar
nmap <F8> :TagbarToggle<CR>

" airline
set noshowmode
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1
set laststatus=2

" commentary
nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
    au FileType sls setlocal commentstring=#\ %s
augroup END

" delimit mate
let delimitMate_expand_space = 1

" indentline
" disable globally. Enable only on some files
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
"let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_fileType = ['python', 'puppet', 'sls', 'html', 'js']
nmap <F6> :IndentLinesToggle<CR>

" syntastic
let g:syntastic_python_checkers = ['pylint', 'flake8', 'pyflakes']
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_cursor_column = 1
let g:syntastic_python_pylint_args="-d C0103,C0111,C0301,F0401,E111,W0232,R0903,C1001,E1002 --indent-string='  ' --generated-members=objects,filter,id,pk,model"
let g:syntastic_python_flake8_args="--ignore=E111,E501,W391"
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" filetypes
" django/html
au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

" json
autocmd BufNewFile,BufRead *.json set ft=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" mutt
au BufRead /tmp/mutt-* set tw=72
augroup filetypedetect
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail
  autocmd FileType mail set nospell formatoptions+=awn2b
augroup END

"taskjuggler
autocmd BufRead,BufNewFile *.tji,*.tjp setfiletype tjp

"docs
autocmd BufRead,BufNewFile *.rst,*.md set spell spelllang=en_us

"docker
autocmd FileType dockerfile setlocal makeprg=docker\ build\ %:h

"puppet
if exists(":Tabularize")
  nmap <Leader>T :Tabularize /=><CR>
endif
autocmd BufNewFile,BufRead *.pp set ft=puppet

" i3 config
autocmd BufEnter *i3/config setlocal filetype=i3

" templates
augroup templates
  autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
augroup END

" python
augroup python
  autocmd BufRead *.py set foldmethod=indent foldnestmax=2
augroup END

" help
autocmd FileType help wincmd L

" whitespaces
if has("autocmd")
  autocmd BufWritePre *.py,*.js,*.html,*.pp,*.sls :call <SID>StripTrailingWhitespaces()
endif

" Strip trailing whitespaces function
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do your thing, remove whitespace (one or more) before line-end
  %s/\s\+$//e
  "Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" ultisnips
let g:ultisnips_python_style = "sphinx"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/snippets/UltiSnips/"

" ctrlp
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'ag %s -l --nocolor --hidden -g ""'
    \ }
endif
nmap <Leader>f :CtrlPBufTag<CR>
nmap <Leader>t :CtrlPTag<CR>

" easytags
let g:easytags_async = 1
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
set tags=./tags;
let g:easytags_dynamic_files = 2

" Ag
nmap <Leader>a :Ag! 
let g:agprg="ag --column --ignore=tags"

" jedi-vim
let g:jedi#popup_on_dot = 1

" NERDTree
nmap <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" backups
function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make dirs if they do not exists
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" fast window movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" local config file for example overriding ctags path in FreeBSD
let s:vimcustomfile = $HOME.'/.vim/local.vim'
if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif

