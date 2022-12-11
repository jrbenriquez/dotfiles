" Overview
" Jedi: for go to features for python
" Deoplete: autocompletion
" Fzf: for all searches, files, folders, tags etc
" ALE: linting
" NERDTree: File nav
" Tagbar: quick view 
" exuberant-ctags: tags
" plugins
let need_to_install_plugins = 0
" Use diffirent viminfo/shada file for vim/neovim respectively
if !has('nvim')
  set viminfo+=n~/vim/viminfo
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let need_to_install_plugins = 1
    endif
else
  " Do nothing here to use the neovim default
  " or do soemething like:
   set viminfo+=n~/.shada
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let need_to_install_plugins = 1
    endif
endif

call plug#begin()
" Set of vim defaults we can agree on and hopefully not talk about
Plug 'tpope/vim-sensible'
" Minimalist statusline
Plug 'itchyny/lightline.vim'
" Distraction Free Plugin
Plug 'junegunn/goyo.vim'
" Cool theme
Plug 'joshdick/onedark.vim'
" HTML Tags
Plug 'alvan/vim-closetag' 
" Buffers #1! No tabs
Plug 'ap/vim-buftabline'
" Git info
Plug 'airblade/vim-gitgutter'
" File Navigation
Plug 'fisadev/vim-isort'
" NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Load Tags on the right side
Plug 'majutsushi/tagbar'
" Language specific scripts/plugins
Plug 'vim-scripts/indentpython.vim'
Plug 'pangloss/vim-javascript'
" Black formatter
Plug 'psf/black', { 'branch': 'stable' }
Plug 'maxmellon/vim-jsx-pretty'
" Surround
Plug 'tpope/vim-surround'
" Ack code search (requires ack installed in the system)
"Plug 'mileszs/ack.vim'
" Deoplete
Plug 'Shougo/deoplete.nvim' 
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" FZF Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git Blame
Plug 'zivyangll/git-blame.vim'
Plug 'vimwiki/vimwiki'
" Fun calendar plugin
Plug 'mattn/calendar-vim'
" Autotag
Plug 'craigemery/vim-autotag'
" ALE
Plug 'dense-analysis/ale'
" Show hex colors
Plug 'ap/vim-css-color'
" fancy undo history
Plug 'mbbill/undotree'
Plug 'wakatime/vim-wakatime'
" Auto bracket completion
Plug 'jiangmiao/auto-pairs'
" Commenting plugin
Plug 'scrooloose/nerdcommenter'
" Floatterm
Plug 'voldikss/vim-floaterm'
" vim box-draw
Plug 'gyim/vim-boxdraw'
call plug#end()

set nocompatible
filetype plugin indent on
syntax on

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" fast timeout
set timeoutlen=200
" always show the status bar
set laststatus=2

" enable 256 colors
set t_Co=256
set t_ut=

" show partner
set showmatch

" turn on line numbering
set number relativenumber
set nu rnu

" set leader to space
let mapleader = " "

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Cursor block not thin line
set guicursor=
" Keep Buffers in background
set hidden
set scrolloff=8
set colorcolumn=99,119
set bs=2
set expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2


" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" Tab navigation
"nnoremap tl :tabnext<CR>
"nnoremap th :tabprev<CR>
"nnoremap tn :tabnew<CR>

" Regenerate Tags
nnoremap <leader>rtg :!ctags -R --exclude=node_modules --exclude=.git --exclude=static --exclude=build --exclude=asset --exclude=assets -f tags<CR><CR>
" Breaks the current line where the cursor is"
nnoremap nl i<CR><ESC>
nnoremap nL i<CR><ESC>O
" Go to partner 
map <leader>gp %
nnoremap <C-j> {

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv


" add new line without going to insert mode
nmap oo o<Esc>k 
nmap OO O<Esc>j

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=v
        let g:is_mouse_enabled = 1
    endif
endfunction

" color scheme
syntax on
colorscheme onedark
filetype on
filetype plugin indent on

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }
" code folding
set foldmethod=indent
set foldlevel=99
hi Normal guibg=NONE ctermbg=NONE

" wrap toggle
setlocal nowrap
set nowrap
noremap <silent> <Leader>lw :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

" move through split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-W><C-U> :vsplit<CR>
nnoremap <C-W><C-I> :split<CR>
" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>
nmap <leader>X :bd!<CR>

nnoremap <leader>ts :Buffers<CR>
nnoremap th :bp!<CR>
nnoremap tl :bn!<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 0
let g:NERDTreeGitStatusWithFlags  = 1
let g:nerdtree_open = 0
let g:NERDTreeChDirMode = 2
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
map <leader>d :NERDTreeToggle<CR>
" Find file in tree
nmap ,n :NERDTreeFind<CR>
" Open NERDTree if no args provided
"function! StartUp()
"    if 0 == argc()
"        NERDTree
"    end
"endfunction
"autocmd VimEnter * call StartUp()


