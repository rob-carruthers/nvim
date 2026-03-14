return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			custom_filter = function(bufnr)
				local name = vim.api.nvim_buf_get_name(bufnr)

				-- hide directory buffers
				if vim.fn.isdirectory(name) == 1 then
					return false
				end

				return true
			end,
			diagnostics = "nvim_lsp",
			show_close_icon = false,
			separator_style = "slant",
		}
	}
}
