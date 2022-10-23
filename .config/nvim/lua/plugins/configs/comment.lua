require('Comment').setup {
	ignore = '^$'
}

-- basic mappings (enabled by default)
	-- NORMAL mode
		-- `gcc` - Toggles the current line using linewise comment
		-- `gbc` - Toggles the current line using blockwise comment
		-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
		-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
		-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
		-- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
	-- VISUAL mode
		-- `gc` - Toggles the region using linewise comment
		-- `gb` - Toggles the region using blockwise comment

-- extra mappings (enabled by default)
	-- NORMAL mode
		-- `gco` - Insert comment to the next line and enters INSERT mode
		-- `gcO` - Insert comment to the previous line and enters INSERT mode
		-- `gcA` - Insert comment to end of the current line and enters INSERT mode

-- extended mappings (disabled by default)
	-- NORMAL mode
		-- `g>[count]{motion}` - (Op-pending) Comments the region using linewise comment
		-- `g>c` - Comments the current line using linewise comment
		-- `g>b` - Comments the current line using blockwise comment
		-- `g<[count]{motion}` - (Op-pending) Uncomments the region using linewise comment
		-- `g<c` - Uncomments the current line using linewise comment
		-- `g<b`- Uncomments the current line using blockwise comment
	-- VISUAL mode
		-- `g>` - Comments the region using single line
		-- `g<` - Unomments the region using single line
