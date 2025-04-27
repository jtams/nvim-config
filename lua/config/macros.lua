-- Log currently selected
-- <leader>'l
vim.keymap.set("v", "<leader>'l", function()
	-- Get visual selection
	vim.cmd('normal! "vy')
	local selection = vim.fn.getreg("v")

	-- Get current filetype
	local filetype = vim.bo.filetype

	-- Define log format based on filetype
	local log_statement = ""

	if
		filetype == "javascript"
		or filetype == "typescript"
		or filetype == "javascriptreact"
		or filetype == "typescriptreact"
	then
		log_statement = 'console.log("' .. selection .. ':", ' .. selection .. ")"
	elseif filetype == "go" then
		log_statement = 'log.Printf("' .. selection .. ': %v\\n", ' .. selection .. ")"
	elseif filetype == "python" then
		log_statement = 'print(f"' .. selection .. ": {" .. selection .. '}")'
	elseif filetype == "lua" then
		log_statement = 'print("' .. selection .. ':", ' .. selection .. ")"
	elseif filetype == "c" then
		log_statement = 'printf("' .. selection .. ': %d\\n", ' .. selection .. ")"
	elseif filetype == "cpp" then
		log_statement = 'std::cout << "' .. selection .. ': " << ' .. selection .. " << std::endl;"
	elseif filetype == "bash" then
		log_statement = 'echo "' .. selection .. ": " .. selection .. '"'
	elseif filetype == "rust" then
		log_statement = 'println!("{}: {:?}", ' .. selection .. ");"
	elseif filetype == "zig" then
		log_statement = 'std.debug.print("{}: {}\n", .{ "' .. selection .. '", ' .. selection .. " });"
	else
		-- Default to JavaScript-style logging
		log_statement = 'console.log("' .. selection .. ':", ' .. selection .. ")"
	end

	-- Insert log statement below
	vim.api.nvim_put({ log_statement }, "l", true, true)
end, { desc = "Log selection based on filetype" })

-- Log error if error exists
-- <leader>'e
vim.keymap.set("n", "<leader>'e", function()
	local insert = {}
	local filetype = vim.bo.filetype

	if filetype == "go" then
		table.insert(insert, "if err != nil {")
		table.insert(insert, 'log.Printf("Error: %v\\n", err)')
		table.insert(insert, "}")
	end

	-- Insert the lines
	local start_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_put(insert, "l", true, true)
	local end_line = start_line + #insert

	-- Auto-indent the inserted lines
	vim.cmd(string.format("%d,%d normal! ==", start_line, end_line))
end)
