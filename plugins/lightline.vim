" ── Lightline ─────────────────────────────────────────────────
let g:lightline = {
  \ 'colorscheme': 'everforest',
  \ 'active': {
  \   'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'] ],
  \   'right': [ ['lineinfo'], ['percent'], ['filetype', 'cocstatus'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'cocstatus': 'CocStatus'
  \ },
  \ }

function! CocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, ' E:' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, ' W:' . info['warning'])
  endif
  return len(msgs) ? join(msgs, ' ') : ''
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
