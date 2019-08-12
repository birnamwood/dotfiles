"==========================================
"  プラグイン
"==========================================
call plug#begin('~/.vim/plugged')
  Plug ('tomasr/molokai')
  Plug ('tpope/vim-endwise')
  Plug ('scrooloose/nerdtree')
  Plug ('alvan/vim-closetag')
  Plug ('mattn/emmet-vim')
  Plug ('Shougo/unite.vim')
  Plug ('Shougo/neocomplete.vim')
  Plug ('Shougo/neosnippet')
  Plug ('Shougo/neosnippet-snippets')
  Plug ('basyura/unite-rails')
  Plug ('tpope/vim-rails')
  Plug ('Yggdroot/indentLine')
  Plug ('osyo-manga/vim-monster')
  Plug ('tpope/vim-commentary')
  "Plug ('Shougo/deoplete.nvim')
  "Plug ('Shougo/deoplete-rct')
  "Plug ('roxma/vim-hug-neovim-rpc')
  "Plug ('roxma/nvim-yarp')
  "Plug ('')
call plug#end()
"=========================================
"===表示設定==="
syntax on		"コードに色を付ける"
set noswapfile  "スワップファイルを作成しない
set nu			"行番号表示"
set title		"タイトル表示"
set showmatch		"括弧のペア表示"
set list		"空白の可視化"
set visualbell		"ビープ音視覚表示"
set laststatus=2	"ステータス表示"
set ruler		"カーソル位置"
set pumheight=10	"補完メニュー"
set display=lastline	"１行が長くても表示"
set lines=60  "window縦"
set columns=115	"window横"
set wildmenu	"コマンド補完"
set cursorline "カーソル行ハイライト

"===カラー設定==="
colorscheme molokai
set background=dark

"===文字==="
set fenc=utf-8	"文字コード指定"
set virtualedit=onemore	"カーソルを行末＋１まで移動可能に"
set autoindent	"自動インデント"
set smartindent	"オートインデント"
set tabstop=2	"tabを空白２つに"
set shiftwidth=2	"自動インデント時空白２つ"
set expandtab
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%	"不可視文字表示"
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
let &t_ti.="\e[5 q" "カーソルの形状を変更
let &t_SI.="\e[5 q"
set clipboard+=unnamed "レジスタのデータをクリップボードに

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする

"===== マウス設定 =====
set mouse=a
set ttymouse=xterm2

"jキーを二度押しでESCキー
inoremap <silent> jj <Esc>
inoremap <silent> っj <ESC>

""inoremap { {}<LEFT>
""inoremap " ""<LEFT>
""inoremap ' ''<LEFT>
""inoremap [ []<LEFT>

"===== その他 =====
"履歴を10000件保存
set history=10000

"===Terminal===
set splitbelow
set termwinsize=20x0

"===NERDTree==="
map <C-t> :NERDTreeToggle<CR>

"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
"menu表示数
let g:neocomplete#max_list = 50

"===vim-monster設定
" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"
" Or let g:monster#completion#solargraph#backend = "async_solargraph_suggest"
" With neocomplete.vim
let g:neocomplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
" With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
" Or let g:monster#completion#solargraph#backend = "async_solargraph_suggest"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}


" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"Enterキーで選択する <CR>: close popup and save indent.
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_cr_function()<CR>


"============================================================
" vim-rails
"============================================================
""{{{
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END
"}}}
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip
"===
"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>

  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}

"==================================
" タブ機能強化
"==================================
"" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

