vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- use {'neoclide/coc.nvim', branch = 'release'}

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use {'ojroques/nvim-bufdel'}

    use 'AlexvZyl/nordic.nvim'

    use ('hrsh7th/nvim-cmp')
    use ('williamboman/mason.nvim')
    use ('williamboman/mason-lspconfig.nvim')

    use ('neovim/nvim-lspconfig')
    use ('hrsh7th/cmp-nvim-lsp')
    use ('hrsh7th/cmp-buffer')
    use ('hrsh7th/cmp-path')
    use ('hrsh7th/cmp-cmdline')
    -- find mason

    use ('L3MON4D3/LuaSnip')
    use ('saadparwaiz1/cmp_luasnip')

    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

	use({
		"epwalsh/obsidian.nvim",
		tag = "*",  -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			require("obsidian").setup({
				workspaces = {{
					name = "zettelkasten",
					path = "~/workspace/notes/zettelkasten",
					on_new_note = "ObsidianNew notes",
				}},
				new_notes_location = "~/workspace/notes/zettelkasten",
			})
		end,
	})

end)
