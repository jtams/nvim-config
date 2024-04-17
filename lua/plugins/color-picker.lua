-- Color Picker
-- Note: I would like to fork this plugin and make it more customizable
return {
	"ziontee113/color-picker.nvim",
	config = function()
		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<leader>cc", "<cmd>PickColor<cr>", opts)

		vim.keymap.set("n", "<leader>cr", "<cmd>ConvertHEXandRGB<cr>", opts)

		require("color-picker").setup({ -- for changing icons & mappings
			-- ["icons"] = { "ﱢ", "" },
			-- ["icons"] = { "ﮊ", "" },
			-- ["icons"] = { "", "ﰕ" },
			-- ["icons"] = { "", "" },
			-- ["icons"] = { "", "" },
			["icons"] = { "󰝤", "󰝤" },
			["border"] = "rounded", -- none | single | double | rounded | solid | shadow
			["keymap"] = { -- mapping example:
				["U"] = "<Plug>ColorPickerSlider5Decrease",
				["O"] = "<Plug>ColorPickerSlider5Increase",
			},
			["background_highlight_group"] = "Normal", -- default
			["border_highlight_group"] = "FloatBorder", -- default
			["text_highlight_group"] = "Normal", --default
		})


		vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
	end
}