nnoremap <C-w>j :50winc <<CR>
nnoremap <C-w>k :50winc ><CR>

" tag list
map tt :TagbarToggle<CR>
" sed stuff
map <C-S> :%s/
map <C-s> :s/
" quick saves
nmap <leader>w :w<CR>
nmap <leader>lx :x<CR>
" command
nnoremap <leader>lc :
nnoremap <leader>lh :noh<CR>

" python comment
vmap <leader>cm :s/^ /#<CR>
nmap <leader>cm :s/^ /#<CR>
" uncomment
vmap <leader>uc :s/^#/ <CR>
nmap <leader>uc :s/^#/ <CR>

"Tag Handling
"End Tag New Line
nnoremap <leader>tg yypa/<ESC>O
"End Tag Inline
nnoremap <leader>ti vF<yf>pbi/<ESC>ba

"Clipboard stuff"
set clipboard=unnamed
" copy, cut and paste
vmap <C-c> "+y
vmap <leader>gc "+y

vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
nnoremap <leader>gu :UndotreeToggle<CR>

" Deoplete -----------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\    'ignore_case': v:true,
\   'smart_case': v:true,
\})

"Tab for selecting suggestions
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" needed so deoplete can auto select the first suggestion
" set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview


" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

let g:fzf_layout = { 'window' : { 'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
let projectroot = trim(execute('pwd'))
" Terminal
nnoremap <C-x> :ter<CR>
tnoremap <C-x> <C-W>N:bd!<CR>

" Quick Fzf
nnoremap <leader>f :execute "Files " . projectroot<CR>
nnoremap <leader>F :Files<CR>
nnoremap <leader>.z :BTags<CR>
nnoremap <leader>z :Tags<CR>
nnoremap <leader>.q :BLines<CR>
nnoremap <leader>q :Rg<CR>
" nnoremap <leader>gst :GFiles?<CR>
nnoremap <leader>gst :Neotree git_status<CR>
" Go To Definition using tags
nmap <leader>gd <C-]>
nnoremap <leader>lt :FloatermNew<CR>
nnoremap <leader>lz :FloatermNew --height=0.9 --width=0.9 lazygit<CR>
nnoremap <leader>lpy :FloatermNew --height=0.9 --width=0.9 python<CR>
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" Quick Ack
" nnoremap <leader>a :Ack

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 1

" All these mappings work only for python code:
" Go to definition
" I use this when looking into a package method/function that is not tracked
" by tags 
let g:jedi#goto_command = '<leader>gx'
" Find ocurrences
let g:jedi#usages_command = '<leader>go'
" Find assignments
let g:jedi#goto_assignments_command = '<leader>ga'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>
" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" Remove Trailing Whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
" Set file status indicator [+] if changed etc..
set laststatus=2
set statusline=[%n]\ %<%f%h%m

"Black keymappings
let g:black_linelength = 120
let g:black_skip_string_normalization = 1
nnoremap <leader>b :Black<CR>
" Disable creation of swap files coz they are annoying
set noswapfile
set exrc
set secure

" Set proper tab spacing in javascript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" For Gruvbox
highlight LineNr ctermfg=grey
" Git blame shortcut"
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
" Consistent python spacing
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


" ALE "
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'less': ['prettier'],
\   'python': ['black', ],
\   'typescript': ['prettier', 'eslint', 'tslint'],
\}

let g:ale_linters = {'python': ['flake8', 'pyflakes']}
let g:ale_python_isort_options = '--profile black --fass --fss --sl'
" ALE Commands "
nnoremap <leader>ll :ALELint<cr>
nnoremap <leader>lf :ALEFix<cr>
"mac spawn
let g:autotagStartMethod='fork'
" vim wiki todo custom checks
let g:vimwiki_listsyms = '✗○◐●✓'

autocmd VimEnter /home/johnreienriquez/vimwiki/diary/**  0r /home/johnreienriquez/vimwiki/diary/todo.template

augroup templates
  au!
  " read in templates files
  autocmd BufNewFile /home/johnreienriquez/vimwiki/diary/** silent! execute '0r /home/johnreienriquez/vimwiki/diary/todo.template'
augroup END

" Presentation Stuff
" No Distract mode
nmap <leader>-gg :Goyo<CR>
nmap <leader>-gx :Goyo<CR>:so ~/.config/nvim/init.vim<CR>
" Bordered Text
nmap <leader>-b :.!toilet -w 200 -f term -F border<CR>
" Heading
nmap <leader>-h :.!toilet -w 200 -f standard<CR>
" SubHeading
nmap <leader>-s :.!toilet -w 200 -f small<CR>
" hide everything
nmap <F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<CR>

" Close Terminal Mode
tnoremap <Esc> <C-\><C-n>:q!<CR>

" Highlight Duplicates
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

nnoremap = :FormatXML<Cr>

" isort
let g:vim_isort_map = '<leader>i'"
