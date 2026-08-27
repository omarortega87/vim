" ── Markdown ──────────────────────────────────────────────────
let g:vim_markdown_folding_style = 0
let g:vim_markdown_override_foldtext = 1
autocmd FileType md setlocal foldenable foldcolumn=0
autocmd FileType md setlocal foldmethod=manual
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = ['css', 'javascript', 'python', 'java']

autocmd FileType md nmap <buffer> <leader>p :MarkdownPreview<CR>
autocmd FileType md nmap <buffer> <leader>ps :MarkdownPreviewStop<CR>
