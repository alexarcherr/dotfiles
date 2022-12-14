
-- Change tab to be 2 spaces not 8
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

-- Конфиг ale + eslint
vim.g.ale_fixers = { javascript= { 'eslint' } }
vim.g.ale_sign_error = '❌'
vim.g.ale_sign_warning = '⚠️'
vim.g.ale_fix_on_save = 1
-- Запуск линтера, только при сохранении
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
vim.opt.colorcolumn = '80'              -- Разделитель на 80 символов
vim.opt.cursorline = true               -- Подсветка строки с курсором
vim.opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
vim.opt.number = true                   -- Включаем нумерацию строк
vim.opt.relativenumber = true           -- Вкл. относительную нумерацию строк
vim.opt.so=999                          -- Курсор всегда в центре экрана
vim.opt.undofile = true                 -- Возможность отката назад
vim.opt.splitright = true               -- vertical split вправо
vim.opt.splitbelow = true               -- horizontal split вниз

-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
vim.cmd([[
filetype indent plugin on
syntax enable
]])

vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 4        -- shift 4 spaces when tab
vim.opt.tabstop = 4           -- 1 tab == 4 spaces
vim.opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
-- vim.cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
--
-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------
-- Запоминает где nvim последний раз редактировал файл
vim.cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

-- sql autocompletion from vim-dadbod-completion 
vim.cmd [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} }) ]]

-- Source is automatically added, you just need to include it in the chain complete list
-- Make sure `substring` is part of this list. Other items are optional for this completion source
-- vim.g.completion_chain_complete_list = { 'sql': [{'complete_items': ['vim-dadbod-completion']},], }
vim.g.completion_chain_complete_list = { sql = {{ mode = 'omni'},},}

vim.g.completion_matching_strategy_list = {'exact', 'substring'}
-- Useful if there's a lot of camel case items
vim.g.completion_matching_ignore_case = 1


-- new command Utf8FromBytes convert utf8 bytecodes to chars 
-- https://vi.stackexchange.com/questions/2299/how-to-translate-unicode-escape-sequences-to-the-unicode-character
vim.cmd [[command -range Utf8FromBytes s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g]]

