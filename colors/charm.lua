vim.cmd("highlight clear")

vim.o.termguicolors = true
vim.g.colors_name = "crush"

local c = {
	-- Charmtone surfaces
	bg = "#201F26",
	bg_alt = "#2D2C36",
	bg_high = "#3A3943",
	border = "#4D4C57",

	-- Neutrals
	subtle = "#605F6B",
	muted = "#858392",
	gray = "#BFBCC8",
	fg = "#ECEBF0",
	bright = "#F7F6FB",

	-- Main accents
	pink = "#FF60FF",
	pink_hi = "#FF84FF",

	blue = "#00A4FF",
	green = "#12C78F",
	orange = "#BF976F",
	purple = "#7272FF",

	-- State colors
	red = "#FF577D",
	yellow = "#F5EF34",
	mint = "#68FFD6",

	-- Diff backgrounds
	diff_add = "#20302B",
	diff_change = "#252B38",
	diff_delete = "#34232B",
	diff_text = "#3A3150",
}

local hl = vim.api.nvim_set_hl

local function set(group, opts)
	hl(0, group, opts)
end

local function link(group, target)
	hl(0, group, { link = target })
end

----------------------------------------------------------------------
-- Editor
----------------------------------------------------------------------

set("Normal", {
	fg = c.fg,
	bg = "NONE",
})

set("NormalNC", {
	fg = c.fg,
	bg = "NONE",
})

set("NormalFloat", {
	fg = c.fg,
	bg = c.bg_alt,
})

set("FloatBorder", {
	fg = c.border,
	bg = c.bg_alt,
})

set("FloatTitle", {
	fg = c.pink_hi,
	bg = c.bg_alt,
	bold = true,
})

set("Cursor", {
	fg = c.bg,
	bg = c.pink_hi,
})

set("CursorIM", {
	fg = c.bg,
	bg = c.pink_hi,
})

set("CursorLine", {
	bg = c.bg_alt,
})

set("CursorColumn", {
	bg = c.bg_alt,
})

set("ColorColumn", {
	bg = c.bg_alt,
})

set("LineNr", {
	fg = c.subtle,
})

set("CursorLineNr", {
	fg = c.pink_hi,
	bold = true,
})

set("SignColumn", {
	bg = "NONE",
})

set("FoldColumn", {
	fg = c.subtle,
	bg = "NONE",
})

set("Folded", {
	fg = c.muted,
	bg = c.bg_alt,
})

set("WinSeparator", {
	fg = c.border,
})

link("VertSplit", "WinSeparator")

set("Visual", {
	bg = c.bg_high,
})

set("VisualNOS", {
	bg = c.bg_high,
})

set("Search", {
	fg = c.bg,
	bg = c.orange,
})

set("IncSearch", {
	fg = c.bg,
	bg = c.pink_hi,
	bold = true,
})

set("CurSearch", {
	fg = c.bg,
	bg = c.pink_hi,
	bold = true,
})

set("MatchParen", {
	fg = c.pink_hi,
	bold = true,
})

set("NonText", {
	fg = c.border,
})

set("Whitespace", {
	fg = c.bg_high,
})

set("SpecialKey", {
	fg = c.border,
})

set("EndOfBuffer", {
	fg = c.bg,
})

set("Directory", {
	fg = c.blue,
})

set("Title", {
	fg = c.fg,
	bold = true,
})

set("Question", {
	fg = c.fg,
})

set("MoreMsg", {
	fg = c.fg,
})

set("ModeMsg", {
	fg = c.pink_hi,
	bold = true,
})

set("WarningMsg", {
	fg = c.yellow,
})

set("ErrorMsg", {
	fg = c.red,
})

----------------------------------------------------------------------
-- Statusline / tabs
----------------------------------------------------------------------

set("StatusLine", {
	fg = c.gray,
	bg = c.bg_high,
})

set("StatusLineNC", {
	fg = c.muted,
	bg = c.bg_alt,
})

set("TabLine", {
	fg = c.muted,
	bg = c.bg_alt,
})

