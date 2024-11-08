return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
		set({ "n", "v" }, "gk", function()
			for _ = 1, vim.v.count1 do
				mc.lineAddCursor(-1)
			end
		end, { desc = "Add cursor above" })
		set({ "n", "v" }, "gj", function()
			for _ = 1, vim.v.count1 do
				mc.lineAddCursor(1)
			end
		end, { desc = "Add cursor below" })

		-- Add or skip adding a new cursor by matching word/selection
		set({ "n", "v" }, "<leader>mn", function()
			mc.matchAddCursor(1)
		end, { desc = "Add cursor to next matching word/selection" })

		set({ "n", "v" }, "<leader>mN", function()
			mc.matchAddCursor(-1)
		end, { desc = "Add cursor to previous matching word/selection" })

		-- Rotate the main cursor.
		set({ "n", "v" }, "<left>", mc.nextCursor, { desc = "Rotate cursor left" })
		set({ "n", "v" }, "<right>", mc.prevCursor, { desc = "Rotate cursor right" })

		-- Delete the main cursor.
		set({ "n", "v" }, "<leader>md", mc.deleteCursor, { desc = "Delete cursor" })

		-- Add and remove cursors with control + left click.
		set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add or remove cursor with control + left click" })

		-- Easy way to add and remove cursors using the main cursor.
		set({ "n", "v" }, "<c-m>", mc.toggleCursor, { desc = "Toggle cursor" })

		-- Clone every cursor and disable the originals.
		set({ "n", "v" }, "<leader><c-m>", mc.duplicateCursors, { desc = "Duplicate cursors" })

		set("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)

		-- bring back cursors if you accidentally clear them
		set("n", "<leader>mr", mc.restoreCursors, { desc = "Restore cursors" })

		-- Align cursor columns.
		set("n", "<leader>ma", mc.alignCursors, { desc = "Align cursors" })

		-- Split visual selections by regex.
		set("v", "S", mc.splitCursors, { desc = "Split cursors" })

		-- Append/insert for each line of visual selections.
		set("v", "I", mc.insertVisual, { desc = "Insert for each line of visual selections" })
		set("v", "A", mc.appendVisual, { desc = "Append for each line of visual selections" })

		-- match new cursors within visual selections by regex.
		set("v", "M", mc.matchCursors, { desc = "Match cursors within visual selections" })

		-- Rotate visual selection contents.
		set("v", "<leader>t", function()
			mc.transposeCursors(1)
		end, { desc = "Rotate selected content" })
		set("v", "<leader>T", function()
			mc.transposeCursors(-1)
		end, { desc = "Rotate selected content reverse" })

		-- Jumplist support
		set({ "v", "n" }, "<c-i>", mc.jumpForward)
		set({ "v", "n" }, "<c-o>", mc.jumpBackward)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
