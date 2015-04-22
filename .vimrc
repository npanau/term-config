" VIM Configuration
" Annule la compatibilite avec l’ancetre Vi : totalement indispensable
set nocompatible

" -- Général
"Redéfinition du leader
let mapleader = ','
set history=1000 " augmente les possibilités d'undo
set undolevels=1000
set title " Modifie le titre du terminal

" -- Backups
" plus de ~ et de .swp
set nobackup
set noswapfile

" -- Affichage
set title " Met a jour le titre de votre fenetre
set relativenumber " Affiche le numero des lignes
set ruler " Affiche la position actuelle du curseur
set wrap " Affiche les lignes trop longues sur plusieurs

set scrolloff=5 " Affiche un minimum de 5 lignes autour du curseur
set sidescrolloff=5   " et 5 columns of content
set expandtab " Tabs are spaces, not tabs
set autoindent " Indent at the same level of the previous line
set shiftwidth=4 "Indente de 4 espaces
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete inden
set pastetoggle=<F2> "fn+F2 pour activer le mode PASTE
set showmatch " Show matching (){}[]

" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set list
set listchars=tab:>.,trail:•,extends:#,nbsp:• " Highlight problematic whitespace
" Remove trailing whitespaces and ^M chars

" -- Recherche
set ignorecase " Ignore la casse lors d’une recherche
set smartcase " Si une recherche contient une majuscule,
set hlsearch " Surligne les resultats de recherche
set incsearch " Surligne les resultats de recherche pendant la
"Permet d'enlever la coloration de recherche
nmap <silent> <leader>/ :let @/=""<cr>

" -- Beep
set visualbell " Empeche Vim de beeper
set noerrorbells " Empeche Vim de beeper
" Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start
" Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden

"~~~~~~~~~~~~~~~~~~~~
" Vundle
"~~~~~~~~~~~~~~~~~~~~
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'ivalkeen/vim-ctrlp-tjump.git'

Plugin 'bling/vim-airline.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'nanotech/jellybeans.vim.git'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'majutsushi/tagbar.git'

Plugin 'godlygeek/tabular.git'
"Plugin 'tpope/vim-surround.git'

" Rafraichissement auto de ctags
Plugin 'craigemery/vim-autotag'

Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-scripts/AutoClose.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic.git'

"Plugin 'Valloric/YouCompleteMe.git'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'evidens/vim-twig.git'
Plugin 'docteurklein/vim-symfony.git'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'spf13/PIV'
"Plugin 'vim-scripts/AutoComplPop.git'
Plugin 'ervandew/supertab'

Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache.git'

Plugin 'Shougo/vimproc.vim'

" Plugin 'mileszs/ack.vim.git'

" Plugin 'sjbach/lusty.git'
" Plugin 'Herzult/phpspec-vim.git'
" Plugin 'vim-scripts/bufkill.vim.git'
" Plugin 'editorconfig/editorconfig-vim.git'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'aaronj1335/underscore-templates.vim.git'
" Plugin 'mattn/emmet-vim'
" Plugin 'mustache/vim-mustache-handlebars'

Plugin 'airblade/vim-gitgutter'
" Plugin 'Lokaltog/vim-distinguished.git'
" Plugin 'kana/vim-smartinput.git'
" Plugin 'danro/rename.vim.git'
" Plugin 'lunaru/vim-less'

" Plugin 'Lokaltog/vim-powerline.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"~~~~~~~~~~~~~~~~~~~~
" Couleurs
"~~~~~~~~~~~~~~~~~~~~
" -- Couleur (Requiere le thème Solarize dans ~/.vim/colors/solarized.vim)
syntax enable " Active la coloration syntaxique
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set background=dark
colorscheme solarized
color solarized
set cursorline 
set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine


"~~~~~~~~~~~~~~~~~~~~
" NERDTREE
"~~~~~~~~~~~~~~~~~~~~
"  Toggle l'explorateur
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeWinSize = 45
let g:nerdtree_tabs_open_on_gui_startup=1

"~~~~~~~~~~~~~~~~~~~~
" Airline
"~~~~~~~~~~~~~~~~~~~~
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›' " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
    set linespace=0
endif

"~~~~~~~~~~~~~~~~~~~~
" auto completion
"~~~~~~~~~~~~~~~~~~~~
set wildmenu                        " Better completion
set wildmode=list:longest           " BASH style completion

"au FileType c,cpp,java,go,php,javascript,python,twig,xml,yml

au BufNewFile,BufRead *.tpl set ft=smarty
au BufNewFile,BufRead *.twig set ft=htmljinja

au BufNewFile,BufRead *md set ft=markdown

"au filetype javascript set omnifunc=javascriptcomplete#CompleteJS
"au filetype html set omnifunc=htmlcomplete#CompleteTags
"au filetype css set omnifunc=csscomplete#CompleteCSS
"au filetype php set omnifunc=phpcomplete#CompletePHP

"~~~~~~~~~~~~~~~~~~~~
" Ctags
"~~~~~~~~~~~~~~~~~~~~
" -- emplacement custom cTags
" pour coller avec la commande d'indexation :
" ctags -f .ctags -h '.php' -R \
" --exclude="\.svn" \
" --exclude="\.git" \
" --totals=yes \
" --tag-relative=yes \
" --PHP-kinds=+cf \
" --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
" --regex-PHP='/interface ([^ ]*)/\1/c/' \
" --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
set tags+=vendor.tags

"~~~~~~~~~~~~~~~~~~~~
" Custom mapping
"~~~~~~~~~~~~~~~~~~~~
" Déplacement d'une ligne de texte Netbeans' style ! (haut / droit / bas
" gauche.
nmap <C-j> :m +1<CR>
nmap <C-k> :m -2<CR>
nmap <C-h> <<
nmap <C-l> >>

