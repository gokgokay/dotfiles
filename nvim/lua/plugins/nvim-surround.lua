return {
  -- Manage text surroundings (e.g., parentheses, quotes) +++++
	{
		"kylechui/nvim-surround",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
