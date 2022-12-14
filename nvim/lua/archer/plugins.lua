vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
-- Auto run sync if first time install
        if packer_bootstrap then
            require('packer').sync()
        end

    -- Color schemes
    --use 'ii14/onedark.nvim'
    -- use 'bluz71/vim-nightfly-colors'
    use 'ellisonleao/gruvbox.nvim'  -- gruvbox port for neovim
    -- use {'dracula/vim', as = 'dracula'}
    --use 'Mofiqul/dracula.nvim'

    --- Информационная строка внизу
    use { 'nvim-lualine/lualine.nvim',
      requires = 'nvim-tree/nvim-web-devicons',
      config = function() 
        require('lualine').setup {} end
    }

    -- Tabs
    use { 'akinsho/bufferline.nvim',
      tag = 'v3.*',
      requires = 'nvim-tree/nvim-web-devicons',
      config = function() require'bufferline'.setup {} end
    }


    -- Navigation

    -- File namager
    use { 'nvim-tree/nvim-tree.lua',
      requires = 'nvim-tree/nvim-web-devicons',
      cmd = "NvimTreeToggle",
      config = function() require'nvim-tree'.setup {} end
    }


    -- Навигация внутри файла по классам и функциям
    use 'majutsushi/tagbar'


    -- Замена fzf и ack
    use { 'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require'telescope'.setup {} end 
    }

    use 'nvim-telescope/telescope-fzf-native.nvim' 

    use { 'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
      -- require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        require'hop'.setup {}
      end
    }  

    -----------------------------------------------------------
    -- LSP и автодополнялка
    -----------------------------------------------------------

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    -- When nvim-treesitter updates, there might be breaking changes to corresponding parsers being used.
    -- Make sure parsers are automatically updated whenever nvim-treesitter is installed/updated.
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
      -- run = ':TSUpdate', opt = true 
    })


    -- Managing & Installing Language Servers, Linters & Formatters
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim' -- Bridges gap b/w mason & lspconfig
    use 'neovim/nvim-lspconfig'             -- Easy way to configure lsp servers
    use 'williamboman/nvim-lsp-installer'
    use 'glepnir/lspsaga.nvim'              -- Enhanced uis for lsp
    use 'jose-elias-alvarez/null-ls.nvim'   -- Easy way to configure formatters & linters
    use 'jayp0521/mason-null-ls.nvim'       -- Bridges gap b/w mason & null-ls
    use 'MunifTanjim/prettier.nvim'

    -- Autocompletion

    use 'hrsh7th/nvim-cmp'          -- Completion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'        -- Completion source for text in current buffer
    use 'hrsh7th/cmp-path'          -- Filesystem autocompletion




    -- Snippets plugin

    use 'saadparwaiz1/cmp_luasnip'  -- Completion source for snippet autocomplete

    use { 'L3MON4D3/LuaSnip',       -- Snippet engine
      tag = "v<CurrentMajor>.*",
      config = function() require("luasnip.loaders.from_snipmate").lazy_load() end,
    }


    -- HTML и CSS
    -- Подсвечивает закрывающий и откры. тэг. Если, где-то что-то не закрыто, то не подсвечивает.
    use 'idanarye/breeze.vim'
    -- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1>
    use 'alvan/vim-closetag'
    -- Подсвечивает #ffffff
    use 'ap/vim-css-color'

    -- sql
    use {
      'kristijanhusak/vim-dadbod-ui',
      requires = { 'tpope/vim-dadbod' } 
    }
    use { 'kristijanhusak/vim-dadbod-completion' }

    -----------------------------------------------------------
    -- РАЗНОЕ
    -----------------------------------------------------------
    -- Даже если включена русская раскладка vim команды будут работать
    use 'powerman/vim-plugin-ruscmd'
    -- 'Автоформатирование' кода для всех языков
    use 'Chiel92/vim-autoformat'
    -- ]p - вставить на строку выше, [p - ниже, [<space> and ]<space> which create blank lines above and below the current line respectively
    use 'tpope/vim-unimpaired'
    --- popup окошки
    -- use 'nvim-lua/popup.nvim'
    use 'kylechui/nvim-surround'
    -- Считает кол-во совпадений при поиске
    use 'google/vim-searchindex'
    -- Стартовая страница, если просто набрать vim в консоле
    use 'mhinz/vim-startify'
    -- Комментирует по gc все, вне зависимости от языка программирования
    use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end }
    -- Обрамляет строку в теги по ctrl- y + ,
    use 'mattn/emmet-vim'
    -- Закрывает автоматом скобки
    use 'cohama/lexima.vim'

    use 'tpope/vim-dotenv'

    -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
      'dense-analysis/ale',
      ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
      cmd = 'ALEEnable',
      config = 'vim.cmd[[ALEEnable] ]'
    }

    -- Git plugins

    -- git changes colorization 
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Fugitive for Git
    use { 'tpope/vim-fugitive' }

    use {'andymass/vim-matchup', event = 'VimEnter'}

    -- for zettelkasten
    use {'tibabit/vim-templates'}

    use 'christoomey/vim-tmux-navigator'            -- Navigating Between Neovim Windows and Tmux

    use 'onsails/lspkind.nvim'                      -- adds vscode-like pictograms to neovim built-in lsp

    -- Zettelkasten support
    use { 'renerocksai/telekasten.nvim',
      requires = { 'renerocksai/calendar-vim' }
    }

  end
)

