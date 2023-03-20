"------------------------------------------------------
" private func
"------------------------------------------------------
let s:memo_winname = '\[memo\]'
let s:memo_bin_dir = expand('<sfile>:p:h:h')."/bin"
let s:memo_tags_files = []

func! s:Settings()
  if s:memo_tags_files != []
    return
  endif

  if exists("g:memo_tags_files")
    let s:memo_tags_files = g:memo_tags_files
  endif

  for i in s:memo_tags_files
    exec printf("set tags+=%s", i)
  endfor
endfunc

func! s:ListTags()
  let files = ""
  for i in s:memo_tags_files
    let files .= printf("-t=%s ", i)
  endfor

  setlocal modifiable
  silent %d _
  let cmd = printf("0r!%s/memo.sh -c=%d %s -p", s:memo_bin_dir, winwidth(0), files)
  silent exec cmd
  normal 1G
  setlocal nomodifiable
endfunc

func! s:OpenTag(tagname, winnr=0)
  let winnr = vis#window#VisFindEditor(a:winnr)
  call vis#window#goto(winnr)

  "exec "below stjump" a:tagname
  exec "tag" a:tagname
  exec "normal z\<CR>"
endfunc

func! s:PreviewTag(tagname, winnr=0)
  let prev_winnr = winnr()
  call s:OpenTag(a:tagname, a:winnr)
  exec prev_winnr."wincmd w"
endfunc

" make a [memo] window
func! s:MakeMemoWindow()
  let s:memo_winnr = bufwinnr(s:memo_winname)
  if s:memo_winnr == -1
    silent exec "edit" s:memo_winname
    setlocal filetype=memo
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal buflisted
    setlocal noswapfile
    setlocal readonly
    setlocal tabstop=8
    let s:memo_winnr = bufwinnr(s:memo_winname)
  else
    exec s:memo_winnr . "wincmd w"
  endif
endfunc

"------------------------------------------------------
" public func
"------------------------------------------------------
func! memo#init()
  call s:Settings()
endfunc

func! memo#open(tagname)
  call s:Settings()
  call s:MakeMemoWindow()
  call s:ListTags()
  if (!empty(a:tagname))
    call s:OpenTag(a:tagname)
  endif
endfunc

func! memo#map()
  if (vis#sidebar#inside())
    nnoremap <buffer> l     :call <SID>PreviewTag(expand("<cWORD>"), -2)<CR>
  else
    nnoremap <buffer> <silent> l W
  endif

  nnoremap <buffer> <silent> h B

  nnoremap <buffer> <silent> <CR> :call <SID>OpenTag(expand("<cWORD>"))<CR>

  nnoremap <buffer> 2     :call <SID>OpenTag(expand("<cWORD>"), 2)<CR>
  nnoremap <buffer> 3     :call <SID>OpenTag(expand("<cWORD>"), 3)<CR>
  nnoremap <buffer> 4     :call <SID>OpenTag(expand("<cWORD>"), 4)<CR>
  nnoremap <buffer> 5     :call <SID>OpenTag(expand("<cWORD>"), 5)<CR>
  nnoremap <buffer> 6     :call <SID>OpenTag(expand("<cWORD>"), 6)<CR>
  nnoremap <buffer> 7     :call <SID>OpenTag(expand("<cWORD>"), 7)<CR>
  nnoremap <buffer> 8     :call <SID>OpenTag(expand("<cWORD>"), 8)<CR>
  nnoremap <buffer> 9     :call <SID>OpenTag(expand("<cWORD>"), 9)<CR>
endfunc

