" ── General Keymaps ──────────────────────────────────────────
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>h :History<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ── FZF Keymaps Browser ───────────────────────────────────────
function! s:keymaps_sink(line)
  let cmd = matchstr(a:line, '^\S*\s*\zs\S\+')
  execute cmd
endfunction

command! -nargs=? Keymaps call fzf#run({
  \ 'source': split(execute('map'), "\n"),
  \ 'sink': function('s:keymaps_sink'),
  \ 'options': '--prompt "Keymaps> "'
  \ })

command! -nargs=? KeymapsCoc call fzf#run({
  \ 'source': filter(split(execute('map'), "\n"), 'v:val =~? "coc"'),
  \ 'sink': function('s:keymaps_sink'),
  \ 'options': '--prompt "CoC Keymaps> "'
  \ })

nnoremap <leader>m :Keymaps<CR>
nnoremap <leader>mc :KeymapsCoc<CR>
