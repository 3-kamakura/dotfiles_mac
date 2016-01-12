" Vimの設定ファイルとかのホームディレクトリ
let $VIMHOME = $HOME . '/dotfiles/.vim'

"---------------------------
" Neobundle
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"---------------------------
" 管理プラグイン一覧
"---------------------------
" カラースキーマ
NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'altercation/vim-colors-solarized'

" 一般
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'grep.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/vimshell.vim', {
\   'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\   },
\ }
NeoBundle 'Shougo/unite.vim'

" 開発全般
NeoBundle 'tyru/caw.vim.git'

" 入力補完
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"
" NeoBundle 'szw/vim-tags'
NeoBundle 'soramugi/auto-ctags.vim'

" コード実行
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }

" 構文解析
NeoBundle 'scrooloose/syntastic'

" JavaScript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'myhere/vim-nodejs-complete'
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

" Rails
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'glidenote/rspec-result-syntax'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()

"---------------------------
" カラースキーマ
"---------------------------
syntax on
if $TERM == 'screen'
  set t_Co=256
endif
colorscheme Tomorrow-Night-Bright

hi LineNr ctermfg=244

hi Pmenu ctermbg=237
hi PmenuSel ctermfg=33 ctermbg=220
hi PMenuSbar ctermbg=4
hi Visual cterm=reverse ctermfg=32 ctermbg=220
hi Search cterm=reverse ctermfg=32 ctermbg=220
hi IncSearch cterm=reverse ctermfg=160 ctermbg=220

"---------------------------
" vim-indent-guides
"---------------------------
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=238
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=2

"---------------------------
" NERDTree
"---------------------------
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

"---------------------------
" lightline.vim
"---------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ }
      \ }

"---------------------------
" caw.vim.git
"---------------------------
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

"---------------------------
" neocomplete
"---------------------------
" 補完ウィンドウの設定
set completeopt=menuone
let g:acp_enableAtStartup = 0
" 起動時に有効化
let g:neocomplete#enable_at_startup = 1
" 補完候補検索時に大文字・小文字を無視する
let g:neocomplete#enable_ignore_case = 1
" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 3
" -入力による候補番号の表示
let g:neocomplete#enable_quick_match = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長を3に
" let g:neocomplete#min_syntax_length = 3
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#enable_camel_case = 0

"補完するためのキーワードパターンを指定
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

"カーソルより後のキーワードパターンを認識。
""h|geとなっている状態(|はカーソル)で、hogeを補完したときに後ろのキーワードを認識してho|geと補完する機能。
if !exists('g:neocomplcache_next_keyword_patterns')
  let g:neocomplcache_next_keyword_patterns = {}
endif

" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" C-jで補完ウィンドウを閉じる(改行無し)
inoremap <expr><C-j> neocomplete#smart_close_popup()
" C-h, BSで補完ウィンドウを確実に閉じる
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<BS>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" スニペットファイルの場所指定
let g:neosnippet#snippets_directory = $VIMHOME.'/bundle/vim-snippets/snippets, '.$VIMHOME.'/snippets'
" <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" 辞書登録
let g:neocomplete#keyword_patterns._ = '\h\w*'
let g:neocomplete#sources#dictionary = $RSENSE_HOME
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'rb' : $VIMHOME.'/dict/ruby.dict',
  \ 'js' : $VIMHOME.'/dict/javascript.dict'
\ }

" ファイル名で区別出来る場合は直接呼び出し
" ファイル名で区別できない場合は一旦関数に投げる
augroup filetypedetect
  autocmd!  BufEnter *rb call s:LoadRailsSnippet()
augroup END

" rails用スニペット呼び出し関数
function! s:LoadRailsSnippet()
  " カレントディレクトリのディレクトリパス（絶対パス）取得
  let s:current_file_path = expand("%:p:h")
  " specフォルダ内
  if ( s:current_file_path =~ "spec/" )
    NeoSnippetSource ~/dotfiles/.vim/snippets/ruby_snip/ruby.rails.rspec.snip
  " appフォルダ内でなければ無視
  elseif ( s:current_file_path !~ "app/" )
    return
  " app/modelsフォルダ内
  elseif ( s:current_file_path =~ "app/models" )
    NeoSnippetSource ~/dotfiles/.vim/snippets/ruby_snip/ruby.rails.model.snip
  " app/controllersフォルダ内
  elseif ( s:current_file_path =~ "app/controllers" )
    NeoSnippetSource ~/dotfiles/.vim/snippets/ruby_snip/ruby.rails.controller.snip
  " app/viewsフォルダ内
  elseif ( s:current_file_path =~ "app/views" )
    NeoSnippetSource ~/dotfiles/.vim/snippets/ruby_snip/ruby.rails.view.snip
    NeoSnippetSource ~/dotfiles/.vim/snippets/vim-snippets/html.snippets
  endif
