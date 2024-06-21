set nocompatible

" 行号设置
set number
set relativenumber

" 状态栏设置
set laststatus=2
set noshowmode


" 语法高亮
syntax enable

" 折叠设置
set foldmethod=manual

" 搜索设置
set ignorecase
set smartcase

"插件
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'mechatroner/rainbow_csv'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'unblevable/quick-scope'

call plug#end()

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
