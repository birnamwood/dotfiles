call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
call plug#end()

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
set lines=50	"window縦"
set columns=150	"window横"

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



