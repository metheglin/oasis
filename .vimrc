set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set shiftwidth=2 " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"set paste "paste時に自動インデントされないようにする
set number "行番号を表示する
set title " タイトルを表示
set showmatch " 対応括弧を表示

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" カラー設定 (solarized:https://github.com/altercation/solarized)
syntax enable
set background=dark
colorscheme solarized

" ============================
" NeoBundle
" ============================
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
        \   'insert' : 1,
        \ }}
endif

NeoBundleLazy 'Shougo/unite.vim', {
      \   'autoload' : {
      \       'commands' : [ "Unite", "UniteWithBufferDir", "UniteWithCurrentDir" ]
      \   }
      \}
"NeoBundleLazy 'Shougo/neosnippet', {
"      \ 'autoload' : {
"      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
"      \   'filetypes' : 'snippet',
"      \   'insert' : 1,
"      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
"      \ }}
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}
NeoBundle 'tsukkee/unite-tag'
"NeoBundleLazy 'tsukkee/unite-tag', {
"      \ 'depends' : ['Shougo/unite.vim'],
"      \ 'autoload' : {
"      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
"      \ }}

NeoBundle 'szw/vim-tags'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" vim tags
let g:vim_tags_project_tags_command = "ctags --langmap=RUBY:.rb --exclude='*.js'  --exclude='.git*' -R ."
let g:vim_tags_gems_tags_command = "ctags --langmap=RUBY:.rb --exclude='*.js' -R `bundle show --paths` 2>/dev/null"
set tags+=tags