endfunction

"---------------------------
" neocomplete + smartinput
"---------------------------
if neobundle#tap('vim-smartinput')
  call neobundle#config({
    \ 'autoload' : {
    \   'insert' : 1
    \ }
  \ })

  function! neobundle#tapped.hooks.on_post_source(bundle)
    call smartinput_endwise#define_default_rules()
  endfunction

  call neobundle#untap()
endif

if neobundle#tap('vim-smartinput-endwise')
  function! neobundle#tapped.hooks.on_post_source(bundle)
    " neosnippet and neocomplete compatible
    call smartinput#map_to_trigger('i', '<Plug>(vimrc_cr)', '<Enter>', '<Enter>')
    imap <expr><CR> !pumvisible() ? "\<Plug>(vimrc_cr)" :
      \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
      \ neocomplete#close_popup()
  endfunction
  call neobundle#untap()
endif

"---------------------------
" vim-tags
"---------------------------
" let g:vim_tags_project_tags_command = "ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
" au BufNewFile,BufRead *.rb let g:vim_tags_project_tags_command = \"ctags --languages=ruby -f ~/tags/ruby.tags `pwd` 2>/dev/null &"
" au BufNewFile,BufRead *.js let g:vim_tags_project_tags_command = \"ctags --languages=javascript -f ~/tags/javascript.tags `pwd` 2>/dev/null &"

"---------------------------
" auto-ctags.vim
"---------------------------
let g:auto_ctags = 1
let g:auto_ctags_filetype_mode = 1
let g:auto_ctags_directory_list = ['.git', '.svn']

"---------------------------
" vim-quickrun
"---------------------------
" " quickrunの出力結果にAnsiEscを実行して色付けする
" autocmd FileType quickrun AnsiEsc

let $JS_CMD='node'

let g:quickrun_config = {'*': {'split': 'below 10sp'}}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'exec': 'bundle exec %c %o %s%a',
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'filetype'                 : 'rspec-result'
\ }
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'exec': '%c %o --color --tty %s%a',
  \ 'outputter/buffer/filetype': 'rspec-result',
  \ 'filetype'                 : 'rspec-result'
\ }

function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
  nnoremap <expr><silent> <Space>lr "<Esc>:QuickRun -args :" . line(".") . "<CR>"
endfunction

autocmd BufReadPost *_spec.rb call RSpecQuickrun()

"---------------------------
" syntastic
"---------------------------
let g:syntastic_javascript_checkers = ['eslint'] "jsの構文チェックにはESLintを使う
let g:syntastic_mode_map = { 'mode': 'passive' }
" jsファイルの保存時に自動で構文解析を行い、errorの場合にはlightlineに表示する
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.js call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

"---------------------------
" vim-fugitive
"---------------------------
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"-------------------------
" Vim基本設定
"-------------------------
set encoding=utf-8
set fileencoding=utf-8

set showmatch         " 括弧の対応をハイライト
set number            " 行番号を表示
set ruler             " カーソル位置を右下に表示
set wrap              " 画面幅で折り返さない
set display=lastline
set cursorline        " カーソル行をハイライト
set wildmenu          " コマンド補完を強化
set laststatus=2      " ステータスを2行表示に

set selection=exclusive
set clipboard=unnamed,autoselect

set list
set listchars=tab:>\

" No beep sound
set visualbell t_vb=
" 前行へのBackspace許可など
set backspace=indent,eol,start

" コメント文字列の自動挿入を無効化
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" ファイルタイプの自動検出、ファイルタイプ用のプラグイン、インデントの設定を自動読込を有効にする
filetype plugin indent on

" ---------- backup and undo ----------
set nobackup
set noundofile

" ---------- Search ----------
set wrapscan          " 最後まで検索したら先頭へ戻る
set ignorecase        " 大文字小文字無視
set smartcase         " 大文字ではじめたら大文字小文字無視しない
set hlsearch          " 検索文字をハイライト

" ---------- Tab ----------
set expandtab         " Tabを半角スペースに置き換える
set tabstop=2         " Tabを押した時の半角スペースの数
set shiftwidth=2
set softtabstop=2

" ---------- KeyMap ----------
nnoremap <Esc><Esc> :<C-u>noh<Return>
nnoremap gb gT
nnoremap <C-e> :NERDTreeToggle<Return>
nnoremap <C-n> :tabnew<CR>

" カーソル位置の数字インクリメント、デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
inoremap <C-c> <Esc>

vnoremap <C-c> <Esc>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-d> <Del>
