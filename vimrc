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

" local config file for example overriding plugin configs
let s:vimcustomheaderfile = $HOME.'/.vim/local_header.vim'
if filereadable(s:vimcustomheaderfile)
    exec 'source '.s:vimcustomheaderfile
endif

" Vundle + Plugins
call vundle#begin()
" List plugins here
Plugin 'airblade/vim-gitgutter'
Plugin 'gmarik/Vundle.vim.git'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'  "// conflicts with python-mode
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
"Plugin 'klen/python-mode.git' "// conflicts with jedi-vim
Plugin 'lepture/vim-jinja'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'majutsushi/tagbar'
Plugin 'maxmeyer/vim-taskjuggler'
"Plugin 'nanotech/jellybeans.vim'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'rodjek/vim-puppet'
Plugin 'markcornick/vim-vagrant'
"Plugin 'Rykka/clickable.vim'  See: https://github.com/Rykka/clickable.vim/issues/4
"Plugin 'Rykka/riv.vim'        See: https://github.com/Rykka/riv.vim/issues/86
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'tkharju/snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'vimez/vim-tmux'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Yggdroot/indentLine'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'voikko/corevoikko', {'rtp': 'tools/vim'}
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'garyburd/go-explorer'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Toggle'
Plugin 'derekwyatt/vim-scala'

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
set cmdheight=3
set shortmess+=T
set foldmethod=manual
set cryptmethod=blowfish2

" search
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set infercase                   " adjust case depending on the text
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
set nowrap
set formatoptions-=t
set textwidth=80
set colorcolumn=81

" dictionary
set dictionary+=/usr/share/dict/words

" color scheme
syntax enable
set background=dark
"colorscheme jellybeans
colorscheme wombat
set t_Co=256                   " 256 colors for the terminal

" resize buffers if window size changes
au VimResized * exe "normal! \<c-w>="
nnoremap <silent> <leader>+ :exe "vertical resize +5"<CR>
nnoremap <silent> <leader>- :exe "vertical resize -5"<CR>

" open new file for editing
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe

" open split
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" system clipboard
set clipboard+=unnamedplus
map <Leader>y "+y
"map <Leader>y "*y
map <Leader>p "+p
"map <Leader>p "*p

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
iabbrev datacenter data center
"iabbrev ... …
iabbrev upcloud UpCloud
iabbrev Upcloud UpCloud
iabbrev isntall install
"iabbrev postgresql PostgreSQL
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

" To switch "foo" to 'foo' do cs"'
" To wrap entire line in quotes: yss"
" To wrap a word in quotes: ysiw'

" create new file if does not exist
map gf :e <cfile><CR>

" search
set path+=**
set suffixesadd=.py,.txt,.rst,.sls,.pp,.html,.png,.jpg,.jpeg,.gif,.erb

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
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1
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
let delimitMate_balance_matchpairs = 1

" indentline
" disable globally. Enable only on some files
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
"let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_fileType = ['python', 'puppet', 'sls', 'html', 'js']
nmap <F6> :IndentLinesToggle<CR>

" syntastic
let g:syntastic_python_checkers = ['prospector']
"let g:syntastic_python_checkers = ['flake8', 'pyflakes']
"let g:syntastic_python_checkers = ['prospector', 'flake8', 'pyflakes']
"let g:syntastic_python_checkers = ['pylint', 'flake8', 'pyflakes']
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_cursor_column = 1
let g:syntastic_python_pylint_args="--load-plugins pylint_django -d C0103,C0111,C0301,F0401,E111,E114,W0232,R0903,C1001,E1002,W0311,W0312 --indent-string='  ' --generated-members=objects,filter,id,pk,model,kwargs,request,as_view"
let g:syntastic_python_flake8_args="--ignore=E111,E114,E501,W391"
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'
let g:syntastic_always_populate_loc_list = 1

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" FILETYPES

