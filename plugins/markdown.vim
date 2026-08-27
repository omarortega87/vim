" ── Markdown ──────────────────────────────────────────────────
autocmd FileType markdown setlocal nofoldenable foldlevel=99
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = ['css', 'javascript', 'python', 'java']

autocmd FileType markdown nmap <buffer> <leader>p :MarkdownPreview<CR>
autocmd FileType markdown nmap <buffer> <leader>ps :MarkdownPreviewStop<CR>
