" ── NERDTree ──────────────────────────────────────────────────
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', '\.git$']
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
