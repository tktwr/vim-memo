if exists("g:loaded_memo")
  finish
endif
let g:loaded_memo = 1

call memo#init()

augroup ag_memo
  autocmd!
  autocmd FileType memo    call memo#map()
  autocmd FileType memo    call memo#highlight()
augroup END

command! -nargs=? Memo call memo#open(<q-args>)