" Switcher entre les buffers dans Airline
nmap <C-n> :bn<CR>
nmap <C-b> :bp<CR>

" Switcher entre les fenêtres
map <C-h> <C-W>h
map <C-l> <C-W>l

" -- Copier / coller globalement
map <leader>y "*y<CR>
map <leader>p "*p

" Comportement correctepour ({[]})
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Raccourci de recherche d'un mot au sein d'un fichier
" http://benfrain.com/learning-vim-front-end-coding-month/
" Usage :Se <word> <filetype>
" Résultats précédants / suivants : :cp / :cn
" :cwindow pour ouvrir la fenêtre de résultat
command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]

"~~~~~~~~~~~~~~~~~~~~
" ctrlp
"~~~~~~~~~~~~~~~~~~~~
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn))|([\/]vendor)|([\/]node_modules)|([\/]compiled)|([\/]dist)|([\/]app/lib)|([\/]bower_components)|([\/]doc)$',
  \ }

"~~~~~~~~~~~~~~~~~~~~
" ctrlptagjump
"~~~~~~~~~~~~~~~~~~~~
" Affiche la liste des tags
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1 " si 1 résultat, ouverture directe

"~~~~~~~~~~~~~~~~~~~~
" Tagbar
"~~~~~~~~~~~~~~~~~~~~
nmap <F8> :TagbarToggle<CR>

"~~~~~~~~~~~~~~~~~~~~
" YouCompleteMe
"~~~~~~~~~~~~~~~~~~~~
" Ne pas montrer la fenêtre de détail en haut
"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt = 0

"~~~~~~~~~~~~~~~~~~~~
" Multiple cursors
"~~~~~~~~~~~~~~~~~~~~
" ctrl+x
let g:multi_cursor_next_key='<C-x>'

"~~~~~~~~~~~~~~~~~~~~
" Startify //Totally useless. Priceless.
"~~~~~~~~~~~~~~~~~~~~
let g:startify_custom_header = [
\ '  _    _                       _____ _______  ',
\ ' | |  | |                     |_   _|__   __| ',
\ ' | |  | |_ __ ___   __ _ _ __   | |    | |    ',
\ ' | |  | |  _ ` _ \ / _` |  _ \  | |    | |    ',
\ ' | |__| | | | | | | (_| | | | |_| |_   | |    ',
\ '  \____/|_| |_| |_|\__,_|_| |_|_____|  |_|    ',
\ '',
\ '',
\ ]

"~~~~~~~~~~~~~~~~~~~~
" syntastic
"~~~~~~~~~~~~~~~~~~~~
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Utiliser syntastic à la demande plutôt qu'automatiquement
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"~~~~~~~~~~~~~~~~~~~~
" Supertab
"~~~~~~~~~~~~~~~~~~~~
let g:SuperTabDefaultCompletionType = "<c-n>"

"~~~~~~~~~~~~~~~~~~~~
" Neocomplete
"~~~~~~~~~~~~~~~~~~~~
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

"~~~~~~~~~~~~~~~~~~~~
" UltiSnips
"~~~~~~~~~~~~~~~~~~~~
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsDontReverseSearchPath = 1 " for override to work with Vundle

"~~~~~~~~~~~~~~~~~~~~
" PIV
"~~~~~~~~~~~~~~~~~~~~
set nofoldenable
let g:DisableAutoPHPFolding = 1

"~~~~~~~~~~~~~~~~~~~~
" PDV
"~~~~~~~~~~~~~~~~~~~~
let g:pdv_template_dir = $HOME ."/.vim/doc_templates"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"~~~~~~~~~~~~~~~~~~~~
" PHPNamespace
"~~~~~~~~~~~~~~~~~~~~
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

"~~~~~~~~~~~~~~~~~~~~
" vim-symfony configuration
"~~~~~~~~~~~~~~~~~~~~
let g:symfony_app_console_caller= "php"
let g:symfony_app_console_path= "app/console"
noremap <leader>sr :call CompleteSymfonyRouter()<CR>
noremap <leader>sc :call CompleteSymfonyContainer()<CR>
noremap <silent> <C-t> :CtrlPTag<cr>

"~~~~~~~~~~~~~~~~~~~~
" Functions
"~~~~~~~~~~~~~~~~~~~~
" -- Affichage de la règle en relatif ou en absolue en pressant fn+F3
function! NumberToggle()
  if(&relativenumber == 1)
    set number
" norelativenumber supprime la barre de nombres
  else
    set relativenumber
  endif
endfunc
nnoremap <F3> :call NumberToggle()<cr>

" Redraw screen
nmap <leader>r :redraw!<cr>

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
" Supprime les espaces inutiles à la sauvegarde
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" -- Switch la couleur du background de Solarize en pressant fn+F5 (solarize est fournit avec
"  deux couleurs une claire, une foncée)
function! BackgroundToggle()
if(&background=="light")
    syntax enable " Active la coloration syntaxique
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    set background=dark
    colorscheme solarized
    color solarized
    set cursorline 
    set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
else
    syntax enable " Active la coloration syntaxique
    let g:solarized_termcolors=256
    let g:solarized_termtrans=0
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    set background=light
    colorscheme solarized
    color solarized
    set cursorline 
    set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif
endfunc
nnoremap <F5> :call BackgroundToggle()<cr>

" Fermer proprement les buffers avec NERDTree
"Effectue une sauvegarde
"noremap fc <Esc>:call CleanClose(1)<CR>
"Ferme le bufer sans sauvegarde
noremap <leader>w <Esc>:call CleanClose(0)<CR>

function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bd".todelbufNr
endfunction

