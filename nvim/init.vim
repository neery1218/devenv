call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'supermaven-inc/supermaven-nvim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hail2u/vim-css3-syntax'
" Plug 'puremourning/viminspector'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-expand-region'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }

" Language settings
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '0xripleys/move.vim'

Plug 'cakebaker/scss-syntax.vim'

Plug 'airblade/vim-rooter'
call plug#end()

set termguicolors
set background=dark
colorscheme gruvbox

" lua require("supermaven-nvim").setup({})
" call supermaven-nvim#setup()

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_mocha'


" Internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" =============================================================================
" # COC settings
" =============================================================================
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#cancel() : "\<C-y>"

" Coc diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gdo <Plug>(coc-definition)
nmap gds :sp<CR> <Plug>(coc-definition)
nmap gdv :vsp<CR> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap qf  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
" nmap qf  <Plug>(coc-fix-current)

" Use T to show documentation in preview window.
nnoremap <silent> T :call <SID>show_documentation()<CR>

function! s:show_documentation()
  call CocActionAsync('doHover')
  " if (index(['vim','help'], &filetype) >= 0)
  "   execute 'h '.expand('<cword>')
  " elseif (coc#rpc#ready())
  "   call CocActionAsync('doHover')
  " else
  "   execute '!' . &keywordprg . " " . expand('<cword>')
  " endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>e  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>co  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>x  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Markdown preview
" map <Leader>m :CocCommand markdown-preview-enhanced.openPreview <CR>
map <space>me :vsp <Bar> :CocCommand rust-analyzer.expandMacro <CR>

" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set nofoldenable
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
" set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
" set colorcolumn=120 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" =============================================================================
" # Misc shortcuts
" =============================================================================
"
let mapleader = "\<Space>"
map <Leader>w :w<CR>
noremap <C-y> "*y

" Visual selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

map <Leader>gt :GitGutterToggle <Bar> :set number! <CR>

" maybe i should delete these lmao
set expandtab shiftwidth=2
autocmd FileType scss setl iskeyword+=@-@

set number

" Edit vimrc
nnoremap <Leader>ce :e $MYVIMRC<CR>
" Reload vimrc
nnoremap <Leader>cr :source $MYVIMRC<CR>

if !exists("g:initial_root_directory")
  let g:initial_root_directory = system('pwd')
endif

" Ctrl+g to stop searching
nnoremap <C-a> :nohlsearch<cr>

let g:copilot_assume_mapped = 1


" =============================================================================
" # Pane settings
" =============================================================================
"
map <C-L> <C-W>l
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k

map <S-L> <C-W>l
map <S-h> <C-W>h
map <S-j> <C-W>j
map <S-k> <C-W>k

" =============================================================================
" # Split settings
" =============================================================================
"
set splitright
set splitbelow
map y1 :sp <Bar> :vsp <Bar> :resize +15<CR>
map y2 :vsp <Bar> :vsp<CR>
map <Leader>v :vsp<CR>
map <Leader>s :sp<CR>


" =============================================================================
" # Terminal shortcuts
" =============================================================================

map <Leader>tk :execute "lcd" g:initial_root_directory <Bar> :vs term://zsh <CR>
map <Leader>th :execute "lcd" g:initial_root_directory <Bar> :sp term://zsh <CR>
map <Leader>tl :vs term://zsh <CR>
map <Leader>tj :sp term://zsh <CR>

map <Leader>tb :tabnew<CR>

" let g:coc_disable_transparent_cursor = 1

" =============================================================================
" # FZF shortcuts
" =============================================================================
let g:fzf_preview_window = ['right:50%']
let $FZF_DEFAULT_COMMAND = 'ag -U -g "" ' . g:initial_root_directory
map <Leader>af :call fzf#run(fzf#wrap({'options': ['--preview', 'cat {}'], 'source': 'ag -u -g "" ' . g:initial_root_directory}))<CR>
map <Leader>f :call fzf#run(fzf#wrap({'options': ['--preview', 'cat {}'], 'source': 'ag -g "" ' . g:initial_root_directory}))<CR>

" =============================================================================
" # Rooter Settings
" =============================================================================
let g:rooter_patterns = ['Move.toml', '.git', 'Cargo.toml']
let g:rooter_cd_cmd = 'lcd'


" =============================================================================
" # NERDTree Settings
" =============================================================================
let g:NERDTreeWinSize=50
map <Leader>nf :NERDTreeFind <CR>
map <Leader>nc :NERDTreeClose <CR>

set foldmethod=syntax

let g:airline_section_b = ''
