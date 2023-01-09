" Vim syntax file
" Language: memo

"------------------------------------------------------
" syntax
"------------------------------------------------------
syn clear
" syntax is case sensitive
syn case match

syn keyword  memo_cpp             cpp
syn keyword  memo_cpp_lib         cpp_lib
syn keyword  memo_py              py
syn keyword  memo_sh              sh
syn keyword  memo_vim             vim
syn keyword  memo_git             git
syn keyword  memo_init            init
syn keyword  memo_my              my
syn keyword  memo_os              os
syn keyword  memo_prog            prog
syn keyword  memo_dev             dev

syn keyword  memo_scratchpad     scratchpad
syn keyword  memo_info           info
syn keyword  memo_diary          diary
syn keyword  memo_todo           todo

syn match    memo_tag             "\[[^]]*\]"

"------------------------------------------------------
" highlight
"------------------------------------------------------
hi MemoRed           ctermfg=167 guifg=#fb4934
hi MemoGreen         ctermfg=142 guifg=#b8bb26
hi MemoYellow        ctermfg=214 guifg=#fabd2f
hi MemoBlue          ctermfg=109 guifg=#707fd9
hi MemoPurple        ctermfg=175 guifg=#d3869b
hi MemoAqua          ctermfg=108 guifg=#8ec07c
hi MemoOrange        ctermfg=208 guifg=#fe8019

"------------------------------------------------------
" highlight link
"------------------------------------------------------
hi link memo_cpp            MemoRed
hi link memo_cpp_lib        MemoRed
hi link memo_py             MemoYellow
hi link memo_sh             MemoOrange
hi link memo_vim            MemoGreen
hi link memo_git            MemoAqua
hi link memo_init           MemoPurple
hi link memo_my             MemoBlue
hi link memo_os             MemoYellow
hi link memo_prog           MemoRed
hi link memo_dev            MemoGreen

hi link memo_scratchpad     MemoGreen
hi link memo_info           MemoRed
hi link memo_diary          MemoYellow
hi link memo_todo           MemoOrange

hi link memo_tag            MemoPurple

