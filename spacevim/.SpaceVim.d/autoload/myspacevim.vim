" myspacevim#before 将在读取用户配置后执行
func! myspacevim#before() abort
    " 焦点消失的时候自动保存
    au FocusLost * :wa
    au FocusGained,BufEnter * :checktime

    " 当文件被其他编辑器修改时，自动加载
    set autowrite
    set autoread

    "noremap 用于建立键盘映射
    noremap J 5j
    noremap K 5k

    " 每次按下R就可以刷新令文件生效了
    map S :w!<CR>
    map s :<nop>
    map Q :q<CR>
    map R :source $MYVIMRC<CR>

    "==============================  插件配置  ==============================
    "------------------------------  vimtex config  ------------------------------
    " ===
    " === vimtex config
    " === 
    let g:tex_flavor = 'latex'
    ""是否开启自动报错，值为0代表不出现自动报错，可以手动:copen来查看错误
    "let g:vimtex_quickfix_mode = 0

    " ===
    " === skim pdf config
    " === 这样配置后，我们就可以通过 vimtex 默认的 \lv 快捷键（在按住 \ 的时候，连续点击 l 和 v）来正向同步当前 Neovim 光标位置到 PDF 预览位置，也可以通过「Ctrl + 点击 PDF 预览相应位置」来反向同步 Neovim 光标位置了
    let g:vimtex_view_general_viewer
    \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'

    " This adds a callback hook that updates Skim after compilation
    let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

    let g:vimtex_compiler_progname='nvr'

    " 设置反向搜索时需要定位到nvim中打开的tex窗口
    function! SetServerName()
      if has('win32')
        let nvim_server_file = $TEMP . "/curnvimserver.txt"
      else
        let nvim_server_file = "/tmp/curnvimserver.txt"
      endif
      let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
      call system(cmd)
    endfunction

    augroup vimtex_common
        autocmd!
        autocmd FileType tex call SetServerName()
    augroup END

    " 使用命令:VimtexTocToggle 即可唤出vimtex自动生成的TOC
    let g:vimtex_toc_config = {
    \ 'name' : 'TOC',
    \ 'layers' : ['content', 'todo', 'include'],
    \ 'split_width' : 25,
    \ 'todo_sorted' : 0,
    \ 'show_help' : 1,
    \ 'show_numbers' : 1,
    \}
    
endf


" mysapcevim#after将在 VimEnter autocmd 之后执行
func! myspacevim#after() abort
  noremap J 5j
  echo "after"
endf
