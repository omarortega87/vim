" ── Cucumber / Gherkin ────────────────────────────────────────

" Run the current feature file
autocmd FileType cucumber nnoremap <buffer> <leader>r :Cucumber<CR>

" Run a specific scenario (closest Scenario heading)
autocmd FileType cucumber nnoremap <buffer> <leader>R :Cucumber --line <C-r>=line('.')<CR><CR>

" Navigate between scenarios with ]] and [[
autocmd FileType cucumber nnoremap <buffer> ]] :call search('^\s*\(Scenario\|Scenario Outline\|Rule\)\>', 'W')<CR>
autocmd FileType cucumber nnoremap <buffer> [[ :call search('^\s*\(Scenario\|Scenario Outline\|Rule\)\>', 'bW')<CR>

" Jump to step definition
function! s:JumpToStepDef()
  let line = getline('.')
  let step = matchstr(line, '^\s*\(Given\|When\|Then\|And\|But\)\s\+\zs.\+')
  if empty(step)
    echo "Not a step line"
    return
  endif
  let step = substitute(step, '"[^"]*"', '{string}', 'g')
  let step = substitute(step, "'[^']*'", '{string}', 'g')
  let step = substitute(step, '\d\+', '{int}', 'g')
  let step = substitute(step, '\s\+\S\+$', ' .*', '')
  let cmd = 'rg --column --line-number --no-heading --color=always --smart-case -- ' . shellescape(step) . ' src/step-definitions/'
  call fzf#vim#grep(cmd)
endfunction

autocmd FileType cucumber nnoremap <buffer> gf :call <SID>JumpToStepDef()<CR>
autocmd FileType cucumber nnoremap <buffer> <leader>gd :call <SID>JumpToStepDef()<CR>
