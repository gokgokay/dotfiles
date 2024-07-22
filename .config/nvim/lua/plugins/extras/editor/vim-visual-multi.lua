return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			vim.g.VM_theme = "purplegray"
			vim.g.VM_set_statusline = 0
			vim.cmd([[
        let g:VM_maps = {}
        let g:VM_maps['Find Under'] = "<C-n>"

        let g:VM_maps['I BS'] = "" " disable backspace mapping
        let g:VM_maps['I CtrlC'] = "" " disable backspace mapping
      ]])
		end,
	},
}