" django/html
augroup django_html_autocmd
  au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
  au BufRead,BufNewFile */templates/*.html setlocal tw=0
augroup END

" json
autocmd BufNewFile,BufRead *.json set ft=json

" html
augroup html_autocmd
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html set tw=0
augroup END

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
  autocmd BufRead,BufNewFile *mutt-* set tw=72
  autocmd BufRead,BufNewFile *mutt-* set nohlsearch
  autocmd FileType mail set nospell formatoptions+=awn2b
  autocmd FileType mail let b:vimchant_spellcheck_lang = 'fi'
  "autocmd FileType mail :VimchantSpellCheckOn
augroup END

" taskjuggler
autocmd BufRead,BufNewFile *.tji,*.tjp setfiletype tjp

" docs
augroup docs
  autocmd BufRead,BufNewFile *.rst,*.md setlocal spell
  autocmd BufRead,BufNewFile *.rst,*.md setlocal spelllang=en_us
  autocmd BufRead,BufNewFile *.rst,*.md,*.txt setlocal complete=.,w,b,u,t,k
  "autocmd BufRead,BufNewFile *.rst set fo=want
  autocmd BufRead,BufNewFile *.rst set fo=ant
augroup END

" salt
fun! s:DetectJinja()
  let n = 1
  while n < 50 && n <= line("$")
    " check for jinja
    if getline(n) =~ '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|pillar\|grains\|salt\|trans\)\>'
      set ft=jinja
      return
    endif
    let n = n + 1
  endwhile
endfun
autocmd BufNewFile,BufRead *.* call s:DetectJinja()
autocmd BufNewFile,BufRead *.sls set ft=sls
autocmd BufRead,BufNewFile *.sls set nowrap spelllang=en_us tw=200

" docker
autocmd FileType dockerfile setlocal makeprg=docker\ build\ %:h

" git commit
augroup gitcommit
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal spelllang=en_us
  autocmd FileType gitcommit setlocal complete+=k
augroup END

" mercurial commit
augroup hgcommit
  autocmd FileType hgcommit setlocal spell
  autocmd FileType hgcommit setlocal spelllang=en_us
  autocmd FileType hgcommit setlocal complete+=k
augroup END

" puppet
if exists(":Tabularize")
  nmap <Leader>T :Tabularize /=><CR>
endif
autocmd BufNewFile,BufRead *.pp set ft=puppet

" i3 config
autocmd BufEnter *i3/config setlocal filetype=i3

" xml lint
autocmd FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

" templates
augroup templates
  autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
  autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
augroup END

" python
augroup python
  "autocmd BufRead *.py set foldmethod=indent foldnestmax=2
  autocmd BufRead *.py set foldmethod=manual foldnestmax=2
 	autocmd FileType python setlocal omnifunc=jedi#completions
  if executable('autopep8')
    autocmd FileType python setlocal equalprg=autopep8\ --indent-size\ 2\ /dev/stdin
  endif
augroup END

" help
autocmd FileType help wincmd L

" whitespaces
if has("autocmd")
  autocmd BufWritePre *.py,*.js,*.html,*.pp,*.sls :call <SID>StripTrailingWhitespaces()
endif

nnoremap <leader>e :call <SID>StripTrailingWhitespaces()<CR>

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
  :retab
endfunction

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" tidy html
nnoremap <leader>X :!tidy -q -i --show-errors 0<CR>

" ultisnips
let g:ultisnips_python_style = "sphinx"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/snippets/UltiSnips/"

" ctrlp
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"  let g:ctrlp_user_command = {
"    \ 'types': {
"      \ 1: ['.git', 'cd %s && git ls-files'],
"      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"      \ },
"    \ 'fallback': 'ag %s -l --nocolor --hidden -g ""'
"    \ }
endif
nmap <Leader>f :CtrlPBufTag<CR>
nmap <Leader>t :CtrlPTag<CR>

" easytags
"let g:easytags_async = 1
"let g:easytags_auto_update = 0
"let g:easytags_auto_highlight = 0
""set tags=./tags;,~/.tags/python
"let g:easytags_dynamic_files = 2

set tags=./tags,tags
"autocmd BufWritePost * call system("ctags -R")
nnoremap <F2> :!ctags -R<CR>

" Ag
nmap <Leader>a :Ag! 
let g:ag_prg="ag --column --ignore=tags"

" jedi-vim
let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 1
let g:jedi#use_splits_not_buffers = 'right'
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#force_py_version = 2
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0

" neocomplete
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" python-mode
"let g:pymode_doc = 1
"let g:pymode_rope = 0 
"let g:pymode_rope_autoimport = 0
"let g:pymode_rope_autoimport_import_after_complete = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_goto_definition_cmd = 'e'
"let g:pymode_rope_lookup_project = 0
"let g:pymode_syntax = 0
"let g:pymode_virtualenv = 0
"let g:pymode_syntax_slow_sync = 0
"let g:pymode_syntax_all = 0
"let g:pymode_lint = 0
"let g:pymode_indent = 0
"let g:pymode_folding = 0
"let g:pymode_lint_on_write = 0

" NERDTree
nmap <F4> :NERDTreeToggle<CR>
nnoremap <silent> <Leader><F4> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" tmuxline
"let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_theme = 'jellybeans'

" this one
"let g:tmuxline_preset = 'powerline'

" Run Make with F5
nmap <F5> :Make<CR>

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

" fix spelling with first suggestion
nmap <Leader>s 1z=<CR>

" toggle showing line numbers
nmap <F12> :set invnumber<CR>

" Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" netrw
let g:netrw_silent = 0
let g:netrw_use_errorwindow = 0
let g:netrw_rsync_cmd = "rsync -avz --progress -h"

" local config file for example overriding ctags path in FreeBSD
let s:vimcustomfile = $HOME.'/.vim/local.vim'
if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif

