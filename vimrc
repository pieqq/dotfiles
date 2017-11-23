" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	     Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Pierre Equoy
" Last change:	         2016-10-11
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.
 
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Activate pathogen
"call pathogen#infect()

set shell=zsh

syntax on " Switch syntax highlighting on

"filetype plugin indent on " Enable file type detection and do language-dependent indenting.

" General Config
" ==============

set backspace=indent,eol,start " Make backspace behave in a sane manner.
"set relativenumber " Show line numbers relative to current highlighted line
set number " Show line number
set encoding=utf-8
set history=1000 " Store lots of :cmdline history
set hidden " Allow hidden buffers, don't limit to 1 file per window/split
set timeoutlen=1000 ttimeoutlen=0 " No more delay when pressing Esc <http://stackoverflow.com/questions/15550100/>
set directory=$HOME/.vim/swaps//
set backupdir=$HOME/.vim/backups//

" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Smarter cursorline: only in the current window and not when being in insert mode
" See <https://github.com/mhinz/vim-galore#smarter-cursorline>
set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" Open new split panes to right and bottom
set splitbelow
set splitright

" Disable arrow keys to move around in normal and insert modes.
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

" Don't lose selection when shifting sidewards
" See <https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards>
xnoremap <  <gv
xnoremap >  >gv

" Escape insert mode by pressing `jk` quickly
inoremap jk <Esc>

" Press Ctrl+Left/Right to switch tabs
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>

" j/k move by virtual line
" See <http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Theme and colors
" ================

"set background=dark
"colorscheme solarized

" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set ignorecase       " Ignore case when searching (needed for smartcase)
set smartcase        " http://stackoverflow.com/a/2288438/1844518

" Indentation
" ===========

" We want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=8 
set sidescrolloff=15
set sidescroll=1

" Copy & Paste
" ============

" Toggle the paste mode (to avoid auto-indentation when pasting from the clipboard)
set pastetoggle=<F2>

" Using the X clipboard as the + register
" Thanks to this, everything copied/cut from vim is automatically available
" to be pasted everywhere else (the opposite is also true)
set clipboard^=unnamedplus

" Snippets
" ========

nnoremap ,pdb A<CR>import pdb; pdb.set_trace()<ESC>

" Custom commands
" ===============

" :W - To write with root rights
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" :MakeTags to re-process tags
" from: <https://github.com/mcantor/no_plugins/blob/master/no_plugins.vim>
command MakeTags !ctags -R .
