return {
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = false },
				-- ensure these language parsers are installed
				ensure_installed = {
                    "html",
                    "css",
                    "javascript",
                    "tsx",
                    "comment",
                    "c",
					"yaml",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"python",
					"java",
                    "vimdoc",
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				-- auto install above language parsers
				auto_install = true,

                additional_vim_regex_highlighting = false,
			})
		end
}
