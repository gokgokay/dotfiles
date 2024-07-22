local M = {}

M.Map = function(mode, hls, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, hls, rhs, options)
end

return M
