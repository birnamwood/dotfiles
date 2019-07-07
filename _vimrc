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
  "Plug ('')
  "Plug ('')
call plug#end()
"=========================================
"===表示設定==="
syntax on		"コードに色を付ける"
set nu			"行番号表示"
set title		"タイトル表示"
set showmatch		"括弧のペア表示"
set list		"空白の可視化"
set visualbell		"ビープ音視覚表示"
set laststatus=2	"ステータス表示"
set ruler		"カーソル位置"
set pumheight=10	"補完メニュー"
set display=lastline	"１行が長くても表示"
set lines=65	"window縦"
set columns=160	"window横"
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


"===== その他 =====
"履歴を10000件保存
set history=10000

"===Terminal===
set splitbelow
set termwinsize=10x0

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
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"Enterキーで選択する <CR>: close popup and save indent.
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_cr_function()<CR>



