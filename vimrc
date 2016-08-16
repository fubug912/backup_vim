" vimrc.bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
" --------------------------------------------------------------------

" YouCompleteMe 代码补全
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set completeopt=longest,menu  "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif  "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"   "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0  "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2  " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>   "force recomile with syntastic
nmap <F4> :YcmDiags<CR>
"nnoremap <leader>lo :lopen<CR>  "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处"

" solarized 主题
syntax enable
if has('gui_running')
      set background=light
else
      set background=dark
endif
colorscheme solarized

nmap <F8> :TagbarToggle<CR> "tagbar

" Easymotion 快速跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" 缩进提示
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" highlight tabs and trailing spaces
"set list
"set listchars=tab:>-,trail:-,extends:>,precedes:<

" 快速注释
"let g:NERDSpaceDelims=1 " 注释的时候自动加个空格

" --------------------------------------------------------------------
set nocompatible                       " 关闭兼容模式
set backspace=2                        " Backspace deletes like most programs in insert mode
set laststatus=2                       " set status line
let g:airline_powerline_fonts=1        " enable powerlline-fonts
set number                             " 显示行号
syntax on                              " 语法高亮
"set tabstop=2                          " tab大小
set shiftwidth=3                       " 缩进大小
set expandtab                          " 把'\t' 转换成空格
set softtabstop=3                      " 修改一个'\t'字符转换成N(3)个空格
set incsearch                          " 开启实时搜索
set ignorecase                         " 搜索时不敏感大小写
"set wildmenu                           " vim 自带命令行模式补全
:set pastetoggle=<F2>                  " F2 切换paste模式(处理粘贴文本的格式问题)
set si                                 " 自动缩进                               
set hlsearch                           " 高亮搜索
filetype plugin indent on              "开启文件类型检测
