vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

-- Treesitter
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.wo[0][0].foldlevel = 99
	end,
})

-- Auto install languages
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local ok = pcall(vim.treesitter.start)
		if not ok then
			local available = require("nvim-treesitter.parsers")
			if available[ev.match] then
				require("nvim-treesitter").install({ ev.match }):wait(30000)
				pcall(vim.treesitter.start)
			end
		end
	end,
})

-- Text Objects
local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

for _, mode in ipairs({ "x", "o" }) do
	vim.keymap.set(mode, "af", function()
		select.select_textobject("@function.outer", "textobjects")
	end)
	vim.keymap.set(mode, "if", function()
		select.select_textobject("@function.inner", "textobjects")
	end)
	vim.keymap.set(mode, "ac", function()
		select.select_textobject("@class.outer", "textobjects")
	end)
	vim.keymap.set(mode, "ic", function()
		select.select_textobject("@class.inner", "textobjects")
	end)
end

vim.keymap.set({ "n", "x", "o" }, "]m", function()
	move.goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	move.goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]M", function()
	move.goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
	move.goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[m", function()
	move.goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	move.goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[M", function()
	move.goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
	move.goto_previous_end("@class.outer", "textobjects")
end)
