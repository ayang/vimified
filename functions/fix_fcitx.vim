" If you are using linux and fcitx, add this line into after.vimrc
" source ~/.vim/functions/fix_fcitx.vim

if exists('loaded_fix_fcitx') || &cp
  finish
endif
let loaded_fix_fcitx = 1

let w:insert_input_active = 0

function FcitxLeaveInsert()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let w:insert_input_active = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function FcitxEnterInsert()
    if !exists("w:insert_input_active")
        let w:insert_input_active = 0
    endif
    if w:insert_input_active != 0
        let l:a = system("fcitx-remote -o")
        let w:insert_input_active = 0
    endif
endfunction

autocmd InsertLeave * call FcitxLeaveInsert()
autocmd InsertEnter * call FcitxEnterInsert()
set timeoutlen=15