--[[

  use {'michal-h21/vim-zettel',
    requires = {'vimwiki/vimwiki','junegunn/fzf','junegunn/fzf.vim'}
  }

  -- run code inide vim
  use {'jpalardy/vim-slime'}

  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}


PHP Plugins for test - https://thevaluable.dev/vim-php-ide/

ctags generation
    ludovicchabant/vim-gutentags
Essentials plugins
  bfredl/nvim-miniyank
  moll/vim-bbye
  itchyny/lightline.vim
  tpope/vim-commentary
  tpope/vim-abolish
Project management plugins
  amiorin/vim-project
Syntax plugins
  StanAngeloff/php.vim
  stephpy/vim-php-cs-fixer
Autocompletion plugins
  ncm2/ncm2
  phpactor/phpactor
  phpactor/ncm2-phpactor
Searching / replacing plugins & tools
  https://github.com/junegunn/fzf
  junegunn/fzf.vim
  https://github.com/BurntSushi/ripgrep
  https://github.com/wincent/ferret
Code Quality plugin
  neomake/neomake
Refactoring / code styling plugins
  adoy/vim-php-refactoring-toolbox
  stephpy/vim-php-cs-fixer
  phpactor/phpactor
Outline plugin
  majutsushi/tagbar
  Debugger plugin
  joonty/vdebug
PHPDoc generation plugins
  tobyS/vmustache
  tobyS/pdv

-- https://habr.com/ru/company/avito/blog/682962/
--
-- " Language
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'j-hui/fidget.nvim'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'ray-x/lsp_signature.nvim'
	
	" Debug and test
	Plug 'mfussenegger/nvim-dap'
	Plug 'leoluz/nvim-dap-go'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'nvim-neotest/neotest'
	Plug 'nvim-neotest/neotest-go'

	" Base
	Plug 'folke/todo-comments.nvim'
	Plug 'akinsho/toggleterm.nvim'
	Plug 'antoinemadec/FixCursorHold.nvim'

	" View 
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'Mofiqul/vscode.nvim'
	
	" Navigation
	Plug 'karb94/neoscroll.nvim'
   Plug 'akinsho/bufferline.nvim'
	Plug 'preservim/tagbar'

	" Git
	Plug 'ThePrimeagen/git-worktree.nvim'
	Plug 'TimUntersberger/neogit'

	" Edit
	Plug 'windwp/nvim-autopairs'
	Plug 'numToStr/Comment.nvim'

]]--
