" ======================= vim Settings =========================

filetype plugin indent on
syntax enable

"jjでコマンドモードに移動
inoremap <silent> jj <ESC>
"行番号を表示
set number
"シンタックスハイライトをon
syntax on
"行末まで検索した後行頭に戻って検索
set wrapscan
"検索結果をハイライト表示(:nohで消す)
set showmatch
"tabの代わりにスペースを使用
set expandtab
"tabキーで挿入されるスペースの数
set shiftwidth=4
"中括弧を始めた後などの改行のあと自動的にインデントを入れる
set smartindent
"インデント周りの各種機能で操作されるスペースの数
set softtabstop=4
"VimではUTF-8で文字を表示する
set encoding=utf-8
"UTF-8でファイルを読み込み、ダメだったらShift_JISを試す
set fileencodings=utf-8,sjis
"UTF-8でファイルを書き込む
set fileencodings=utf-8
"クリップボードとVimの無名レジスタを結合する
set clipboard+=unnamed
"コマンドモードでtabを使ってファイル名を補完するときに、1回目は最大共通文字列、次からは順番にファイル名を完全補完する
set wildmode=longest,full

" フォントの設定
set guifont=HackGenNerd\ 14


let mapleader = "\<Space>"

" :terminalで起動するシェルをpowershellに変更
set sh=powershell.exe

" ESCでターミナルモードからノーマルモードへ
tnoremap <Esc> <C-\><C-n>

" Space t でターミナル起動
nnoremap <silent> <Leader>t :terminal<CR>

" ターミナル起動中にSpace+tでquit
tnoremap <silent> <Leader>t <C-\><C-n>:q<CR>

" ターミナル起動時は自動的にインサートモードにする
autocmd TermOpen * startinsert
" ---------- dain.vim setting ---------------


if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein/plugin.toml'
let s:lasy_toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein/plugin-lasy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file, {'lasy': 0})
  call dein#load_toml(s:lasy_toml_file, {'lasy': 1})
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}