set("TabLineFill", {
	bg = c.bg_alt,
})

set("TabLineSel", {
	fg = c.bg,
	bg = c.pink_hi,
	bold = true,
})

set("WinBar", {
	fg = c.gray,
	bg = "NONE",
})

set("WinBarNC", {
	fg = c.muted,
	bg = "NONE",
})

----------------------------------------------------------------------
-- Popup menus
----------------------------------------------------------------------

set("Pmenu", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("PmenuSel", {
	fg = c.bg,
	bg = c.pink_hi,
})

set("PmenuSbar", {
	bg = c.bg_high,
})

set("PmenuThumb", {
	bg = c.muted,
})

set("PmenuMatch", {
	fg = c.fg,
	bg = c.bg_alt,
	bold = true,
})

set("PmenuMatchSel", {
	fg = c.bg,
	bg = c.pink_hi,
	bold = true,
})

----------------------------------------------------------------------
-- Traditional Vim syntax
--
-- Intentionally restrained:
--
--   normal identifiers  white/gray
--   comments            dark gray
--   keywords            blue
--   strings             orange
--   functions           green
--   types               purple
--   special/builtins    pink
--
-- Most other things remain neutral.
----------------------------------------------------------------------

set("Comment", {
	fg = c.subtle,
	italic = true,
})

set("Constant", {
	fg = c.gray,
})

set("String", {
	fg = c.orange,
})

set("Character", {
	fg = c.orange,
})

set("Number", {
	fg = c.gray,
})

set("Boolean", {
	fg = c.gray,
})

set("Float", {
	fg = c.gray,
})

set("Identifier", {
	fg = c.fg,
})

set("Function", {
	fg = c.green,
})

set("Statement", {
	fg = c.blue,
})

set("Conditional", {
	fg = c.blue,
})

set("Repeat", {
	fg = c.blue,
})

set("Label", {
	fg = c.gray,
})

set("Operator", {
	fg = c.gray,
})

set("Keyword", {
	fg = c.blue,
})

set("Exception", {
	fg = c.blue,
})

set("PreProc", {
	fg = c.gray,
})

set("Include", {
	fg = c.blue,
})

set("Define", {
	fg = c.gray,
})

set("Macro", {
	fg = c.pink_hi,
})

set("PreCondit", {
	fg = c.gray,
})

set("Type", {
	fg = c.purple,
})

set("StorageClass", {
	fg = c.blue,
})

set("Structure", {
	fg = c.purple,
})

set("Typedef", {
	fg = c.purple,
})

set("Special", {
	fg = c.pink_hi,
})

set("SpecialChar", {
	fg = c.pink_hi,
})

set("Tag", {
	fg = c.purple,
})

set("Delimiter", {
	fg = c.muted,
})

set("Debug", {
	fg = c.red,
})

set("Underlined", {
	fg = c.blue,
	underline = true,
})

set("Ignore", {
	fg = c.subtle,
})

set("Error", {
	fg = c.red,
})

set("Todo", {
	fg = c.yellow,
	bold = true,
})

----------------------------------------------------------------------
-- Tree-sitter
----------------------------------------------------------------------

-- Comments
set("@comment", {
	fg = c.subtle,
	italic = true,
})

set("@comment.documentation", {
	fg = c.muted,
	italic = true,
})

set("@comment.todo", {
	fg = c.yellow,
	bold = true,
})

set("@comment.error", {
	fg = c.red,
	bold = true,
})

set("@comment.warning", {
	fg = c.yellow,
})

set("@comment.note", {
	fg = c.muted,
})

-- Strings
set("@string", {
	fg = c.orange,
})

set("@string.documentation", {
	fg = c.orange,
})

set("@string.regexp", {
	fg = c.orange,
})

set("@string.escape", {
	fg = c.pink_hi,
})

set("@string.special", {
	fg = c.orange,
})

set("@string.special.symbol", {
	fg = c.pink_hi,
})

set("@string.special.url", {
	fg = c.blue,
	underline = true,
})

set("@character", {
	fg = c.orange,
})

set("@character.special", {
	fg = c.pink_hi,
})

-- Numbers / constants: deliberately neutral
set("@number", {
	fg = c.gray,
})

set("@number.float", {
	fg = c.gray,
})

set("@boolean", {
	fg = c.gray,
})

set("@constant", {
	fg = c.gray,
})

set("@constant.builtin", {
	fg = c.pink_hi,
})

set("@constant.macro", {
	fg = c.pink_hi,
})

-- Variables: almost entirely neutral
set("@variable", {
	fg = c.fg,
})

set("@variable.builtin", {
	fg = c.pink_hi,
})

set("@variable.parameter", {
	fg = c.gray,
})

set("@variable.parameter.builtin", {
	fg = c.pink_hi,
})

set("@variable.member", {
	fg = c.fg,
})

set("@property", {
	fg = c.fg,
})

-- Functions
set("@function", {
	fg = c.green,
})

set("@function.call", {
	fg = c.green,
})

set("@function.method", {
	fg = c.green,
})

set("@function.method.call", {
	fg = c.green,
})

set("@function.builtin", {
	fg = c.pink_hi,
})

set("@function.macro", {
	fg = c.pink_hi,
})

-- Constructors are kept neutral so every `new Foo()` doesn't explode
-- into another accent color.
set("@constructor", {
	fg = c.gray,
})

-- Types
set("@type", {
	fg = c.purple,
})

set("@type.builtin", {
	fg = c.purple,
})

set("@type.definition", {
	fg = c.purple,
})

-- Attributes / decorators
set("@attribute", {
	fg = c.pink_hi,
})

set("@attribute.builtin", {
	fg = c.pink_hi,
})

-- Keywords
set("@keyword", {
	fg = c.blue,
})

set("@keyword.coroutine", {
	fg = c.blue,
})

set("@keyword.function", {
	fg = c.blue,
})

set("@keyword.operator", {
	fg = c.gray,
})

set("@keyword.import", {
	fg = c.blue,
})

set("@keyword.type", {
	fg = c.blue,
})

set("@keyword.modifier", {
	fg = c.blue,
})

set("@keyword.repeat", {
	fg = c.blue,
})

set("@keyword.return", {
	fg = c.blue,
})

set("@keyword.debug", {
	fg = c.blue,
})

set("@keyword.exception", {
	fg = c.blue,
})

set("@keyword.conditional", {
	fg = c.blue,
})

set("@keyword.conditional.ternary", {
	fg = c.gray,
})

set("@keyword.directive", {
	fg = c.blue,
})

set("@keyword.directive.define", {
	fg = c.blue,
})

-- Operators / punctuation: neutral on purpose
set("@operator", {
	fg = c.gray,
})

set("@punctuation.delimiter", {
	fg = c.muted,
})

set("@punctuation.bracket", {
	fg = c.gray,
})

set("@punctuation.special", {
	fg = c.gray,
})

-- Modules / namespaces
set("@module", {
	fg = c.fg,
})

set("@module.builtin", {
	fg = c.pink_hi,
})

set("@label", {
	fg = c.gray,
})

-- HTML / JSX / Astro
set("@tag", {
	fg = c.purple,
})

set("@tag.builtin", {
	fg = c.purple,
})

set("@tag.attribute", {
	fg = c.gray,
})

set("@tag.delimiter", {
	fg = c.muted,
})

----------------------------------------------------------------------
-- Markup
----------------------------------------------------------------------

set("@markup.heading", {
	fg = c.fg,
	bold = true,
})

set("@markup.heading.1", {
	fg = c.pink_hi,
	bold = true,
})

set("@markup.heading.2", {
	fg = c.fg,
	bold = true,
})

set("@markup.heading.3", {
	fg = c.fg,
	bold = true,
})

set("@markup.heading.4", {
	fg = c.gray,
	bold = true,
})

set("@markup.strong", {
	bold = true,
})

set("@markup.italic", {
	italic = true,
})

set("@markup.strikethrough", {
	strikethrough = true,
})

set("@markup.underline", {
	underline = true,
})

set("@markup.quote", {
	fg = c.muted,
	italic = true,
})

set("@markup.math", {
	fg = c.gray,
})

set("@markup.link", {
	fg = c.blue,
})

set("@markup.link.label", {
	fg = c.blue,
})

set("@markup.link.url", {
	fg = c.blue,
	underline = true,
})

set("@markup.raw", {
	fg = c.orange,
})

set("@markup.raw.block", {
	fg = c.orange,
})

set("@markup.list", {
	fg = c.muted,
})

set("@markup.list.checked", {
	fg = c.green,
})

set("@markup.list.unchecked", {
	fg = c.muted,
})

----------------------------------------------------------------------
-- LSP semantic tokens
----------------------------------------------------------------------

link("@lsp.type.class", "@type")
link("@lsp.type.comment", "@comment")
link("@lsp.type.decorator", "@attribute")
link("@lsp.type.enum", "@type")
link("@lsp.type.enumMember", "@constant")
link("@lsp.type.event", "@constant")
link("@lsp.type.function", "@function")
link("@lsp.type.interface", "@type")
link("@lsp.type.keyword", "@keyword")
link("@lsp.type.macro", "@function.macro")
link("@lsp.type.method", "@function.method")
link("@lsp.type.modifier", "@keyword.modifier")
link("@lsp.type.namespace", "@module")
link("@lsp.type.number", "@number")
link("@lsp.type.operator", "@operator")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.regexp", "@string.regexp")
link("@lsp.type.string", "@string")
link("@lsp.type.struct", "@type")
link("@lsp.type.type", "@type")
link("@lsp.type.typeParameter", "@type")
link("@lsp.type.variable", "@variable")

set("@lsp.mod.deprecated", {
	strikethrough = true,
})

set("@lsp.mod.readonly", {
	italic = true,
})

----------------------------------------------------------------------
-- Diagnostics
--
-- These retain strong colors because they communicate actual state.
----------------------------------------------------------------------

set("DiagnosticError", {
	fg = c.red,
})

set("DiagnosticWarn", {
	fg = c.yellow,
})

set("DiagnosticInfo", {
	fg = c.blue,
})

set("DiagnosticHint", {
	fg = c.muted,
})

set("DiagnosticOk", {
	fg = c.green,
})

set("DiagnosticUnderlineError", {
	undercurl = true,
	sp = c.red,
})

set("DiagnosticUnderlineWarn", {
	undercurl = true,
	sp = c.yellow,
})

set("DiagnosticUnderlineInfo", {
	undercurl = true,
	sp = c.blue,
})

set("DiagnosticUnderlineHint", {
	undercurl = true,
	sp = c.muted,
})

set("DiagnosticUnderlineOk", {
	undercurl = true,
	sp = c.green,
})

set("DiagnosticVirtualTextError", {
	fg = c.red,
})

set("DiagnosticVirtualTextWarn", {
	fg = c.yellow,
})

set("DiagnosticVirtualTextInfo", {
	fg = c.blue,
})

set("DiagnosticVirtualTextHint", {
	fg = c.muted,
})

set("DiagnosticVirtualTextOk", {
	fg = c.green,
})

set("DiagnosticSignError", {
	fg = c.red,
})

set("DiagnosticSignWarn", {
	fg = c.yellow,
})

set("DiagnosticSignInfo", {
	fg = c.blue,
})

set("DiagnosticSignHint", {
	fg = c.muted,
})

set("DiagnosticSignOk", {
	fg = c.green,
})

----------------------------------------------------------------------
-- Diff / Git
----------------------------------------------------------------------

set("DiffAdd", {
	bg = c.diff_add,
})

set("DiffChange", {
	bg = c.diff_change,
})

set("DiffDelete", {
	bg = c.diff_delete,
})

set("DiffText", {
	bg = c.diff_text,
})

set("Added", {
	fg = c.green,
})

set("Changed", {
	fg = c.blue,
})

set("Removed", {
	fg = c.red,
})

set("GitSignsAdd", {
	fg = c.green,
})

set("GitSignsChange", {
	fg = c.blue,
})

set("GitSignsDelete", {
	fg = c.red,
})

set("GitSignsAddNr", {
	fg = c.green,
})

set("GitSignsChangeNr", {
	fg = c.blue,
})

set("GitSignsDeleteNr", {
	fg = c.red,
})

set("GitSignsAddLn", {
	bg = c.diff_add,
})

set("GitSignsChangeLn", {
	bg = c.diff_change,
})

set("GitSignsDeleteLn", {
	bg = c.diff_delete,
})

----------------------------------------------------------------------
-- Spell checking
----------------------------------------------------------------------

set("SpellBad", {
	undercurl = true,
	sp = c.red,
})

set("SpellCap", {
	undercurl = true,
	sp = c.blue,
})

set("SpellRare", {
	undercurl = true,
	sp = c.purple,
})

set("SpellLocal", {
	undercurl = true,
	sp = c.muted,
})

----------------------------------------------------------------------
-- Blink.cmp
----------------------------------------------------------------------

set("BlinkCmpMenu", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("BlinkCmpMenuBorder", {
	fg = c.border,
	bg = c.bg_alt,
})

set("BlinkCmpMenuSelection", {
	fg = c.bg,
	bg = c.pink_hi,
})

set("BlinkCmpLabel", {
	fg = c.gray,
})

set("BlinkCmpLabelMatch", {
	fg = c.fg,
	bold = true,
})

set("BlinkCmpLabelDeprecated", {
	fg = c.subtle,
	strikethrough = true,
})

set("BlinkCmpLabelDescription", {
	fg = c.muted,
})

set("BlinkCmpLabelDetail", {
	fg = c.muted,
})

set("BlinkCmpKind", {
	fg = c.muted,
})

set("BlinkCmpSource", {
	fg = c.subtle,
})

set("BlinkCmpGhostText", {
	fg = c.subtle,
})

set("BlinkCmpDoc", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("BlinkCmpDocBorder", {
	fg = c.border,
	bg = c.bg_alt,
})

set("BlinkCmpDocSeparator", {
	fg = c.border,
	bg = c.bg_alt,
})

set("BlinkCmpDocCursorLine", {
	bg = c.bg_high,
})

set("BlinkCmpSignatureHelp", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("BlinkCmpSignatureHelpBorder", {
	fg = c.border,
	bg = c.bg_alt,
})

set("BlinkCmpSignatureHelpActiveParameter", {
	fg = c.pink_hi,
	bold = true,
})

----------------------------------------------------------------------
-- Quickfix
----------------------------------------------------------------------

set("QuickFixLine", {
	bg = c.bg_high,
})

set("qfFileName", {
	fg = c.gray,
})

set("qfLineNr", {
	fg = c.muted,
})

----------------------------------------------------------------------
-- Lazy.nvim
----------------------------------------------------------------------

set("LazyButton", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("LazyButtonActive", {
	fg = c.bg,
	bg = c.pink_hi,
})

set("LazyH1", {
	fg = c.bg,
	bg = c.pink_hi,
	bold = true,
})

set("LazyH2", {
	fg = c.fg,
	bold = true,
})

set("LazySpecial", {
	fg = c.pink_hi,
})

set("LazyReasonPlugin", {
	fg = c.muted,
})

----------------------------------------------------------------------
-- Telescope
----------------------------------------------------------------------

set("TelescopeNormal", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("TelescopeBorder", {
	fg = c.border,
	bg = c.bg_alt,
})

set("TelescopePromptNormal", {
	fg = c.fg,
	bg = c.bg_high,
})

set("TelescopePromptBorder", {
	fg = c.border,
	bg = c.bg_high,
})

set("TelescopePromptTitle", {
	fg = c.pink_hi,
	bg = c.bg_high,
	bold = true,
})

set("TelescopePreviewTitle", {
	fg = c.gray,
	bg = c.bg_alt,
	bold = true,
})

set("TelescopeResultsTitle", {
	fg = c.gray,
	bg = c.bg_alt,
	bold = true,
})

set("TelescopeSelection", {
	bg = c.bg_high,
})

set("TelescopeSelectionCaret", {
	fg = c.pink_hi,
	bg = c.bg_high,
})

set("TelescopeMatching", {
	fg = c.pink_hi,
	bold = true,
})

----------------------------------------------------------------------
-- Which-key
----------------------------------------------------------------------

set("WhichKey", {
	fg = c.pink_hi,
})

set("WhichKeyGroup", {
	fg = c.gray,
})

set("WhichKeyDesc", {
	fg = c.fg,
})

set("WhichKeySeparator", {
	fg = c.border,
})

set("WhichKeyValue", {
	fg = c.muted,
})

set("WhichKeyNormal", {
	fg = c.gray,
	bg = c.bg_alt,
})

set("WhichKeyBorder", {
	fg = c.border,
	bg = c.bg_alt,
})

----------------------------------------------------------------------
-- Indent guides / Tree-sitter context
----------------------------------------------------------------------

set("IblIndent", {
	fg = c.bg_high,
})

set("IblScope", {
	fg = c.border,
})

set("MiniIndentscopeSymbol", {
	fg = c.border,
})

set("TreesitterContext", {
	bg = c.bg_alt,
})

set("TreesitterContextLineNumber", {
	fg = c.muted,
	bg = c.bg_alt,
})

set("TreesitterContextBottom", {
	underline = true,
	sp = c.border,
})

----------------------------------------------------------------------
-- NvimTree
----------------------------------------------------------------------

set("NvimTreeNormal", {
	fg = c.gray,
	bg = "NONE",
})

set("NvimTreeNormalNC", {
	fg = c.gray,
	bg = "NONE",
})

set("NvimTreeFolderName", {
	fg = c.gray,
})

set("NvimTreeOpenedFolderName", {
	fg = c.fg,
	bold = true,
})

set("NvimTreeRootFolder", {
	fg = c.pink_hi,
	bold = true,
})

set("NvimTreeGitDirty", {
	fg = c.yellow,
})

set("NvimTreeGitNew", {
	fg = c.green,
})

set("NvimTreeGitDeleted", {
	fg = c.red,
})

----------------------------------------------------------------------
-- Neo-tree
----------------------------------------------------------------------

set("NeoTreeNormal", {
	fg = c.gray,
	bg = "NONE",
})

set("NeoTreeNormalNC", {
	fg = c.gray,
	bg = "NONE",
})

set("NeoTreeDirectoryName", {
	fg = c.gray,
})

set("NeoTreeDirectoryIcon", {
	fg = c.muted,
})

set("NeoTreeRootName", {
	fg = c.pink_hi,
	bold = true,
})

----------------------------------------------------------------------
-- Native terminal inside Neovim
----------------------------------------------------------------------

vim.g.terminal_color_0 = "#2D2C36"
vim.g.terminal_color_1 = "#FF577D"
vim.g.terminal_color_2 = "#12C78F"
vim.g.terminal_color_3 = "#F5EF34"
vim.g.terminal_color_4 = "#6B50FF"
vim.g.terminal_color_5 = "#FF60FF"
vim.g.terminal_color_6 = "#00A4FF"
vim.g.terminal_color_7 = "#BFBCC8"

vim.g.terminal_color_8 = "#4D4C57"
vim.g.terminal_color_9 = "#FF6DAA"
vim.g.terminal_color_10 = "#00FFB2"
vim.g.terminal_color_11 = "#E8FE96"
vim.g.terminal_color_12 = "#7272FF"
vim.g.terminal_color_13 = "#FF84FF"
vim.g.terminal_color_14 = "#4FBEFE"
vim.g.terminal_color_15 = "#F7F6FB"
