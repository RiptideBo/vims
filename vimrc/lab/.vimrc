" windows vim基本配置"

"打开gvim自动窗口最大化"
set guioptions-=T 

au GUIEnter * simalt ~x

set nocompatible
set encoding=utf-8
set guifont=courier_new:h16

set background=dark
set termguicolors

set fileencodings=utf-8,gbk,usc-bom,cp936,gb2312,gb18030

set ruler
set number
set showmatch
set showcmd
set cursorline

set nowrap
set nobackup
set noswapfile

"自动对齐"
set cindent
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start

syntax enable
syntax on

set splitbelow
set splitright

" GDB path
" let g:ConqueGdb_GdbExe = 'E:/Program\ Files\ \(x86\)/mingw/mingw64/bin/gdb'
" let g:ConqueGdb_GdbExe = 'E:\gdb_'

"配置插件部分"

nmap gs :so $HOME/.vimrc <CR>

let plugdir=$HOME.'/vimfiles/plugged'
call plug#begin(plugdir)
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'rakr/vim-one'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
" Plug 'vim-scripts/Conque-GDB'
call plug#end()



" 打开文件目录树
map <C-n> :NERDTreeToggle<CR>


" 注释
" 增加空格
let g:NERDSpaceDelims=1


" tagbar
let g:tagbar_autoclose = 1
map cm :TagbarToggle<CR>

" tabular


" 主题
let g:airline_theme='one'
colorscheme one


" c++语法高亮vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


" syntastic conf
map <C-F8> :SyntasticCheck<CR>
map <C-F7> :SyntasticReset<CR>

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"打开时不检查
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '-E'
" use following to fliter some warning or error report
" let g:syntastic_python_pylint_args = '--disable=F401,E231,E225,W0613,W0611,W0614,W0621,C0103'


"配置clang-format"
let g:clang_format#auto_format=1
"let g:clang_format#auto_format_on_insert_leave=1
autocmd FileType c,cpp ClangFormatAutoEnable
map mf :ClangFormat<CR>



let g:clang_format#style_options={
                        \"AccessModifierOffset" :                 -4,
                        \"AllowShortIfStatementsOnASingleLine" :  "false",
                        \"AllowShortBlocksOnASingleLine" :        "false",
                        \"AllowShortLoopsOnASingleLine" :         "false",
                        \"AllowShortFunctionsOnASingleLine" :     "false",
                        \"AlwaysBreakTemplateDeclarations" :      "true",
                        \"Standard" :             "C++11",
                        \"BreakBeforeBraces" :    "Custom",
                        \"BraceWrapping" :        { "AfterControlStatement":  "true", "AfterClass":  "true", "AfterStruct" :  "true", "AfterFunction":  "true", "BeforeElse" :  "true", "BeforeCatch" :  "true"},
                        \"FixNamespaceComments":  "true"}

" YouCompleteMe
" 文件白名单
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "python":1,
			\ }
" 跳转快捷键
" nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
" nnoremap <c-h> :YcmCompleter GoToDefinition<CR>| 
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|

"ycm_extra_conf.py文件位置，针对c++
let g:ycm_confirm_extra_conf = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = $HOME.'/vimfiles/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 主动补全, 默认为<C-Space>, C++函数不会自动补全，需要invoke来手动唤醒语义补全
let g:ycm_key_invoke_completion = '<C-r>'
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_identifier_candidate_chars = 2

let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
let g:ycm_key_list_stop_completion = ['<C-y>']
"
" 不显示函数的预览
" set completeopt=menu,menuone
set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1
" g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

" 设置ycm支持的文件文件大小,太大了会卡
let g:ycm_disable_for_files_larger_than_kb = 1024


"编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! %<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'python' 
        exec "!python %" 
    elseif &filetype == 'sh'
       exec "%.sh" 
    endif
endfunc


map <F6> :call RunApp()<CR>
func! RunApp()
    exec "w"
    exec "! %<"
endfunc


"生成调试信息
map <F4> :call Debug()<CR>
func! Debug()
    if &filetype == 'c'
        exec "!gcc -g % -o %<"
        exec "!gdb %<"
    elseif &filetype == 'cpp'
        exec "!g++ -g % -o %<"
        exec "!gdb %<"
    endif
endfunc


"
" if has('win32')    
	" au GUIEnter * simalt ~x
" else    
	" au GUIEnter * call MaximizeWindow()
" endif 
 
" function! MaximizeWindow()    
	" silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
" endfunction





