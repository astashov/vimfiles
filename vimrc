" Many things are stolen from
" https://github.com/miripiruni/vimi
" https://github.com/akitaonrails/vimfiles

" Enabling Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Tabs, shifts, etc
autocmd FileType css set shiftwidth=4
autocmd FileType css set ts=4
autocmd FileType css set bs=2
autocmd FileType cpp set shiftwidth=4
autocmd FileType cpp set ts=4
autocmd FileType cpp set bs=2
autocmd FileType javascript set shiftwidth=4
autocmd FileType javascript set ts=4
autocmd FileType javascript set bs=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set ts=2
autocmd FileType ruby set bs=2
autocmd FileType c,java,python,xml,xhtml,html set shiftwidth=2
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et

augroup filetypedetect
  au! BufNewFile,BufRead *.ch setf cheat
  au! BufNewFile,BufRead *.liquid setf liquid
  au! BufNewFile,BufRead *.haml setfiletype haml
  au! BufNewFile,BufRead *.yml setf eruby
  au! BufNewFile,BufRead *.rsel setf ruby
  au! BufNewFile,BufRead *.markdown setf mkd
  au! BufNewFile,BufRead Gemfile*, Capfile setf ruby
augroup END

au! BufWrite *.js JSLint
au! BufHidden,BufUnload,BufLeave,BufWinLeave *.js JSLintClear
map <F4> JSLintLight

set ts=2
set bs=2
set shiftwidth=2

" For grep command
set grepprg=grep\ -r\ -n\ --exclude=\*\.\{svn,git,un~,swp,swo\}\*\ $*\ /dev/null

" Persistent undo!!!
set undofile
set colorcolumn=80

" Remove all trailing spaces
command! -nargs=0 Rc exe "%s\/\\s\\+$\/\/"
" Vim Ruby Debugger settings

let g:ruby_debugger_debug_mode = 1
let g:ruby_debugger_spec_path = 'rspec'
let g:ruby_debugger_default_script = 'script/rails s'
let g:ruby_debugger_progname = 'mvim'

map <A-b>  :call g:RubyDebugger.toggle_breakpoint()<CR>
map <A-v>  :call g:RubyDebugger.open_variables()<CR>
map <A-m>  :call g:RubyDebugger.open_breakpoints()<CR>
map <F7>  :call g:RubyDebugger.step()<CR>
map <F5>  :call g:RubyDebugger.next()<CR>
map <F8>  :call g:RubyDebugger.continue()<CR>
map <A-e>  :call g:RubyDebugger.exit()<CR>
map <A-d>  :call g:RubyDebugger.remove_breakpoints()<CR>

nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
nnoremap <C-B> :BufExplorer<cr>
nmap <C-C> "+yi
imap <C-V> <esc>"+gPi

"map to Command-T FuzzyFinder-like file matcher
nnoremap <c-f> :CommandT<CR>
let g:CommandTMatchWindowAtTop = 1

colorscheme railscasts
set hidden " this allows to edit several files in the same time without having to save them
set guioptions=r " Show only right scrollbar
set nocompatible " We're running Vim, not Vi!
set guifont=Monaco:h16
set background=dark
let g:solarized_diffmode="high" " To better diff highlighting
set showmatch  " Show matching brackets.
set list " display unprintable characters
set clipboard+=unnamed  " Yanks go on clipboard instead.
set nowrap  " Line wrapping off
set nu " Line numbers on
set formatoptions=tcqr
set autoindent
set wildmenu " Suggest by Tab in command line
set listchars=tab:\ \ ,trail:·,extends:→,precedes:←,nbsp:×
set ignorecase smartcase gdefault nocp incsearch " Incremental search
set t_Co=256

" n и N, always center search results
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


" K to split
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
" becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
nnoremap K <nop>
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^

" It's 2011. Don't skip wrap lines during moving up and down
noremap j gj
noremap k gk

" Create empty split related to the current one
nmap <Leader><left>  :leftabove  vnew<CR>
nmap <Leader><right> :rightbelow vnew<CR>
nmap <Leader><up>    :leftabove  new<CR>
nmap <Leader><down>  :rightbelow new<CR>

" \c
" camelCase => camel_case
vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>

" save file with root permissions"
cmap w!! %!sudo tee > /dev/null % 

" AutoReload .vimrc
autocmd! bufwritepost .vimrc source $MYVIMRC

" Don't show matching parenthese
let loaded_matchparen=1 " don't just to mathinc parenthese. +100 to speed
set noshowmatch " Don't show paired <> in HTML

" Move lines
" Move one line
nmap <C-S-k> ddkP
nmap <C-S-j> ddp
" Move several lines in visual mode
" http://www.vim.org/scripts/script.php?script_id=1590
vmap <C-S-k> xkP'[V']
vmap <C-S-j> xp'[V']

filetype on
filetype indent on
filetype plugin on

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum
