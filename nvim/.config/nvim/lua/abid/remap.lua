vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
-- vim.keymap.set('n', '<leader>b', ':ls<CR>:b<Space>')
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>bn', vim.cmd.bnext)
vim.keymap.set('n', '<leader>bb', vim.cmd.bprevious)
vim.keymap.set('n', '<leader>bc', vim.cmd.bwipeout)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- vim.cmd('inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "<CR>"')
-- vim.cmd('command! -nargs=? Fold :call     CocAction(\'fold\', <f-args>)')

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
-- vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
-- vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
-- vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
-- vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
-- vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window
-- function _G.show_docs()
--     local cw = vim.fn.expand('<cword>')
--     if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
--         vim.api.nvim_command('h ' .. cw)
--     elseif vim.api.nvim_eval('coc#rpc#ready()') then
--         vim.fn.CocActionAsync('doHover')
--     else
--         vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
--     end
-- end
-- vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- function _G.check_back_space()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end
--
-- local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
-- vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
-- vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
-- vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

vim.keymap.set('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", function() require("trouble").toggle("document_diagnostics") end)
