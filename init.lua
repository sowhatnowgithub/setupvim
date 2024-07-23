
-- checkhealth plugin -> this is a useful tool to check the status of plugin
-- to set up terminal press ctrl+\. and resizse
vim.cmd([[
	set number
	set relativenumber
	set tabstop=4
	set mouse=a
	set shiftwidth=4a
	set autoindent
	colorscheme desert
]])
require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	--some other plugin
	--mason plugn
	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- automatic updater mason
	}
	--alpha-nvim
	use {
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons'},
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}
	-- nvim-lspconfig - Not needed , this a language server protocol
	use 'neovim/nvim-lspconfig'

	-- hrsh7th/cmp -> auto completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- gitgutter this is for git hub
	use 'airblade/vim-gitgutter'

	-- lualine a status box
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim:-web-devicons', opt = true }
	}
	-- nvim-visual-multi , select a word and press ctrl+n this will select the next same word and we have multicursor
	 use 'mg979/vim-visual-multi'
	-- nvim-tree , to access 'NvimTreeOpen'
	use 'nvim-tree/nvim-tree.lua'
	-- nvim-telescope , to access Telescope live_grep
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- toggleterm , this is terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
			require("toggleterm").setup()
		end
	}
	-- bufferline
	use {
  "akinsho/bufferline.nvim",
  tag = "*",
  requires = "kyazdani42/nvim-web-devicons", -- Optional for file icons
  config = function()
    require("bufferline").setup{}
  end
}
end)



	require("luasnip.loaders.from_vscode").lazy_load()

require("mason").setup()
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
     completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
     -- { name = 'nvim_lsp' },
     -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
  -- lualine config
  require('lualine').setup()
  -- nvim-tree setup
  require('nvim-tree').setup()
  require("toggleterm").setup{
  -- Your configuration options here
  size = 20, -- Default size of the terminal
  open_mapping = [[<c-\>]], -- Keybinding to open the terminal
  hide_numbers = true, -- Hide numbers in terminal
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal', -- Can be 'horizontal', 'vertical', or 'float'
}
require("bufferline").setup{
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
	left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      style = "icon",
      icon = "▎",
    },
    buffer_close_icon = "✖",
    modified_icon = "●",
    close_icon = "✖",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = false,
    offsets = {},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_buffer_default_icon = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'insert_after_current',
  }
}

