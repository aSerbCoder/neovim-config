vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {'neoclide/coc.nvim', branch = 'release'}

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    	use {'ojroques/nvim-bufdel'}

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
					path = "~/notes/zettelkasten/",
					on_new_note = "ObsidianNew notes",
				}},
				new_notes_location = "~/notes/zettelkasten/",
			})
		end,
	})

end)
